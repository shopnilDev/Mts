import Navbar from "@/components/Navbar";
import { fetchClient } from "@/helpers/fetchClient";
import { getNavData } from "@/helpers/getNavbarData";
import React from "react";

export const SisterConcern = async () => {
  const { menuItems, settings } = await getNavData();
  // Demo data for sister concerns
  const demoSisterConcerns = [
    {
      name: "Sister Concern 1",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      logo: "https://via.placeholder.com/100", // Replace with real logo URLs
      link: "#",
    },
    {
      name: "Sister Concern 2",
      description: "Pellentesque vitae velit ex. Mauris venenatis.",
      logo: "https://via.placeholder.com/100",
      link: "#",
    },
    {
      name: "Sister Concern 3",
      description: "Aenean vel turpis consectetur, pharetra lacus sit amet.",
      logo: "https://via.placeholder.com/100",
      link: "#",
    },
    {
      name: "Sister Concern 4",
      description: "Donec sit amet urna eget nunc porta vestibulum.",
      logo: "https://via.placeholder.com/100",
      link: "#",
    },
  ];

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
    return (
      <section className="bg-sectionBgColor py-14">
        <div className="container mx-auto text-center">
          <h1 className="text-5xl text-gray-300 mb-8 font-medium">
            Our Sister Concerns
          </h1>
          <p className="text-red-500 text-lg">
            Failed To load Sister Concerns!
          </p>
        </div>
      </section>
    );
  }

  return (
    <>
      {/* Navbar */}
      <div className="bg-[#2D2D2D] sticky w-full top-0 z-30">
        <Navbar menuItems={menuItems} settings={settings} />
      </div>

      {/* Sister Concern Section */}
      <div className="min-h-screen bg-[#0b1f36] text-white px-6 py-12">
        <div className="max-w-7xl mx-auto text-center">
          <h1 className="text-4xl font-bold mb-6">Our Sister Concerns</h1>
          <p className="mb-12 text-lg text-white/80">
            Meet our sister concerns and explore their contributions to our
            mission.
          </p>

          {/* Grid */}
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
            {sisters.map((concern, index) => (
              <div
                key={index}
                className="p-6 bg-white bg-opacity-10 rounded-lg shadow-lg hover:bg-opacity-20 transition"
              >
                <img
                  src={concern.featured_image}
                  alt={concern.name}
                  className="w-20 h-20 mx-auto mb-4 rounded-full object-cover"
                />
                <h2 className="text-2xl font-semibold mb-2">{concern.name}</h2>
                <p className="mb-4 text-sm text-white/70">
                  {concern.description}
                </p>
                <a
                  href={concern.link}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-block px-6 py-2 bg-blue-600 hover:bg-blue-700 rounded-lg text-sm font-medium transition"
                >
                  Learn More
                </a>
              </div>
            ))}
          </div>
        </div>
      </div>
    </>
  );
};

export default SisterConcern;
