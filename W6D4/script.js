document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

const handleSubmittedPlace = (e) => {
  e.preventDefault();

  const sfPlaceInputEl = document.querySelector(".favorite-input");
  const placeName = sfPlaceInputEl.value;
  sfPlaceInputEl.value = "";

  const ul = document.getElementById("sf-places");
  const li = document.createElement("li");
  li.textContent = placeName;

  ul.appendChild(li);
};





  // adding new photos
const showPhotoForm = (e) => {
  const photoFormDiv = document.querySelector(".photo-form-container");
  if (photoFormDiv.className === "photo-form-container") {
    //hide the form
    photoFormDiv.className = "photo-form-container hidden";
  } else {
    //unhide the form (or vice versa)
    photoFormDiv.className = "photo-form-container";
  }
}

const photoFormShowBtn = document.querySelector(".photo-show-button");
photoFormShowBtn.addEventListener("click", showPhotoForm);

const handleSubmittedPhoto = (e) => {
  e.preventDefault();

  const photoInputURL = document.querySelector(".photo-url-input");
  const photoURL = photoInputURL.value;
  photoInputURL.value = "";

  const newPhoto = document.createElement("img");
  newPhoto.src = photoURL;

  const photoListEl = document.createElement("li");
  photolistEl.appendChild(newPhoto);
  const photoList = document.querySelector(".dog-photos");
  photoList.appendChild(photoListEl);
}

const photoSubmitBtn = document.querySelector(".photo-url-submit");
photoSubmitBtn.addEventListener("click", handleSubmittedPhoto);

});
