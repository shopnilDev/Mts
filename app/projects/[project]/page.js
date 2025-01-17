import Image from "next/image";
import Navbar from "@/components/Navbar";
import Link from "next/link";
import { getNavData } from "@/helpers/getNavbarData";
import { fetchClient } from "@/helpers/fetchClient";

const page = async ({ params }) => {
  const { menuItems, settings } = await getNavData();
  const slug = params.project;

  let project;
  let next_url;
  let prev_url;

  try {
    const url = `/post?slug=${slug}`;
    const responseData = await fetchClient(url, {
      next: {
        revalidate: 30,
      },
    });

    project = responseData?.data;
    next_url = responseData?.next_post_slug;
    prev_url = responseData?.previous_post_slug;
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
//  console.log("from project page , ", next_url);
//  console.log("from project page , ", prev_url);
  return (
    <>
    <div className="bg-[#2D2D2D] sticky w-full top-0 z-30">
      <Navbar menuItems={menuItems} settings={settings} />
    </div>

    <section className="bg-topHeaderColor px-20">
      <div className="container mx-auto flex flex-col md:flex-row gap-10 ">
        {/* Left Side */}
        <div className="md:basis-1/2 text-white py-20  h-auto ">
          <h1 className="text-3xl md:text-4xl font-semibold font-mono w-fit pb-4 border-b  border-b-gray-700">
            {project?.name}
          </h1>
          

          <div
            className="mt-5 leading-5  font-thin"
            dangerouslySetInnerHTML={{ __html: project?.description }}
          />

      {/* Nex navigation */}
             <div className="mt-24">
                <Link
                  href={`/projects/${prev_url}`}
                  className="border p-2 text-center px-10 font-light capitalize border-r-0"
                >
                  Previous Project
                </Link>
                <Link
                  href={`/projects/${next_url}`}
                  className="border p-2 text-center px-10 font-light capitalize border-r"
                >
                  Next project
                </Link>
              </div>
            
          
        </div>

          {/* right side */}
          <div className="basis-1/2 flex items-center justify-center h-screen relative">
           <div className="relative w-full h-full">
            <Image
              className="object-cover rounded-sm"
              fill
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
