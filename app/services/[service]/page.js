import Image from "next/image";
import Navbar from "@/components/Navbar";
import Link from "next/link";
import { getNavData } from "@/helpers/getNavbarData";
import { fetchClient } from "@/helpers/fetchClient";

const page = async ({ params }) => {
  const { menuItems, settings } = await getNavData();
  const slug = params.service;

  let service;

  try {
    const url = `/post?slug=${slug}`;
    const responseData = await fetchClient(url, {
      next: {
        revalidate: 30,
      },
    });
    service = responseData?.data;
  } catch (err) {
    return (
      <div className="text-center text-red-600">
        <p>{err}</p>
        <p>
          Failed to load the service page. Error from server, Please try again
          later.
        </p>
      </div>
    );
  }

  return (
    <>
      <div className="bg-[#2D2D2D] fixed w-full top-0 z-30">
        <Navbar menuItems={menuItems} settings={settings} />
      </div>

      <section className="bg-topHeaderColor px-20">
        <div className="container mx-auto flex flex-col md:flex-row gap-10 mt-28 ">
          {/* Left Side */}
          <div className="md:basis-1/2 text-white py-20  h-auto ">
            <h1 className="text-3xl md:text-4xl font-semibold font-mono w-fit pb-4 border-b  border-b-gray-700">
              {service?.name}
            </h1>
            

            <div
              className="mt-5 leading-5  font-thin"
              dangerouslySetInnerHTML={{ __html: service?.description }}
            />

       
            
          </div>

          {/* Right Side (Image or Video) */}
          <div className="basis-1/2 flex items-center justify-center h-[1000px] relative">
          
            <video
              autoPlay
              muted
              loop
              className="h-full object-cover"
              src="https://video.wixstatic.com/video/f21e62_cd7709d9f13c4421a4a017f03eceebf7/1080p/mp4/file.mp4"
            ></video>
            </div>
         
        </div>
      </section>
    </>
  );
};

export default page;

export function generateMetadata({ params }) {
  return {
    title: "Service - Inteltec Emirates",
    description: "description - Service Inteltec Emirates",
  };
}
