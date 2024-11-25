// components/SkeletonCard.js
const SkeletonCard = () => {
  return (
    <div className="animate-pulse bg-gray-300 rounded-md w-full">
      <div className="bg-gray-300 w-full h-52 rounded-md"></div>
      <div className="mt-3 bg-gray-300 w-4/5 h-6 rounded-md"></div>
    </div>
  );
};

export default SkeletonCard;
