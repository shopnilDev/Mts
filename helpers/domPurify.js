import createDOMPurify from "dompurify";
import { JSDOM } from "jsdom";

// Create a DOMPurify instance using JSDOM
const window = new JSDOM("").window;
const DOMPurify = createDOMPurify(window);

export default DOMPurify;
