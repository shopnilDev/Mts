import React from "react";
import Image from "next/image";

// === images ===
import logo1 from "../public/image/brands/Inteltec Emirates Group S.webp";
import logo2 from "../public/image/brands/iPay.webp";
import logo3 from "../public/image/brands/Vodatel.webp";
import logo4 from "../public/image/brands/ftc.webp";
import logo5 from "../public/image/brands/thumbnail_image001.webp";
import logo6 from "../public/image/brands/Inteltec Emirates New.webp";
import logo7 from "../public/image/brands/GULFTEC.webp";
import { fetchClient } from "@/helpers/fetchClient";

const Brands = async () => {
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
      <div className="mt-48  text-center py-14 ">
        <p className="text-center">
          Failed to load about page. Error from server, Please try again later.
        </p>
      </div>
    );
  }

  return (
    <>
      <section className="mt-42  bg-white">
        <div className=" flex   ">
          {/* Left side */}
          <div className="w-[37%] flex justify-end bg-[#DBDBDB] items-center pr-8 ">
            <h1 className="font-serif text-xl text-center text-[#444958] tracking-wide">
              Subsidiary of
            </h1>
          </div>
          {/* Right side */}
          <div className="flex  divide-x-2 divide-slate-400 py-14">
            <div className="pr-6 pl-2">
              <Image src={logo1} width={250} height={250} className="mx-auto" />
            </div>
            <div className="pl-10 grid grid-cols-3  ">
              <Image src={logo2} width={60} height={40} className="" />
              <Image src={logo3} width={100} height={40} className="" />
              <Image src={logo4} width={100} height={40} className="" />
              <Image src={logo5} width={70} height={40} className="" />
              <Image src={logo6} width={100} height={40} className="" />
              <Image src={logo7} width={150} height={100} className="mt-2" />
            </div>
          </div>
        </div>
      </section>

      <section className="about_inteltec py-10">
        <div className="container mx-auto">
          <h1 className="text-[56px] mb-14 text-white leading-10">
            About Inteltec{" "}
          </h1>
          <div className="md:w-1/2">
            <div
              className="text-white text-sm -tracking-tighter leading-6  md:text-lg"
              dangerouslySetInnerHTML={{ __html: data?.description }}
            />

            {/* <p className="text-white text-sm -tracking-tighter leading-6  md:text-lg">
              Inteltec is a GCC leading company in engineering and realization
              of Telecom Networks and Systems. From its inception in 1995
              Inteltec gathered a wide experience and in depth technical
              expertise that is allowing the company to provide our customers
              with professional turn key services and solutions in various
              segments of telecommunication.
            </p>
            <p className="text-white text-sm -tracking-tighter leading-6  mt-2 md:text-lg">
              Partnering with Inteltec, our clients have been able to find not
              only their immediate needs but also were able to execute their
              strategic ideas or plans in building assets network infrastructure
              (operators) or develop their on going business processes from
              whatever sector they belong to (oil, banks, public authorities
              etc.).
            </p> */}
          </div>
          <button
            className="border hover:border-[#0074BC] py-4 px-12 text-sm font-light rounded-sm
           text-white uppercase hover:bg-buttonBgColor duration-500 ease-in-out mt-5"
          >
            About us
          </button>
        </div>
      </section>
    </>
  );
};

export default Brands;
