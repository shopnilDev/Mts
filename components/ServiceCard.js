import { getExtraFieldValue } from "@/helpers/metaHelpers";
import Image from "next/image";
import Link from "next/link";
import React from "react";

export default function ServiceCard({ service }) {
  const extraFields = service?.extraFields || [];
  const value = getExtraFieldValue(extraFields, "service_icon");
  // console.log("from service card, service icon", value);
  // console.log("from service card, ", service);

  return (
    <div className="text-white min-h-[450px] flex flex-col group w-48">
      <Image src={`${service?.featured_image}`} width={35} height={35} alt={`${service?.name} logo`} />
      <h1 className="text-2xl font-bold my-2">{service?.name}</h1>
      <p
        dangerouslySetInnerHTML={{
          __html: service?.description
            ? `${service.description.slice(0, 200)}${
                service.description.length > 200 ? "..." : ""
              }`
            : "",
        }}
      ></p>
      <Link
        href={`services/${service?.slug}`}
        className="underline mt-5 block font-semibold capitalize"
      >
        Learn more
      </Link>
    </div>
  );
}
