import Image from "next/image";
import Navbar from "@/components/Navbar";
import Link from "next/link";
import { getNavData } from "@/helpers/getNavbarData";
import { fetchClient } from "@/helpers/fetchClient";

const page = async ({ params }) => {
  const { menuItems, settings } = await getNavData();
  const slug = params.project;

  let project;

  try {
    const url = `/post?slug=${slug}`;
    const responseData = await fetchClient(url, {
      next: {
        revalidate: 30,
      },
    });

    project = responseData?.data;
  } catch (err) {
    return (
      <div className="text-center text-red-600">
        <p>{err}</p>
        <p>
          Failed to load the Project page. Error from server, Please try again
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

      <section className="bg-topHeaderColor">
        <div>
          <div className="container mx-auto flex flex-col md:flex-row gap-10">
            <div className=" md:basis-1/2 text-white pt-28 md:pt-40 h-auto py-10">
              <div>
                <h1 className="text-3xl md:text-4xl font-semibold font-mono border-b w-fit pb-2 border-b-gray-600">
                  {project?.name}
                </h1>

                {/* <p>{JSON.stringify(project)}</p> */}
                <p className="mt-5 leading-7 font-thin">
                  Our VSAT services are ideally suited for: <br />* Corporate
                  communication (voice, video, data and internet) <br />*
                  Manufacturing and distribution (online connectivity for ERP){" "}
                  <br />
                  * Banks (for ATMs, core banking, credit card authentication
                  and disaster recovery) <br />
                  * Engineering and projects (pick-and-move solutions) <br />
                  * Village Public Telephony <br />* GSM/UMTS operators (both
                  RAN and Core network Backhauling) <br />
                </p>
              </div>
              <div className="mt-10">
                <Link
                  href={`/projects/${project?.prev_slug}`}
                  className="border p-2 text-center px-10 font-light capitalize border-r-0"
                >
                  Previous Project
                </Link>
                <Link
                  href={`/projects/${project?.next_slug}`}
                  className="border p-2 text-center px-10 font-light capitalize border-r"
                >
                  Next project
                </Link>
              </div>
            </div>
            <div className="basis-1/2 flex items-center justify-center h-screen">
              <Image
                className="w-full h-screen object-cover rounded-sm"
                width={400}
                height={400}
                layout="responsive"
                src={project?.featured_image}
                alt="projects"
              />
            </div>
          </div>
        </div>
      </section>
    </>
  );
};

export default page;
