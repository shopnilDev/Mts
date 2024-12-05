"use client";
import React, { useEffect, useState } from "react";
import Link from "next/link";
import Image from "next/image";
import inteltecLogo from "./../public/image/logo.png";
import { HiMiniBars3 } from "react-icons/hi2";
import { IoMdArrowDropdown } from "react-icons/io";

const Navbar = ({ menuItems, settings }) => {
  const [opennav, setOpenNav] = useState(false);
  const [submenuState, setSubmenuState] = useState({}); // Track submenu visibility per item

  const handleMenu = () => {
    setOpenNav(!opennav);
  };

  const toggleSubmenu = (id) => {
    setSubmenuState((prevState) => ({
      ...prevState,
      [id]: !prevState[id], // Toggle submenu for this specific item
    }));
  };

  return (
    <nav className="container mx-auto flex items-center justify-between py-2 w-full z-10 relative">
      {/* Logo */}
      <Link href={"/"}>
        <Image
          src={inteltecLogo}
          alt="logo"
          width={300}
          height={300}
          className="md:w-64"
        />
      </Link>

      {/* Mobile Menu Icon */}
      <HiMiniBars3
        onClick={handleMenu}
        className="text-white text-2xl cursor-pointer md:hidden"
      />

      {/* Mobile Menu */}
      {opennav && (
        <div className="text-white flex flex-col absolute left-0 top-full bg-topHeaderColor w-full p-3 gap-3 rounded-md font-light">
          {menuItems?.map((item) => (
            <div key={item.id}>
              <Link
                href={item.link}
                className="text-[17px] hover:text-hoverBgColor duration-200 ease-in-out flex items-start justify-start p-1"
                onClick={() => item.child && toggleSubmenu(item.id)} // Toggle submenu
              >
                {item.label}
                {item.child && <IoMdArrowDropdown />}
              </Link>

              {/* Submenu for Mobile */}
              {item?.child && submenuState[item.id] && (
                <div className="flex flex-col gap-3 w-52 mt-1 p-2 bg-black capitalize rounded-md duration-150 ease-in-out z-30">
                  {item?.child?.map((subItem) => (
                    <Link
                      key={subItem.id}
                      href={subItem.link}
                      className="hover:text-hoverBgColor"
                    >
                      {subItem.label}
                    </Link>
                  ))}
                </div>
              )}
            </div>
          ))}
        </div>
      )}

      {/* Desktop Menu */}
      <ul className="text-white md:flex justify-end gap-8 flex-wrap hidden">
        {menuItems?.map((item) => (
          <li key={item.id} className="relative group">
            <Link
              href={item.link}
              className="text-lg hover:text-hoverBgColor duration-200 ease-in-out flex items-center gap-0.5"
            >
              {item.label}
              {item.child && <IoMdArrowDropdown />}
            </Link>

            {/* Submenu for Desktop */}
            {item.child && (
              <div className="absolute -left-10 top-full flex flex-col gap-3 mt-2 w-52 p-2 bg-black capitalize rounded-md invisible group-hover:visible duration-150 ease-in-out">
                {item?.child?.map((subItem) => (
                  <Link
                    key={subItem.id}
                    href={subItem.link}
                    className="hover:text-hoverBgColor"
                  >
                    {subItem.label}
                  </Link>
                ))}
              </div>
            )}
          </li>
        ))}
      </ul>
    </nav>
  );
};

export default React.memo(Navbar);
