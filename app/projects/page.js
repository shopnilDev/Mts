"use client";

import React, { useEffect, useState } from "react";
import Image from "next/image";
import Link from "next/link";
import Navbar from "@/components/Navbar";
import axiosInstance from "@/helpers/axiosInstance";
import { getNavData } from "@/helpers/getNavbarData";
import SkeletonCard from "@/components/SkeletonCard";

const page = () => {
  const [menuItems, setMenuItems] = useState([]);
  const [settings, setSettings] = useState({});
  const [projects, setProjects] = useState([]);
  const [meta, setMeta] = useState();
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(false);
  const [pageNo, setPageNo] = useState(1);
  const [perPage, setPerPage] = useState(3);

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

    const fetchNavData = async () => {
      try {
        const { menuItems, settings } = await getNavData();
        setMenuItems(menuItems); // Store menu items in state
        setSettings(settings); // Store settings in state
      } catch (error) {
        console.error("Failed to fetch navigation data:", error);
      }
    };

    fetchNavData();
  }, [perPage]);

  const handleSeeMore = () => {
    setPerPage((prev) => prev + 3);
  };
  const handleSeeLess = () => {
    setPerPage((prev) => prev - 3);
  };

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
      <div className=" min-h-screen">
        <p className="text-center">
          Failed To Load Projects Please Reload or Try Again
        </p>
      </div>
    );
  } else {
    content = (
      <>
        {projects.map((project, projectIndex) => (
          <Link href={`/projects/${project?.slug}`} key={projectIndex}>
            <article className="relative overflow-hidden rounded-md shadow-lg bg-white hover:shadow-xl duration-200 ease-in-out">
              {/* Image Section */}
              <figure className="w-full h-48 md:h-64 relative">
                <Image
                  src={project.featured_image}
                  alt={`Image of project: ${project.name}`}
                  layout="fill" // Ensures the image fills the container without stretching
                  objectFit="cover"
                  className="rounded-t-md transition-opacity duration-200 ease-in-out hover:opacity-80"
                  priority={projectIndex === 0} // Load first image faster (e.g., if it's the topmost in a grid)
                  sizes="(max-width: 640px) 100vw, 50vw" // Responsive image sizes for various screen widths
                />
              </figure>

              {/* Project Name */}
              <div className="p-4">
                <h2 className="text-lg font-semibold text-gray-800 text-center truncate">
                  {project.name}
                </h2>
              </div>
            </article>
          </Link>
        ))}
      </>
    );
  }

  return (
    <>
      <div className="bg-[#2D2D2D] fixed w-full top-0 z-30">
        <Navbar menuItems={menuItems} settings={settings} />
      </div>

      <section className="md:pt-40 pt-28 pb-10">
        <div className="max-w-screen-lg mx-auto">
          <h1 className="text-5xl text-gray-600 mb-8 font-medium border-gray-600 border-b  inline-block pb-2 md:pb-4 ">
            Projects
          </h1>

          <div className="grid grid-cols-2 md:grid-cols-3 md:gap-12 gap-5">
            {content}
          </div>

          {/* buttons */}

          {meta?.current_page < meta?.last_page && (
            <button
              onClick={handleSeeMore}
              href={"/projects"}
              className=" w-fit p-2 px-5 text-sm md:text-lg rounded-sm border-2 font-light capitalize hover:text-white hover:bg-black overflow-hidden duration-200 ease-in-out block mx-auto mt-10"
            >
              show more
            </button>
          )}
          {meta?.current_page === meta?.last_page && (
            <button
              onClick={handleSeeLess}
              href={"/projects"}
              className=" w-fit p-2 px-5 text-sm md:text-lg rounded-sm border-2 font-light capitalize hover:text-white hover:bg-black overflow-hidden duration-200 ease-in-out block mx-auto mt-10"
            >
              show Less
            </button>
          )}
        </div>
      </section>
    </>
  );
};

export default page;
