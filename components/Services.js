// "use client";

import Image from "next/image";
import Link from "next/link";

// ==== icons ====
import logo1 from "../public/image/icons/cellular-tower.png";
// import logo2 from "../public/image/icons/Satellite.png";
// import logo3 from "../public/image/icons/ip.png";
// import logo4 from "../public/image/icons/data center.png";
// import logo5 from "../public/image/icons/wireless.png";
// import logo6 from "../public/image/icons/e.png";
import { fetchClient } from "@/helpers/fetchClient";
import { getMetaValueByMetaName } from "@/helpers/metaHelpers";

const Services = async () => {
  let services;

  try {
    const url = `/posts?term_type=services`;
    const responseData = await fetchClient(url, {
      next: {
        revalidate: 30,
      },
    });

    // console.log(responseData);
    services = responseData?.data;
  } catch (err) {
    // return (
    //   <div className="text-center text-red-600">
    //     <p>{err}</p>
    //     <p>
    //       Failed to load the services . Error from server, Please try again
    //       later.
    //     </p>
    //   </div>
    // );
  }
  const shortDes = getMetaValueByMetaName(
    services,
    "service_short_description"
  );
  console.log(shortDes);

  return (
    <>
      <section className="relative">
        <video
          src="https://video.wixstatic.com/video/f21e62_ded834d5089c4be39db624ab8cdc304d/1080p/mp4/file.mp4"
          autoPlay
          loop
          muted
          className="absolute left-0 top-0 -z-10 object-cover w-full h-full"
        ></video>
        <div className="container mx-auto py-20">
          <div className="md:grid md:grid-cols-4 md:gap-10 gap-7 grid">
            {services?.map((service, index) => (
              <div
                key={index}
                className="backdrop-blur-md p-3 text-white rounded-md md:mt-20"
              >
                <Image
                  src={logo1}
                  width={35}
                  height={35}
                  alt={`${service?.name} logo`}
                />
                <h1 className="text-2xl font-bold my-2">{service?.name}</h1>
                <p>
                  {service?.description
                    ? `${service.description.slice(0, 100)}${
                        service.description.length > 100 ? "..." : ""
                      }`
                    : ""}
                </p>
                <Link
                  href={`services/${service?.slug}`}
                  className="underline mt-5 block font-semibold capitalize"
                >
                  Learn more
                </Link>
              </div>
            ))}
          </div>
        </div>
      </section>
    </>
  );
};

export default Services;
