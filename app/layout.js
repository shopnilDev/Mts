import { Barlow } from "next/font/google";
import "./globals.css";
import Footer from "@/components/Footer";
import Navbar from "@/components/Navbar";
// import { usePathname } from "next/navigation";
// import { getNavData } from "@/helpers/getNavbarData";

const barlow = Barlow({
  subsets: ["latin"],
  weight: ["100", "200", "300", "400", "500", "600", "700", "800", "900"],
});

export const metadata = {
  title: " Inteltec Emirates",
  description: " Inteltec Emirates",
};

export default async function RootLayout({ children }) {
  // const pathname = usePathname();
  // const { menuItems, settings } = await getNavData();

  return (
    <html lang="en">
      <body className={barlow.className}>
        <>
          {/* <div
            className={`${
              pathname === "/" ? "" : "bg-gray-800 fixed w-full top-0 z-30"
            }`}
          >
            <Navbar menuItems={menuItems} settings={settings} />
          </div> */}
          {children}
          <Footer />
        </>
      </body>
    </html>
  );
}
