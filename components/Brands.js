import React from "react";
import Image from "next/image";
import { fetchClient } from "@/helpers/fetchClient";
// === images ===
import logo1 from "../public/image/brands/Inteltec Emirates Group S.webp";

import AboutSection from "./AboutSection";
import { getNavData } from "@/helpers/getNavbarData";
import { getMediaLinkByMetaName } from "@/helpers/metaHelpers";

const Brands = async () => {
  const { settings } = await getNavData();
  const BrnadsLogo = getMediaLinkByMetaName(
    settings,
    "site_logo_for_sister_concerns"
  );

  let data;
  try {
    const responseData = await fetchClient(`/post?slug=about`, {
      next: {
        revalidate: 30,
      },
    });
    data = responseData?.data;
  } catch (err) {
    return (
      <div className="mt-48 text-center py-14">
        <p className="text-center">
          Failed to load about page. Error from server, Please try again later.
        </p>
      </div>
    );
  }

  let sisters;
  try {
    const url = `/posts?per_page=6&term_type=sister_concerns`;
    const responseData = await fetchClient(url, {
      next: {
        revalidate: 30,
      },
    });

    sisters = responseData?.data;
  } catch (err) {
    console.log("faild to fetch sister data");
  }

  return (
    <>
      <section className=" bg-white">
        <div className="flex h-60">
          {/* Left side */}
          <div className="w-[37%] h-full flex justify-end bg-[#DBDBDB] items-center pr-8">
            <h1 className="font-serif text-xl text-center text-[#444958] tracking-wide">
              Subsidiary of
            </h1>
          </div>
          {/* Right side */}

          <div className="flex divide-x-2 divide-slate-400 py-10">
            {/* mts logo */}
            <div className="pr-6 pl-2 ">
              {/* <Image
                src={BrnadsLogo}
                alt="icon"
                width={238}
                height={124}
                className="mx-auto"
              /> */}
            </div>

            {/* sisters concerns */}
            <div className="pl-10 grid grid-cols-2  overflow-hidden">
              {sisters?.map(
                (sister, i) =>
                  sister.featured_image && (
                    <Image
                      key={sister.name}
                      src={sister.featured_image} // Ensure this is a valid URL
                      alt={sister.name || "Sister Company"}
                      width={238}
                      height={124}
                      className="mx-auto"
                    />
                  )
              )}
            </div>
          </div>
        </div>
      </section>

      {/* Pass data to the About component */}
      <AboutSection description={data?.description} />
    </>
  );
};

export default Brands;
