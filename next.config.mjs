/** @type {import('next').NextConfig} */
const nextConfig = {
  env: {
    BASE_URL: process.env.BASE_URL || "http://localhost:3000",
  },
  images: {
    domains: [
      "mathmozocms.test",
      "admin.mtsbd.net",
      "www.isec.com",
      "static.wixstatic.com",
    ],
  },
  async rewrites() {
    return [
      {
        source: "/api/:path*",
        //destination: "https://admin.mtsbd.net/api/v1/:path*", // Proxy to Backend
        destination: "http://mathmozocms.test/api/v1/:path*", // Proxy to Backend
      },
    ];
  },
  reactStrictMode: false,
};

export default nextConfig;
