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
    event.preventDefault();
    navigator.geolocation.getCurrentPosition(position => {
      const userLocation = position.coords;
      this.distanceTarget.querySelector("#filter_user_latitude").value = userLocation.latitude;
      this.distanceTarget.querySelector("#filter_user_longitude").value = userLocation.longitude;
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
      // If the updateSource interval is defined, clear the interval to stop updating the source.
      if (updateSource) clearInterval(updateSource);
      reject(new Error(err.message));
    });







  }
}
