import React from "react";
import Image from "next/image";
import Link from "next/link";

// === image ====
import footerLogo from "../public/image/footer logo.webp";
import linkedin from "../public/image/LinkedIn.webp";
import inteltec from "../public/image/footer icon/Inteltec Emirates.webp";
import ipay from "../public/image/footer icon/iPay.webp";
import vodatel from "../public/image/footer icon/Vodatel.webp";
import iparama from "../public/image/footer icon/iParama.webp";
import gul from "../public/image/footer icon/GULFTEC.webp";
import ftc from "../public/image/footer icon/ftc.webp";
import { fetchClient } from "@/helpers/fetchClient";
import { getMetaValueByMetaName } from "@/helpers/metaHelpers";

const Footer = async() => {

  const settings = await fetchClient(`/frontend/settings?meta_group=Footer Section`, {
    next: { revalidate: 60 },
  });

//  Use helper methods to get the Footer Settings
  const support = getMetaValueByMetaName(settings, "footer_content");
  const copyright = getMetaValueByMetaName(settings, "bottom_footer_content");
  const contact = getMetaValueByMetaName(settings, "german_address");
  // console.log(support);

  return (
    <>
      <footer className="bg-[#ECECEC]">
        {/* Top */}
        <div className="max-w-screen-lg mx-auto py-10 text-gray-500 px-20">
          <div className="flex flex-col md:flex-row md:justify-between items-start gap-6">
            <Image src={footerLogo} width={200} height={170} alt="footerlogo" />

            <div
              className="mt-5 leading-5 "
              dangerouslySetInnerHTML={{ __html: support }}
            />

            {/* <div className="flex flex-col text-gray-500 leading-8">
              <span>
                Office 902, Mazyad Mall, Office Tower-2, <br /> MBZ City, Abu
                Dhabi
              </span>
              <span>United Arab Emirates</span>
            </div> */}


            <div className="flex flex-col gap-2  ">
            <div
              className="mt-5 leading-5 "
              dangerouslySetInnerHTML={{ __html: contact }}
            />

              {/* <span>Phone: +971 2 5545122</span>
              <span>Fax: +971 2 5545133</span>
              <span>E-mail: info@inteltec.ae</span> */}
              <Link href={"#"} className="mt-5">
                <Image src={linkedin}
                 width={80} height={80}
                alt="linkdin" />
              </Link>
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

            {/* <p className="text-sm text-center">
              Copyright © 2022 by Inteltec Emirates - Subsidiary of Inteltec
              Emirates Group. All rights reserved. Designed by{" "}
              <Link href={"#"} className="underline">
                Marketing Premiere
              </Link>
            </p> */}
          </div>
        </div>
        {/* Bottom */}
        <div className="bg-[#242323]">
      <div className="max-w-screen-lg mx-auto flex items-center justify-between flex-wrap py-3">
        <h1 className="text-white text-sm">Inteltec Emirates Group</h1>
        {/* Image components with updated API */}
        <Image src={inteltec} width={100} height={100} alt="inteltec" />
        <Image src={ipay} width={50} height={50} alt="ipay" />
        <Image src={vodatel} width={100} height={100} alt="vodatel" />
        <Image src={iparama} width={60} height={60} alt="iparama" />
        <Image src={gul} width={100} height={100} alt="gul" />
        <Image src={ftc} width={60} height={60} alt="ftc" />
      </div>
    </div>

      </footer>
    </>
  );
};

export default Footer;
