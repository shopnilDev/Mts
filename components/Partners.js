import React from "react";
import Image from "next/image";
import { fetchClient } from "@/helpers/fetchClient";

const Partners = async () => {
  let partners;

  try {
    const url = `/posts?per_page=10&term_type=partners`;
    const responseData = await fetchClient(url, {
      next: {
        revalidate: 30,
      },
    });

    partners = responseData?.data;
  } catch (err) {
    return (
      <section className="bg-sectionBgColor py-14">
        <div className=" mx-auto text-center">
          <h1 className="text-5xl text-gray-300 mb-8 font-medium">Partners</h1>
          <p className="text-red-500 text-lg">Failed To load Partners!</p>
        </div>
      </section>
    );
  }

  return (
    <section id="partners" className="bg-white pt-20 ">
      <div className=" mx-auto">
        <div className="container">
          <h2 className="text-5xl text-gray-600 mb-8 font-medium">Partners</h2>
        </div>
        <div className="grid grid-cols-5 border border-gray-400">
          {partners.map((partner, index) => (
            <div
              key={index}
              className="p-14 h-60 flex justify-center items-center border border-gray-400"
            >
              <Image
                src={partner?.featured_image}
                alt={`Image of project: ${partner?.name}`}
                width={150}
                height={80}
                className="object-contain max-h-16 w-auto"
              />
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};

export default Partners;
