import Navbar from "@/components/Navbar";
import { fetchClient } from "@/helpers/fetchClient";
import { getNavData } from "@/helpers/getNavbarData";
import { getExtraFieldValue } from "@/helpers/metaHelpers";
import React from "react";

export const MemberLogin = async () => {
  const { menuItems, settings } = await getNavData();

  let data;
  try {
    const responseData = await fetchClient(`/post?slug=member-login`, {
      // cache: "no-store", // disble caching
      // cache: "force-cache", // Enable caching
      next: {
        revalidate: 30,
      },
    });
    data = responseData?.data;
  } catch (err) {
    return (
      <div className="text-center text-red-600">
        <p>
          Failed to load about page. Error from server, Please try again later.
        </p>
      </div>
    );
  }

  const short_des = getExtraFieldValue(
    data?.extra_fields,
    "page_short_description"
  );
  const page_sub_title = getExtraFieldValue(
    data?.extra_fields,
    "page_sub_title"
  );

  console.log(short_des);
  return (
    <>
      {/* Navbar */}
      <div className="bg-[#2D2D2D] sticky w-full top-0 z-30">
        <Navbar menuItems={menuItems} settings={settings} />
      </div>

      {/* Main Content */}
      <div className="flex flex-col items-center justify-center min-h-screen bg-[#0b1f36] text-white">
        <div className="text-center p-8 bg-white/10 backdrop-blur-md rounded-lg shadow-lg">
          <h1 className="text-4xl font-bold mb-4">{page_sub_title}</h1>
          <p className="mb-6 text-lg text-white/80">{short_des}</p>
          <div className="space-y-4">
            <a
              href="https://wh.mtsbd.net"
              target="_blank"
              rel="noopener noreferrer"
              className="block px-8 py-4 bg-blue-600 hover:bg-blue-700 rounded-lg shadow text-lg font-semibold transition-transform hover:scale-105"
            >
              Warehouse Management Panel
            </a>
            <a
              href="https://tm.mtsbd.net"
              target="_blank"
              rel="noopener noreferrer"
              className="block px-8 py-4 bg-green-600 hover:bg-green-700 rounded-lg shadow text-lg font-semibold transition-transform hover:scale-105"
            >
              Task Management Panel
            </a>
          </div>
        </div>
      </div>
    </>
  );
};

export default MemberLogin;
