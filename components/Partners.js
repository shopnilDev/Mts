import React from "react";
import Image from "next/image";

// logos
import logo1 from "../public/image/partners/logo1.webp";
import logo2 from "../public/image/partners/logo2.webp";
import logo3 from "../public/image/partners/logo3.webp";
import logo4 from "../public/image/partners/logo4.webp";
import logo5 from "../public/image/partners/logo5.webp";
import logo6 from "../public/image/partners/logo6.webp";
import logo7 from "../public/image/partners/logo7.webp";
import logo8 from "../public/image/partners/logo8.webp";
import logo9 from "../public/image/partners/logo9.webp";
import logo10 from "../public/image/partners/logo10.webp";

const Partners = () => {
  // Array of logos
  const logos = [
    logo1,
    logo2,
    logo3,
    logo4,
    logo5,
    logo6,
    logo7,
    logo8,
    logo9,
    logo10,
  ];

  return (
    <section className="bg-white pt-14">
      <div className="container mx-auto">
        <h2 className="text-5xl text-gray-600 mb-8 font-medium">Partners</h2>
        <div className="grid grid-cols-5 divide-x divide-y divide-black">
          {logos.map((logo, index) => (
            <div
              key={index}
              className={`p-14 flex justify-center items-center ${
                index >= 5 ? "border-t border-gray-200" : ""
              }`}
            >
              <Image
                src={logo}
                alt={`partner-logo-${index + 1}`}
                width={120}
                height={60}
                className="object-contain max-h-12 w-auto"
              />
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};

export default Partners;
