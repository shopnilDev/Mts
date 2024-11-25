"use client";
import React, { useState, useEffect } from "react";
import Link from "next/link";
import axiosInstance from "@/helpers/axiosInstance";
import { toast } from "react-toastify";
import Navbar from "@/components/Navbar";
import { getNavData } from "@/helpers/getNavbarData";

const Page = () => {
  const [formData, setFormData] = useState({
    subject: "Contact Query",
    product_id: "", // Pre-populate if needed
    product_name: "", // Pre-populate if needed
    name: "",
    email: "",
    phone: "",
    comment: "",
  });
  const [isMounted, setIsMounted] = useState(false);

  const [menuItems, setMenuItems] = useState([]);
  const [settings, setSettings] = useState({});

  useEffect(() => {
    const fetchNavData = async () => {
      try {
        const { menuItems, settings } = await getNavData();
        setMenuItems(menuItems); // Store menu items in state
        setSettings(settings); // Store settings in state
      } catch (error) {
        console.error("Failed to fetch navigation data:", error);
      }
    };

    fetchNavData();
    setIsMounted(true);
  }, []);

  const handleForm = (e) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value,
    });
  };

  const handleSubmitForm = async (e) => {
    e.preventDefault();

    try {
      await axiosInstance.post("/contacts/create", formData);
      toast.success("Your query has been submitted successfully", {
        position: "bottom-left",
      });

      setFormData({
        name: "",
        email: "",
        phone: "",
        subject: "Contact Query", // Reset to default
        comment: "",
      });
    } catch (error) {
      toast.error(error.response?.data || error.message);
    }
  };

  if (!isMounted) return null;

  return (
    <>
      <div className="bg-gray-800 fixed w-full top-0">
        <Navbar menuItems={menuItems} settings={settings} />
      </div>

      <section className="mt-20">
        <div className="container mx-auto px-3 py-10">
          <h2 className="text-4xl font-bold mb-5 text-center">Get in Touch</h2>
          <div className="flex flex-col md:flex-row justify-center md:gap-10 gap-10">
            <div className="basis-1/3 w-full shadow-md p-5 bg-white">
              <form onSubmit={handleSubmitForm} className="flex flex-col gap-5">
                {/* Hidden Fields */}
                <input
                  type="hidden"
                  value="Contact Query"
                  name="subject"
                  required
                />
                <input
                  type="hidden"
                  value={formData.product_id || ""}
                  name="product_id"
                  required
                />
                <input
                  type="hidden"
                  value={formData.product_name || ""}
                  name="product_name"
                  required
                />

                <input
                  onChange={handleForm}
                  value={formData.name}
                  name="name"
                  type="text"
                  className="border w-full border-gray-300 rounded-md outline-none p-2 text-sm font-medium text-gray-700"
                  placeholder="Name"
                  required
                />
                <input
                  onChange={handleForm}
                  value={formData.email}
                  name="email"
                  type="email"
                  className="border w-full border-gray-300 rounded-md outline-none p-2 text-sm font-medium text-gray-700"
                  placeholder="Email"
                  required
                />
                <input
                  value={formData.phone}
                  onChange={handleForm}
                  name="phone"
                  type="number"
                  className="border w-full border-gray-300 rounded-md outline-none p-2 text-sm font-medium text-gray-700"
                  placeholder="Mobile Number"
                  required
                />
                <textarea
                  value={formData.comment}
                  name="comment"
                  onChange={handleForm}
                  rows={6}
                  className="border w-full border-gray-300 outline-none p-2 rounded-md text-sm text-gray-700"
                  placeholder="Message"
                  required
                ></textarea>
                <button
                  type="submit"
                  className="py-2 px-6 rounded-md bg-blue-500 text-lg text-white w-fit hover:bg-blue-600 transition"
                >
                  Send
                </button>
              </form>
            </div>

            <div className="basis-2/3 shadow-md bg-white p-5">
              <div className="flex flex-col gap-1 text-sm mb-2">
                <h1 className="text-lg text-gray-800 font-semibold">
                  OUR LOCATION
                </h1>
                <p>
                  House # 3, Block # A, Road # 5, Section-6, Beside of Aalok
                  Hospital, Mirpur 10, Dhaka-1216
                </p>
                <p>Call: 01711-261553, Email: info@sensor-shopbd.com</p>
              </div>
              <div className="flex flex-col gap-1 text-sm">
                <iframe
                  className="w-full mb-4"
                  src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d5009.004988651476!2d90.36677776376587!3d23.80947532883005!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c7b85270d125%3A0xd5b318c235754351!2sTechsense%20Bangladesh%20Ltd.!5e1!3m2!1sen!2sbd!4v1725086295448!5m2!1sen!2sbd"
                  width="500"
                  height="280"
                  allowFullScreen
                  loading="lazy"
                  referrerPolicy="no-referrer-when-downgrade"
                ></iframe>
              </div>
              {/* <div className="flex flex-col gap-1 text-sm">
                  <h1 className="text-lg text-gray-800 font-semibold">PAYMENT METHOD</h1>
                  <p>BKash: 01711-261553 (personal)</p>
                  <p>Bank Account No: 1555204780015001</p>
                  <p>Account Name: Techsense Bangladesh Ltd.</p>
                  <p>Bank Name: BRAC Bank Limited</p>
                  <p>Branch of Bank: Banani 11, Dhaka</p>
                  <p>Bangladesh</p>
                </div> */}
            </div>
          </div>
        </div>
      </section>
    </>
  );
};

export default Page;
