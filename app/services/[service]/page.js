import Navbar from "@/components/Navbar";
import { fetchClient } from "@/helpers/fetchClient";
import { getNavData } from "@/helpers/getNavbarData";
import {
  getExtraFieldValue,
  getMetaValueByMetaName,
} from "@/helpers/metaHelpers";

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

  const extraFields = service?.extra_fields || [];
  const value = getExtraFieldValue(extraFields, "service_icon");
  // console.log("from service page, service icon", service);

  return (
    <>
      <div className="bg-[#2D2D2D] fixed w-full top-0 z-30">
        <Navbar menuItems={menuItems} settings={settings} />
      </div>
      <section className="bg-topHeaderColor px-20 mt-10">
        <div className="flex flex-col md:flex-row container mx-auto gap-20 items-center">
        {/* left side */}

          <div className=" md:basis-1/2 bg-topHeaderColor text-white h-auto ">
            <h1 className="text-4xl md:text-5xl font-semibold font-mono border-b w-fit pb-4 border-b-gray-600">
              {service?.name}
            </h1>

            <div
              className="mt-5 leading-5 font-thin"
              dangerouslySetInnerHTML={{ __html: service?.description }}
            />
          </div>
        {/* Right side */}
          <div className="md:basis-1/2 h-screen">
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
    title: "Service- Inteltec Emirates",
    description: "description-Service Inteltec Emirates",
  };
}
