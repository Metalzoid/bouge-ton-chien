import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["formfilter", "list"];
  connect() {
    document.querySelectorAll('[type="radio"]').forEach((input) => {
      input.addEventListener("change", (event) => {
        this.filter(event)
      })
    })
  }

  filter(event) {
    event.preventDefault();
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
    }
}
