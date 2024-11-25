const { fetchClient } = require("./fetchClient");

export const getNavData = async () => {
  // Fetch data on the server
  const menuRes = await fetchClient(`/menus?menu=1`, {
    next: { revalidate: 60 },
  });
  const settingsRes = await fetchClient(`/frontend/settings`, {
    next: { revalidate: 60 },
  });

  const menuData = menuRes?.data || { data: { items: [] } };
  const settingsData = settingsRes?.data || {};

  const menuItems = menuData?.items || [];
  const settings = settingsData;

  return {
    menuItems,
    settings,
  };
};
