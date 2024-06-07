import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="redirect-ride"
export default class extends Controller {

  static values = {
    course: Array
  }

  connect() {
    navigator.geolocation.getCurrentPosition(position => {
      const userLocation = position.coords;
      const userLatitude = userLocation.latitude.toFixed(4)
      const userLongitude = userLocation.longitude.toFixed(4)
      const courseLatitude = this.courseValue[0].lat.toFixed(4)
      const courseLongitude = this.courseValue[0].lng.toFixed(4)
      const link = document.querySelector(".btn-launch-ride").href
      const near = (userLatitude == courseLatitude && userLongitude == courseLongitude) ? "true" : "false"
      document.querySelector(".btn-launch-ride").href = `${link}?near=${near}`
    });
  }
}
