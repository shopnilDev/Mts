// metaHelpers.js

export default getMetaValueByMetaName = (jsonData, metaName) => {
  //console.log("from helper", jsonData?.data);
  //console.log(metaName);
  const foundItem = jsonData?.data?.find((item) => item.meta_name === metaName);
  //console.log(foundItem);
  return foundItem ? foundItem.meta_value : null;
};


