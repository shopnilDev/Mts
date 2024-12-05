import { fetchClient } from "@/helpers/fetchClient";
import Image from "next/image";
import Link from "next/link";
import ProjectCard from "./ProjectCard";

const Projects = async () => {
  let projects;

  try {
    const url = `/posts?per_page=6&term_type=product`;
    const responseData = await fetchClient(url, {
      next: {
        revalidate: 30,
      },
    });

    projects = responseData?.data;
  } catch (err) {
    return (
      <section className="bg-sectionBgColor py-14">
        <div className="container mx-auto text-center">
          <h1 className="text-5xl text-gray-300 mb-8 font-medium">Projects</h1>
          <p className="text-red-500 text-lg">Failed To load Projects!</p>
        </div>
      </section>
    );
  }

  return (
    <>
      <section className="bg-sectionBgColor py-14 ">
        <div className="max-w-screen-lg mx-auto px-2 md:px-32">
          <h1 className="text-5xl text-gray-300 mb-8 font-medium">Projects</h1>

          {projects.length > 0 ? (
            <div className="grid grid-cols-2 md:grid-cols-3  gap-10">
              {projects.map((project, projectIndex) => (
                 <ProjectCard project={project} key={projectIndex}/>
              ))}
            </div>
          ) : (
            <p className="text-gray-400 text-lg text-center">
              No projects found.
            </p>
          )}

          <Link
            href={"/projects"}
            className="w-fit p-2 px-5 text-sm md:text-lg font-light rounded-sm border text-white capitalize hover:bg-white hover:text-black duration-200 ease-in-out block mx-auto mt-10"
          >
            all projects
          </Link>
        </div>
      </section>
    </>
  );
};

export default Projects;
