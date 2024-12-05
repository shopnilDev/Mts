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
      <div className="bg-[#2D2D2D] fixed w-full top-0">
        <Navbar menuItems={menuItems} settings={settings} />
      </div>

      <section className="bg-topHeaderColor">
        <div className="flex flex-col md:flex-row gap-40 items-center justify-between container mx-auto">
          <div className="md:basis-1/2 text-white pt-28 md:pt-40 px-20  h-screen">
            <h1 className="text-4xl md:text-5xl font-semibold font-mono border-b w-fit pb-2 border-b-gray-600">
              {data?.name}
            </h1>

            <div
              className="mt-5 leading-5 text-[14px] font-thin"
              dangerouslySetInnerHTML={{ __html: data?.description }}
            />
          </div>
          <div className="basis-1/2">
            <Image
              src={data?.featured_image}
              width={500}
              height={500}
              alt="Inteltec"
              className="w-full md:h-screen"
            />
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
