document.addEventListener("DOMContentLoaded", () => {
  const parkButton = document.getElementById("park-button");
  const parkDropdown = document.getElementById("park-dropdown");

  parkButton.addEventListener("click", () => {
    parkDropdown.classList.toggle("show");
  });

  window.addEventListener("click", (event) => {
    if (!event.target.matches(".park-button")) {
      parkDropdown.classList.remove("show");
    }
  });
});