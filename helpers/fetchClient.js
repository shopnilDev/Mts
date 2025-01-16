const BASE_URL =
  process.env.NEXT_PUBLIC_API_BASE_URL || "http://mathmozocms.test/api/v1";
// process.env.NEXT_PUBLIC_API_BASE_URL || "https://admin.mtsbd.net/api/v1";

export const fetchClient = async (endpoint, options = {}) => {
  const url = `${BASE_URL}${endpoint}`;
  const res = await fetch(url, {
    ...options,
    headers: {
      "Content-Type": "application/json",
      ...options.headers,
    },
  });

  return res.json();
};
