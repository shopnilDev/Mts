import Navbar from "@/components/Navbar";
import Image from "next/image";
import { fetchClient } from "@/helpers/fetchClient";
import next from "next";
import { getNavData } from "@/helpers/getNavbarData";

const AboutPage = async () => {
  const { menuItems, settings } = await getNavData();

  let data;
  try {
    const responseData = await fetchClient(`/post?slug=about`, {
      // cache: "no-store", // disble caching
      // cache: "force-cache", // Enable caching
      next: {
        revalidate: 30,
      },
    });
    data = responseData?.data;
  } catch (err) {
    return (
      <div className="text-center text-red-600">
        <p>
          Failed to load about page. Error from server, Please try again later.
        </p>
      </div>
    );
  }

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
            {data?.name}
          </h1>
          

          <div
            className="mt-5 leading-5 text-[15px] font-thin"
            dangerouslySetInnerHTML={{ __html: data?.description }}
          />
        </div>

          {/* right side */}
          <div className="basis-1/2 flex items-center justify-center h-screen relative">
           <div className="relative w-full h-full">
            <Image
              className="object-cover rounded-sm"
              fill
              src={data?.featured_image}
              alt="projects"
            />
       </div>
      </div>
       
      </div>
    </section>
  </>
  );
};

export default AboutPage;

export function generateMetadata({ params }) {
  return {
    title: "About- Inteltec Emirates",
    description: "description- Inteltec Emirates",
  };
}
