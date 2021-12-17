// alerts
let error = document.getElementById("error");
setTimeout(() => {
  error.style.opacity = 0;
  error.style.visibility = "hidden";
}, 4000);

let success = document.getElementById("success");
setTimeout(() => {
  success.style.opacity = 0;
  success.style.visibility = "hidden";
}, 4000);

// nav
let btn = document.getElementById("user");
let actions = document.getElementById("actions");

document.onclick = (e) => {
  if (e.target != btn) {
    actions.classList.remove("active");
  }
};

btn.onclick = () => {
  actions.classList.toggle("active");
};
