import React from "react";

const Mobile_tower = () => {
  return (
    <>
      <section className="bg-[#2D2D2D]">
        <div className="flex flex-col md:flex-row gap-6 ">
          <video
            className="md:w-1/2 md:h-full"
            autoPlay
            muted
            loop
            src="https://video.wixstatic.com/video/f21e62_667335274d434d008dbd66c9a56fe3e3/1080p/mp4/file.mp4"
          ></video>

          <div className="container mx-auto md:w-1/2 flex flex-col text-white my-auto">
            <h1 className="text-3xl md:text-4xl mb-4 font-semibold">
              Mobile Tower Deployment
            </h1>
            <p className="mb-3 font-medium">
              As a part of our integrated solution we conduct all the related
              civil work required to construct lattice towers, rooftop sites,
              monopoles and camouflaged towers, our activities and services:
            </p>

            <div className="flex flex-col gap-1">
              <span>1- Site Acquisition</span>
              <span>2- Project management </span>
              <span>3- Construction Project plannin </span>
              <span>4- Civil work </span>
              <span>5- Structures ( RT, GF, Lattice tower, Monopole ) </span>
              <span>6- GSM Shelter </span>
              <span>7- AC Power </span>
              <span>8- Diesel Generator and fuel Tank supply </span>
              <span>9- Boundary and gate supply </span>
              <span> 10- Supervision and Quality control </span>
              <span>11- Acceptance </span>
            </div>

            <button className="border p-2 px-5 text-sm font-light rounded-sm text-white uppercase hover:bg-buttonBgColor duration-200 ease-in-out mt-5 w-fit">
              Learn More
            </button>
          </div>
        </div>
      </section>

      <section>
        <video
          className="bg-fixed h-[20vh] md:h-[60vh] w-full object-cover relative"
          src="https://video.wixstatic.com/video/f21e62_423f50c7eab448b2934b6e6728cebf5a/1080p/mp4/file.mp4"
          loop
          autoPlay
          muted
        ></video>
      </section>
    </>
  );
};

export default Mobile_tower;
