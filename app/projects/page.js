import AllProjectsStaticPage from "@/components/AllProjectsStaticPage";
import Navbar from "@/components/Navbar";
import { getNavData } from "@/helpers/getNavbarData";

const page = async () => {
  const { menuItems, settings } = await getNavData();

  return (
    <>
      <div className="bg-[#2D2D2D] sticky w-full top-0 z-30">
        <Navbar menuItems={menuItems} settings={settings} />
      </div>
      <AllProjectsStaticPage />
    </>
  );
};

export default page;
