import Brands from "@/components/Brands";
import Header from "@/components/Header";
import Mobile_tower from "@/components/Mobile_tower";
import Partners from "@/components/Partners";
import Projects from "@/components/Projects";
import Services from "@/components/Services";
import Navbar from "@/components/Navbar";

import { getNavData } from "@/helpers/getNavbarData";
import { useCallback } from "react";

export default async function Home() {
  const { menuItems, settings } = await getNavData();

  // useCallback(()=>{})

  return (
    <>
      {/* <Top_header /> */}
      <Navbar menuItems={menuItems} settings={settings} />
      <Header />
      {/* <Banner /> */}
      <div className="-mt-64">
        <Brands />
      </div>
      <Services />
      <Partners />
      <Projects />
      <Mobile_tower />
    </>
  );
}
