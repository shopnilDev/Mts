import React from "react";
import Image from "next/image";
import Link from "next/link";
import { fetchClient } from "@/helpers/fetchClient";
import {
  getMediaLinkByMetaName,
  getMetaValueByMetaName,
} from "@/helpers/metaHelpers";
import { getNavData } from "@/helpers/getNavbarData";
import { BASE_URL } from "@/helpers/baseUrl";
// import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
// import {
//   faLinkedin,
//   faFacebook,
//   faTwitter,
// } from "@fortawesome/free-brands-svg-icons";
import { Facebook, Linkedin, Youtube } from "lucide-react";

const Footer = async () => {
  const { settings } = await getNavData();
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
    console.log("failed to fetch sister data");
  }

  const footer_settings = await fetchClient(
    `/frontend/settings?meta_group=Footer Section`,
    {
      next: { revalidate: 60 },
    }
  );

  // Use helper methods to get the Footer Settings
  const support = getMetaValueByMetaName(footer_settings, "footer_content");
  const copyright = getMetaValueByMetaName(
    footer_settings,
    "bottom_footer_content"
  );
  const contact = getMetaValueByMetaName(footer_settings, "german_address");
  const linkdinUrl = getMetaValueByMetaName(settings, "linkedin_url");
  const youtubeUrl = getMetaValueByMetaName(settings, "youtube_url");
  const fbUrl = getMetaValueByMetaName(settings, "facebook_url");
  const logo = getMediaLinkByMetaName(settings, "site_logoimg_id");

  return (
    <>
      <footer className="bg-[#ECECEC]">
        {/* Top */}
        <div className="max-w-screen-lg mx-auto py-10 text-gray-500 px-20">
          <div className="flex flex-col md:flex-row md:justify-between items-start gap-6">
            <Image
              src={BASE_URL + logo} // baseurl + /public/.jpg
              width={200}
              height={170}
              alt="footerlogo"
            />
            <div
              className="mt-5 leading-5 "
              dangerouslySetInnerHTML={{ __html: support }}
            />

            <div className="flex flex-col gap-2">
              <div
                className="mt-5 leading-5 "
                dangerouslySetInnerHTML={{ __html: contact }}
              />

              <div className="flex gap-3 mt-5">
                <div>
                  <Link href={linkdinUrl || "#"}>
                    <Linkedin className="text-blue-600 text-2xl hover:text-blue-800" />
                  </Link>
                </div>
                <div>
                  <Link href={fbUrl || "#"}>
                    <Facebook className="text-blue-600 text-2xl hover:text-blue-800" />
                  </Link>
                </div>
                <div>
                  <Link href={youtubeUrl || "#"}>
                    <Youtube className="text-red-600 text-2xl hover:text-red-800" />
                  </Link>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Middle */}
        <div className=" bg-[#B0B0B0] py-2 md:py-5 mt-5">
          <div className="container mx-auto justify-center flex">
            <div
              className=" leading-5 "
              dangerouslySetInnerHTML={{ __html: copyright }}
            />
          </div>
        </div>

        {/* Bottom */}
        {/* <div className="bg-[#242323]">
          <div className="max-w-screen-lg mx-auto flex items-center flex-wrap py-3">
            <h1 className="text-white text-sm mr-10">
              Mobile Tele Solutions Sisters
            </h1>

            {sisters?.map(
              (sister, i) =>
                sister.featured_image && (
                  <Image
                    key={sister.name}
                    src={sister.featured_image} // Ensure this is a valid URL
                    alt={sister.name || "Sister Company"}
                    width={100}
                    height={100}
                    className="object-contain"
                  />
                )
            )}
          </div>
        </div> */}
      </footer>
    </>
  );
};

export default Footer;
