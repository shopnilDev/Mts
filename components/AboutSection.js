"use client";

import React, { useEffect, useState } from "react";

const About = ({ description }) => {
  const [offset, setOffset] = useState(-10); // Initial position slightly above the center
  const [isInViewport, setIsInViewport] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      const aboutSection = document.getElementById("about-inteltec");
      if (!aboutSection) return;

      const { top, bottom } = aboutSection.getBoundingClientRect();
      const isInView = top < window.innerHeight && bottom > 0;
      setIsInViewport(isInView);

      if (isInView) {
        // Reverse the scroll direction and make the movement faster
        const scrollFactor = Math.max(0, Math.min(1, top / window.innerHeight));
        setOffset(-scrollFactor * 100); // Increased multiplier for faster parallax
      }
    };

    window.addEventListener("scroll", handleScroll, { passive: true });
    window.addEventListener("resize", handleScroll, { passive: true });

    handleScroll(); // Initial check

    return () => {
      window.removeEventListener("scroll", handleScroll);
      window.removeEventListener("resize", handleScroll);
    };
  }, []);

  const parallaxStyle = {
    backgroundImage: "url('/image/inteltec.png')",
    backgroundAttachment: "fixed",
    backgroundPosition: `center ${offset}%`,
    backgroundRepeat: "no-repeat",
    backgroundSize: "cover",
    transition: "background-position 0.02s ease-out", // Faster and smoother transition
  };

  return (
    <section
      id="about-inteltec"
      className="about_inteltec py-10 px-10 relative"
      style={parallaxStyle}
    >
      <div className="parallax-content max-w-5xl mx-auto relative z-10">
        <h1 className="text-[56px] mb-14 text-white leading-10">
          About Inteltec
        </h1>
        <div className="md:w-1/2 pr-28">
          <div
            className="text-sm leading-6 font-thin text-white"
            dangerouslySetInnerHTML={{ __html: description }}
          />
        </div>
        <button
          className="border hover:border-[#0074BC] py-4 px-12 text-sm font-light rounded-sm
           text-white uppercase hover:bg-buttonBgColor duration-500 ease-in-out mt-5"
        >
          About us
        </button>
      </div>
      <div className="absolute inset-0 bg-black opacity-10 z-0"></div>
    </section>
  );
};

export default About;
