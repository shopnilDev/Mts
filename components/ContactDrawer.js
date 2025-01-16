"use client";

import axiosInstance from "@/helpers/axiosInstance";
import { useState } from "react";

export function ContactDrawer() {
  const [isOpen, setIsOpen] = useState(false);
  const [formData, setFormData] = useState({
    subject: "Contact Query",
    // product_id: 1,
    // product_name: "",
    firstName: "",
    lastName: "",
    email: "",
    message: "",
  });

  const handleChange = (e) => {
    const { id, value } = e.target;
    setFormData((prevData) => ({
      ...prevData,
      [id]: value,
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    console.log("contact formData:", formData);

    try {
      const response = await axiosInstance.post("/contacts/create", formData);
      //   const response = await fetch("/api/contact", {
      //     method: "POST",
      //     headers: {
      //       "Content-Type": "application/json",
      //     },
      //     body: JSON.stringify(formData),
      //   });
      console.log("contact response:", response);
      if (response.ok) {
        alert("Your message has been sent successfully!");
        setFormData({ firstName: "", lastName: "", email: "", message: "" });
        setIsOpen(false);
      } else {
        alert("Failed to send your message. Please try again later.");
      }
    } catch (error) {
      console.error("Error submitting form:", error);
      alert("An error occurred. Please try again later.");
    }
  };

  return (
    <>
      <button
        onClick={() => setIsOpen(true)}
        className=" text-white hover:text-gray-300 transition-colors"
      >
        Contact
      </button>

      {/* Backdrop */}
      {isOpen && (
        <div
          className="fixed inset-0 bg-black bg-opacity-50 transition-opacity z-40"
          onClick={() => setIsOpen(false)}
        />
      )}

      {/* Drawer */}
      <div
        className={`fixed top-0 right-0 h-screen w-full sm:w-[500px] bg-white transform transition-transform duration-300 ease-in-out z-50 ${
          isOpen ? "translate-x-0" : "translate-x-full"
        }`}
      >
        <div className="p-8">
          <div className="flex flex-col items-end justify-between ">
            <button
              onClick={() => setIsOpen(false)}
              className="p-2 hover:bg-gray-100 rounded-full text-gray-600"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                className="h-6 w-6"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M6 18L18 6M6 6l12 12"
                />
              </svg>
            </button>
          </div>
          <h2 className="text-6xl font-semibold text-gray-900 text-center mb-12">
            Contact Us
          </h2>

          <form onSubmit={handleSubmit} className="space-y-8 text-gray-700">
            <div className="grid grid-cols-2 gap-8 ">
              <div className="space-y-2">
                <label
                  htmlFor="firstName"
                  className="block text-sm text-gray-600"
                >
                  First Name
                </label>
                <input
                  type="text"
                  id="firstName"
                  value={formData.firstName}
                  onChange={handleChange}
                  className="w-full pb-1 border-b border-gray-300 focus:border-gray-900 focus:outline-none transition-colors bg-transparent"
                />
              </div>
              <div className="space-y-2">
                <label
                  htmlFor="lastName"
                  className="block text-sm text-gray-600"
                >
                  Last Name
                </label>
                <input
                  type="text"
                  id="lastName"
                  value={formData.lastName}
                  onChange={handleChange}
                  className="w-full pb-1 border-b border-gray-300 focus:border-gray-900 focus:outline-none transition-colors bg-transparent"
                />
              </div>
            </div>

            <div className="space-y-2">
              <label htmlFor="email" className="block text-sm text-gray-600">
                Email <span className="text-gray-400">*</span>
              </label>
              <input
                type="email"
                id="email"
                value={formData.email}
                onChange={handleChange}
                required
                className="w-full pb-1 border-b border-gray-300 focus:border-gray-900 focus:outline-none transition-colors bg-transparent"
              />
            </div>

            <div className="space-y-2">
              <label htmlFor="message" className="block text-sm text-gray-600">
                Write a message
              </label>
              <textarea
                id="message"
                rows={4}
                value={formData.message}
                onChange={handleChange}
                className="w-full pb-1 border-b border-gray-300 focus:border-gray-900 focus:outline-none transition-colors bg-transparent resize-none"
              />
            </div>

            <button
              type="submit"
              className="w-24 bg-gray-900 text-white py-2 px-4 hover:bg-gray-800 transition-colors"
            >
              SUBMIT
            </button>
          </form>
        </div>
      </div>
    </>
  );
}
