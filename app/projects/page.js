"use client";

import React, { useEffect, useState, useCallback, useMemo } from "react";
import Image from "next/image";
import Link from "next/link";
import Navbar from "@/components/Navbar";
import axiosInstance from "@/helpers/axiosInstance";
import { getNavData } from "@/helpers/getNavbarData";
import SkeletonCard from "@/components/SkeletonCard";
import ProjectCard from "@/components/ProjectCard";

const page = () => {
  const [menuItems, setMenuItems] = useState([]);
  const [settings, setSettings] = useState({});
  const [projects, setProjects] = useState([]);
  const [meta, setMeta] = useState();
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(false);
  const [pageNo, setPageNo] = useState(1);
  const [perPage, setPerPage] = useState(3);

  // Memoized function to fetch navigation data
  const fetchNavData = useCallback(async () => {
    try {
      const { menuItems, settings } = await getNavData();
      setMenuItems(menuItems);
      setSettings(settings);
    } catch (error) {
      console.error("Failed to fetch navigation data:", error);
    }
  }, []);

  useEffect(() => {
    fetchNavData();
  }, [fetchNavData]);

  // Fetch project data
  useEffect(() => {
    const url = `posts?per_page=${perPage}&term_type=product&page=${pageNo}`;

    const fetchAllProjects = async () => {
      try {
        const res = await axiosInstance.get(url);
        setProjects(res.data.data);
        setMeta(res.data.meta);
      } catch (error) {
        setError("Error: " + error.message);
      } finally {
        setLoading(false);
      }
    };
    fetchAllProjects();
  }, [perPage]);

  const handleSeeMore = () => {
    setPerPage((prev) => prev + 3);
  };

  const handleSeeLess = () => {
    setPerPage((prev) => Math.max(prev - 3, 3));
  };

  const memoizedMenuItems = useMemo(() => menuItems, [menuItems]);
  const memoizedSettings = useMemo(() => settings, [settings]);

  let content;

  if (loading) {
    content = (
      <>
        {[...Array(6)].map((_, index) => (
          <div key={index}>
            <SkeletonCard />
          </div>
        ))}
      </>
    );
  } else if (error) {
    content = (
      <div className="min-h-screen">
        <p className="text-center">
          Failed To Load Projects Please Reload or Try Again
        </p>
      </div>
    );
  } else {
    content = (
      <>
        {projects.map((project, projectIndex) => (
         <ProjectCard project={project} key={projectIndex}/>
        ))}
      </>
    );
  }

  return (
    <>
      <div className="bg-[#2D2D2D] fixed w-full top-0 z-30">
        <Navbar menuItems={memoizedMenuItems} settings={memoizedSettings} />
      </div>

      <section className="md:pt-40 pt-28 pb-10">
        <div className="max-w-screen-lg mx-auto">
          <h1 className="text-5xl text-gray-600 mb-8 font-medium border-gray-600 border-b inline-block pb-2 md:pb-4">
            Projects
          </h1>

          <div className="grid grid-cols-2 md:grid-cols-3 md:gap-12 gap-5">
            {content}
          </div>

          {/* Buttons */}
          {meta?.current_page < meta?.last_page && (
            <button
              onClick={handleSeeMore}
              className="w-fit p-2 px-5 text-sm md:text-lg rounded-sm border-2 font-light capitalize hover:text-white hover:bg-black overflow-hidden duration-200 ease-in-out block mx-auto mt-10"
            >
              Show More
            </button>
          )}
          {meta?.current_page === meta?.last_page && perPage > 3 && (
            <button
              onClick={handleSeeLess}
              className="w-fit p-2 px-5 text-sm md:text-lg rounded-sm border-2 font-light capitalize hover:text-white hover:bg-black overflow-hidden duration-200 ease-in-out block mx-auto mt-10"
            >
              Show Less
            </button>
          )}
        </div>
      </section>
    </>
  );
};

export default page;
