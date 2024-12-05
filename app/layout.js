import { Barlow } from "next/font/google";
import "./globals.css";
import Footer from "@/components/Footer";
import Navbar from "@/components/Navbar";


const barlow = Barlow({
  subsets: ["latin"],
  weight: ["100", "200", "300", "400", "500", "600", "700", "800", "900"],
});

export const metadata = {
  title: " Inteltec Emirates",
  description: " Inteltec Emirates",
};

export default async function RootLayout({ children }) {
  
  return (
    <html lang="en">
      <body className={barlow.className}>
        <>
         
          {children}
          <Footer />
        </>
      </body>
    </html>
  );
}
