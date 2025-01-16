// ==== icons ====
// import logo1 from "../public/image/icons/cellular-tower.png";
import { fetchClient } from "@/helpers/fetchClient";
import ServiceCard from "./ServiceCard";

const Services = async () => {
  let services;
  try {
    const url = `/posts?term_type=services`;
    const responseData = await fetchClient(url, {
      next: {
        revalidate: 30,
      },
    });
    services = responseData?.data;
  } catch (err) {}

  return (
    <>
      <section id="services" className="relative px-10">
        <video
          src="https://video.wixstatic.com/video/f21e62_ded834d5089c4be39db624ab8cdc304d/1080p/mp4/file.mp4"
          autoPlay
          loop
          muted
          className="absolute left-0 top-0 -z-10 object-cover w-full h-full"
        ></video>
        {/* Black overlay with 0.4 opacity */}
        <div className="absolute inset-0 bg-black/80"></div>

        <div className="relative container mx-auto py-20 ">
          {/* { JSON.stringify(services) } */}{" "}
          <div className="md:grid md:grid-cols-4 md:gap-10 gap-7 grid">
            {services?.map((service, index) => (
              <ServiceCard key={index} service={service} />
            ))}
          </div>
        </div>
      </section>
    </>
  );
};

export default Services;
