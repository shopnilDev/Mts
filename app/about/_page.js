"use client";

import Navbar from "@/components/Navbar";
import React, { useEffect, useState } from "react";
import Image from "next/image";

// image ====
import inteltec from "../../public/image/inteltec.png";
import axiosInstance from "@/helpers/axiosInstance";

const page = () => {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(false);

  useEffect(() => {
    const url = `/posts?term_type=page&s=about`;

    const fetchSingleProject = async () => {
      try {
        const res = await axiosInstance.get(url);
        setData(res.data.data[0]);
      } catch (error) {
        setError("Error: " + error.message);
      } finally {
        setLoading(false);
      }
    };
    fetchSingleProject();
  }, []);

  console.log(data);
  return (
    <>
      <div className="bg-gray-800 fixed w-full top-0">
        <Navbar />
      </div>

      <section className="bg-topHeaderColor">
        <div className="flex flex-col md:flex-row gap-10 items-center justify-between container mx-auto">
          <div className=" md:basis-1/2 text-white pt-28 md:pt-40 h-screen">
            <h1 className="text-4xl md:text-5xl font-semibold font-mono border-b w-fit pb-2 border-b-gray-600">
              {data?.name}
            </h1>

            <div
              className="mt-5 leading-7 font-thin"
              dangerouslySetInnerHTML={{ __html: data?.description }}
            />

            {/* <p className="mt-5 leading-7 font-thin">{data?.description}</p> */}
          </div>
          <div className="basis-1/2">
            <Image src={inteltec} className="w-full md:h-screen" />
          </div>
        </div>
      </section>
    </>
  );
};

export default page;
