import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["formfilter", "distance", "list"];

  connect() {
    document.getElementById("filter_distance_désactivé").checked = true;
    document.querySelectorAll(".dropdown-filters").forEach((button) => {
      button.addEventListener('show.bs.dropdown', event => {
        event.currentTarget.style.backgroundColor = "#895f33";
        event.currentTarget.style.color = "white";
      });
      button.addEventListener('hide.bs.dropdown', event => {
        event.currentTarget.style.backgroundColor = "#f4f4f4";
        event.currentTarget.style.color = "#895f33";
      });
    })
    document.querySelectorAll('[type="radio"]').forEach((input) => {
      input.addEventListener("change", (event) => {
        this.filter(event);
      })
    })

  }

  filter(event) {
    navigator.geolocation.getCurrentPosition(position => {
      const userLocation = position.coords;
      this.distanceTarget.querySelector("#filter_user_latitude").value = userLocation.latitude;
      this.distanceTarget.querySelector("#filter_user_longitude").value = userLocation.longitude;
      if (event.target.classList.value == "fa-solid fa-heart") {
        this.distanceTarget.querySelector("#filter_user_favourite").value = 0;
        this.distanceTarget.querySelector("#filter_course_id").value = event.target.id;
      } else {
        this.distanceTarget.querySelector("#filter_user_favourite").value = 1;
        this.distanceTarget.querySelector("#filter_course_id").value = event.target.id;
      }

      fetch(this.formfilterTarget.action, {
        method: "POST", // Could be dynamic with Stimulus values
        headers: {
          "Accept": "text/plain"
        },
        body: new FormData(this.formfilterTarget)
      })
        .then(response => response.text())
        .then((data) => {
          this.listTarget.outerHTML = data;
        })
    }, err => {
      reject(new Error(err.message));
    });
  }
}
