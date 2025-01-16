import { Barlow, Questrial } from "next/font/google";
import "./globals.css";
import Footer from "@/components/Footer";

const barlow = Barlow({
  subsets: ["latin"],
  weight: ["100", "200", "300", "400", "500", "600", "700", "800", "900"],
});

const questrial = Questrial({
  weight: "400", // Questrial is available in a single weight (400)
  subsets: ["latin"],
});

export const metadata = {
  title: " Mts",
  description: "Mts",
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
