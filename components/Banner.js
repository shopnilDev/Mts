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
  // console.log(mainSpeach);
  return (
    <>
      <div className="container mx-auto">
        {/* ==== banner content ====  */}

        {/* <div
          className="text-gray-400"
          dangerouslySetInnerHTML={{ __html: mainSpeach }}
        /> */}

        <div className="mt-16 md:mt-20">
          <h1 className="text-4xl md:text-7xl text-white font-semibold">
            Telco Networks...
          </h1>
          <h1 className="text-4xl md:text-7xl text-white font-semibold">
            Redefined
          </h1>
          <div className="mt-10 flex gap-5">
            <button
              className="border hover:border-[#0074BC] py-4 px-12 text-sm font-light rounded-sm
            text-white uppercase hover:bg-buttonBgColor duration-500 ease-in-out mt-5"
            >
              learn more
            </button>
            <button
              className="border border-[#0074BC] py-4 px-12 text-sm font-light rounded-sm
           text-white uppercase bg-buttonBgColor duration-500 ease-in-out mt-5"
            >
              services
            </button>
          </div>
        </div>
      </div>
    </>
  );
};

export default Banner;
