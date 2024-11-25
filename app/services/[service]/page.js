import Navbar from "@/components/Navbar";
import { fetchClient } from "@/helpers/fetchClient";
import { getNavData } from "@/helpers/getNavbarData";

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
      <div className="bg-gray-800 fixed w-full top-0 z-30">
        <Navbar menuItems={menuItems} settings={settings} />
      </div>
      <section className="bg-topHeaderColor">
        <div className="flex flex-col md:flex-row container mx-auto gap-10">
          <div className=" md:basis-1/2 bg-topHeaderColor text-white pt-28 md:pt-40 h-auto py-10">
            <h1 className="text-4xl md:text-5xl font-semibold font-mono border-b w-fit pb-2 border-b-gray-600">
              {service?.name}
            </h1>

            <div
              className="mt-5 leading-7 font-thin"
              dangerouslySetInnerHTML={{ __html: service?.description }}
            />

            {/* <p className="mt-5 leading-7 font-thin">
              As a part of our integrated solution we conduct all the related
              civil work required to construct lattice towers, rooftop sites,
              monopoles and camouflaged towers, our activities and services:{" "}
              <br />
              1- Conducting technical site survey and determining the type of
              site structure to be installed <br />
              2- Construction of the required tower foundation which varies from
              dry raft to pilling <br />
              3- Construction of site boundary walls <br />
              4- Supply and installation of equipment shelter <br />
              5- Supply and installation of rooftop poles, Monopoles, lattice
              towers and camouflaged towers. <br />
              6- Supply and installation of grounding and lightning protection
              systems <br />
              7- Performing all the electrical work in conformity with the
              project specifications <br />
            </p>
            <p className="mt-5 leading-7 font-thin">
              Inteltec provides site acquisition (SA) services to telecom
              operators and other customers (governmental applications’
              submission and follow up) as a part of its services portfolio and
              its experienced site acquisition team has acquired an extensive
              numbers of sites for its customers. Inteltec’s site acquisition
              service includes the following distinct activities: <br />
              • Study the sites’ design milestones based on customer’s sites
              process flow, and reflecting forecasted and actual dates. <br />
              • Perform investigation in the market during and after sites’
              design time to meet with customers requirements. <br />
              • Study the project specification’s and its initial issued plan in
              order to start ranking the candidates plan for each site. <br />
              • Perform all initial surveys for all candidates in order to be in
              conformity with the project objectives. <br />
              • Finalize lease agreements with landlords in order to obtain
              rooftop GSM sites. <br />
              • Obtain all required NOCs (No Objection Certificates) from the
              relevant services‘ departments in order to proceed with sites’
              permitting process. <br />
              • Secure all required approvals and permits for sites’ locations
              from municipalities. <br />
              • Solve all problems with landlords, official authorities and any
              problems which may face other concerned departments. <br />•
              Create communications channels with any sensitive governmental
              center
            </p> */}
          </div>
          <div className="basis-1/2 h-auto">
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
