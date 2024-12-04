import { fetchClient } from "@/helpers/fetchClient";
import Image from "next/image";
import Link from "next/link";

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
      <section className="bg-sectionBgColor py-14">
        <div className="max-w-screen-lg mx-auto">
          <h1 className="text-5xl text-gray-300 mb-8 font-medium">Projects</h1>

          {projects.length > 0 ? (
            <div className="grid grid-cols-2 md:grid-cols-3 md:gap-12 gap-5">
              {projects.map((project, projectIndex) => (
                <Link href={`/projects/${project?.slug}`} key={projectIndex}>
                  <article className="relative overflow-hidden rounded-md shadow-lg bg-white hover:shadow-xl duration-200 ease-in-out">
                    {/* Image Section */}
                    <figure className="w-full h-40 md:h-56 relative">
                      <Image
                        src={project.featured_image || "/image/placeholder.png"}
                        alt={`Image of project: ${project.name}`}
                        fill
                        className="rounded-t-md object-cover transition-opacity duration-200 ease-in-out hover:opacity-80"
                        // priority={projectIndex === 0}
                        sizes="(max-width: 640px) 100vw, 50vw"
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
