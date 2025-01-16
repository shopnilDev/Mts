import React from "react";
import Image from "next/image";
import { fetchClient } from "@/helpers/fetchClient";

// === images ===
import logo1 from "../public/image/brands/Inteltec Emirates Group S.webp";
import logo2 from "../public/image/brands/iPay.webp";
import logo3 from "../public/image/brands/Vodatel.webp";
import logo4 from "../public/image/brands/ftc.webp";
import logo5 from "../public/image/brands/thumbnail_image001.webp";
import logo6 from "../public/image/brands/Inteltec Emirates New.webp";
import logo7 from "../public/image/brands/GULFTEC.webp";
import AboutSection from "./AboutSection";

const Brands = async () => {
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

  return (
    <>
      <section className=" bg-white">
        <div className="flex">
          {/* Left side */}
          <div className="w-[37%] flex justify-end bg-[#DBDBDB] items-center pr-8">
            <h1 className="font-serif text-xl text-center text-[#444958] tracking-wide">
              Subsidiary of
            </h1>
          </div>
          {/* Right side */}
          <div className="flex divide-x-2 divide-slate-400 py-10">
            <div className="pr-6 pl-2">
              <Image
                src={logo1}
                alt="icon"
                width={250}
                height={250}
                className="mx-auto"
              />
            </div>
            <div className="pl-10 grid grid-cols-3">
              <Image
                src={logo2}
                alt="icon"
                width={60}
                height={40}
                className=""
              />
              <Image
                src={logo3}
                alt="icon"
                width={100}
                height={40}
                className=""
              />
              <Image
                src={logo4}
                alt="icon"
                width={100}
                height={40}
                className=""
              />
              <Image
                src={logo5}
                alt="icon"
                width={70}
                height={40}
                className=""
              />
              <Image
                src={logo6}
                alt="icon"
                width={100}
                height={40}
                className=""
              />
              <Image
                src={logo7}
                alt="icon"
                width={150}
                height={100}
                className="mt-2"
              />
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
