import { getExtraFieldValue } from "@/helpers/metaHelpers";
import Image from "next/image";
import Link from "next/link";
import React from "react";

export default function ProjectCard({ project }) {
  const extraFields = project?.extraFields || [];
  const value = getExtraFieldValue(extraFields, "service_icon");
  // console.log("from service card, service icon", value);
  // console.log("from service card, ", service);

  return (
    <Link href={`/projects/${project?.slug}`} >
            <article className="relative overflow-hidden rounded-sm shadow-lg bg-white hover:shadow-xl
             duration-200 ease-in-out">
              {/* Image Section */}
              <figure className="w-full h-44 relative">
                <Image
                  src={project.featured_image}
                  alt={`Image of project: ${project.name}`}
                  fill
                  className="rounded-t-sm object-cover transition-opacity
                   duration-200 ease-in-out hover:opacity-80"
                //   priority={projectIndex === 0}
                  sizes="(max-width: 640px) 100vw, 50vw"
                />
              </figure>

              {/* Project Name */}
              <div className="px-4 py-2">
                <h2 className="text-lg font-semibold text-gray-800 text-center truncate">
                  {project.name}
                </h2>
              </div>
            </article>
          </Link>
  );
}
