import Image from "next/image";
import Link from "next/link";
import Navbar from "@/components/Navbar";
import { getNavData } from "@/helpers/getNavbarData";
import { fetchClient } from "@/helpers/fetchClient";

const page = async () => {
  const { menuItems, settings } = await getNavData();
  let projects;

  try {
    const url = `/posts?per_page=6&term_type=product`;
    const responseData = await fetchClient(url, {
      next: {
        revalidate: 30,
      },
    });

    projects = responseData?.data;
  } catch (err) {
    return (
      <div className="text-center text-red-600">
        <p>{err}</p>
        <p>
          Failed to load the about page. Error from server, Please try again
          later.
        </p>
      </div>
    );
  }

  return (
    <>
      <div className="bg-gray-800 fixed w-full top-0 z-30">
        <Navbar menuItems={menuItems} settings={settings} />
      </div>

      <section className="md:pt-40 pt-28 pb-10">
        <div className="container mx-auto">
          <h1 className="text-5xl text-gray-600 mb-8 font-medium ">Projects</h1>

          <div className="grid grid-cols-2 md:grid-cols-3 md:gap-12 gap-5">
            {projects.map((project, projectIndex) => (
              <Link href={`/projects/${project?.slug}`} key={projectIndex}>
                <div>
                  <Image
                    src={project.featured_image}
                    width={100}
                    height={100}
                    layout="responsive"
                    alt="project"
                    className="rounded-md object-cover w-full overflow-hidden hover:opacity-65 duration-100 ease-in-out"
                  />
                  <h1 className="bg-gray-500 w-full text-center text-white py-1">
                    {" "}
                    {project.name}{" "}
                  </h1>
                </div>
              </Link>
            ))}
            y
          </div>
          <Link
            href={"/projects"}
            className=" w-fit p-2 px-5 text-sm md:text-lg rounded-sm border-2 font-light capitalize hover:text-white hover:bg-black overflow-hidden duration-200 ease-in-out block mx-auto mt-10"
          >
            show more
          </Link>
        </div>
      </section>
    </>
  );
};

export default page;
