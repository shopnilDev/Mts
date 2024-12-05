import React from "react";
import Banner from "./Banner";

const Header = () => {
  return (
    <>
      <main className="min-h-screen px-10  ">
        <video
          className="absolute left-0 top-0 -z-10   overflow-hidden object-cover w-full "
          loop
          muted
          autoPlay
          src="https://video.wixstatic.com/video/f21e62_85b7e84cc266411b89ceeef62c403ab9/1080p/mp4/file.mp4"
        ></video>
        <Banner />
      </main>
    </>
  );
};

export default Header;
