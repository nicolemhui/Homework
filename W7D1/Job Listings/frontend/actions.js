//takes in city string and jobs array, returning a POJO
const setLocation = (city, jobs) => ({
  return {
    type: "SWITCH_LOCATION",
    city,
    jobs
  };
});

// window.selectLocation = selectLocation;
export default selectLocation;
