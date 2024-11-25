// "use client";

import Image from "next/image";
import Link from "next/link";

// ==== icons ====
import logo1 from "../public/image/icons/cellular-tower.png";
import logo2 from "../public/image/icons/Satellite.png";
import logo3 from "../public/image/icons/ip.png";
import logo4 from "../public/image/icons/data center.png";
import logo5 from "../public/image/icons/wireless.png";
import logo6 from "../public/image/icons/e.png";
import { fetchClient } from "@/helpers/fetchClient";

const Services = async () => {
  let services;

  try {
    const url = `posts?term_type=services`;
    const responseData = await fetchClient(url, {
      next: {
        revalidate: 30,
      },
    });
    services = responseData?.data;
  } catch (err) {
    return (
      <div className="text-center text-red-600">
        <p>{err}</p>
        <p>
          Failed to load the services . Error from server, Please try again
          later.
        </p>
      </div>
    );
  }

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
            <div className="backdrop-blur-md p-3  text-white rounded-md md:mt-20">
              <Image src={logo1} width={35} height={35} />
              <h1 className="text-2xl font-bold my-2">Towers Deployment</h1>
              <p>
                As a part of our integrated solution we conduct all the related
                civil work required to construct lattice towers, rooftop sites,
                monopoles and camouflaged towers.
              </p>
              <Link
                href={"#"}
                className="underline mt-5 block font-semibold capitalize"
              >
                Learn more
              </Link>
            </div>

            <div className="backdrop-blur-md p-3  text-white rounded-md">
              <Image src={logo2} width={35} height={35} />
              <h1 className="text-2xl font-bold my-2">
                Satellite Communication
              </h1>
              <p>
                We use the latest satellite and VSAT communication technologies
                for data, voice and video transmission. The network allows
                instant, reliable, cost-effective and secure communication.
              </p>
              <Link
                href={"#"}
                className="underline mt-5 block font-semibold capitalize"
              >
                Learn more
              </Link>
            </div>

            <div className="backdrop-blur-md p-3  text-white rounded-md md:mt-20">
              <Image src={logo3} width={35} height={35} />
              <h1 className="text-2xl font-bold my-2">IP Networks</h1>
              <p>
                Inteltec can design, deploy and upgrade networks of any
                bandwidth that meets your needs today, tomorrow and in the
                future.
              </p>
              <Link
                href={"#"}
                className="underline mt-5 block font-semibold capitalize"
              >
                Learn more
              </Link>
            </div>

            <div className="backdrop-blur-md p-3  text-white rounded-md">
              <Image src={logo4} width={35} height={35} />
              <h1 className="text-2xl font-bold my-2">Data Centers</h1>
              <p>
                Inteltec datacenter solution bridges the gap between the
                complete flexibility you get with do-it-yourself and the
                convenience of a comprehensive integrated solution.
              </p>
              <Link
                href={"#"}
                className="underline mt-5 block font-semibold capitalize"
              >
                Learn more
              </Link>
            </div>

            <div className="backdrop-blur-md p-3  text-white rounded-md md:mt-20">
              <Image src={logo4} width={35} height={35} />
              <h1 className="text-2xl font-bold my-2">RF Planning</h1>
              <p>
                IntUtilizing the top advanced simulators and planning tools used
                by highly experienced engineering teams, Inteltec is capable to
                design the different radio access technologies GSM, UMTS, WiFi,
                WiMAX and LTE.
              </p>
              <Link
                href={"#"}
                className="underline mt-5 block font-semibold capitalize"
              >
                Learn more
              </Link>
            </div>

            <div className="backdrop-blur-md p-3  text-white rounded-md">
              <Image src={logo5} width={35} height={35} />
              <h1 className="text-2xl font-bold my-2">Wireless Networks</h1>
              <p>
                Inteltec delivers partial or complete turnkey wireless telecom
                projects or services to licensed operators and service providers
                and corporate end users, to establish or enhance their network
                infrastructure.
              </p>
              <Link
                href={"#"}
                className="underline mt-5 block font-semibold capitalize"
              >
                Learn more
              </Link>
            </div>

            <div className="backdrop-blur-md p-3  text-white rounded-md md:mt-20">
              <Image src={logo6} width={35} height={35} />
              <h1 className="text-2xl font-bold my-2">Enterprise Solutions</h1>
              <p>
                Our experience in engineering and installation of network
                structures has allowed us great new opportunities.
              </p>
              <Link
                href={"#"}
                className="underline mt-5 block font-semibold capitalize"
              >
                Learn more
              </Link>
            </div>

            <div className="backdrop-blur-md p-3  text-white rounded-md">
              <Image src={logo4} width={35} height={35} />
              <h1 className="text-2xl font-bold my-2">IBS Services</h1>
              <p>
                Solutions and Services IBS Service Inteltec provides a full FTK
                service for Indoor Building Solution, starting form planning and
                site acquisition going through materials procurement and site
                implementation including all the Telecom and Civil work
                required, up to RF testing and optimization.
              </p>
              <Link
                href={"#"}
                className="underline mt-5 block font-semibold capitalize"
              >
                Learn more
              </Link>
            </div>
          </div>
        </div>
      </section>
    </>
  );
};

export default Services;
