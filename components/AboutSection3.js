"use client";
import React from "react";
import { ParallaxBanner,ParallaxProvider  } from 'react-scroll-parallax';

const AboutSection = () => {
  

   
  return (
        <div>
        <ParallaxProvider>
        <Content/>
        </ParallaxProvider>

    </div>

  );
};

export default AboutSection;




const Content = () => {
    return (
      <ParallaxBanner
        layers={[{ image: '/static/banner.jpg', speed: -15 }]}
        className="aspect-[2/1]"
      >

     <div className="absolute inset-0 flex items-center justify-center">
        <h1 className="text-8xl text-white font-thin">Hello World!</h1>
      </div>
        </ParallaxBanner>
    );
  };