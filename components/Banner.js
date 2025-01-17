"use client";

import axiosInstance from "@/helpers/axiosInstance";
import { getMetaValueByMetaName } from "@/helpers/metaHelpers";
import React, { useEffect, useState } from "react";

const Banner = () => {
  const [settings, setSettings] = useState(null);

  useEffect(() => {
    // Fetch frontend settings
    const fetchSettings = async () => {
      try {
        const res = await axiosInstance.get("/frontend/settings");
        setSettings(res.data);
      } catch (error) {
        console.error("Error fetching settings:", error.message);
      }
    };

    fetchSettings();
  }, []);

  const mainSpeach = getMetaValueByMetaName(settings, "main_speech");

  // Smooth scroll to section
  const handleScrollToSection = (sectionId) => {
    const targetSection = document.getElementById(sectionId);
    if (targetSection) {
      targetSection.scrollIntoView({ behavior: "smooth", block: "start" });
    }
  };

  return (
    <>
      <div className="container mx-auto">
        {/* ==== banner content ==== */}
        <div className="mt-16 md:mt-20">
          <h1 className="text-4xl md:text-7xl text-white font-semibold">
            {mainSpeach}
          </h1>
          <div className="mt-10 flex gap-5">
            <button
              onClick={() => handleScrollToSection("about_inteltec")}
              className="border hover:border-[#0074BC] py-4 px-12 text-sm font-light rounded-sm text-white uppercase hover:bg-buttonBgColor duration-500 ease-in-out mt-5"
            >
              Learn More
            </button>
            <button
              onClick={() => handleScrollToSection("services")}
              className="border border-[#0074BC] py-4 px-12 text-sm font-light rounded-sm text-white uppercase bg-buttonBgColor duration-500 ease-in-out mt-5"
            >
              Services
            </button>
          </div>
        </div>
      </div>
    </>
  );
};

export default Banner;
