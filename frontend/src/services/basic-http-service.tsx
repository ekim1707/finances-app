import axios from "axios";
// import { genericHeaders } from "../environment/resources";

export const basicHttpService = {
  getRequest: (url: string) =>
    axios
      .get(url, {
        // genericHeaders,
      })
      .catch((err) => err),
  createRequest: (url: string, data: string) =>
    axios.post(url, data, {
      // genericHeaders,
    }),
  updateRequest: (url: string, data: string) =>
    axios.patch(url, data, {
      // genericHeaders,
    }),
  deleteRequest: (url: string) =>
    axios.delete(url, {
      // genericHeaders,
    }),
};

export default basicHttpService;
