import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["formfilter", "formdistance", "list"];
  connect() {}

  filter(event) {
    console.log(this.formTarget.action);
    event.preventDefault();
    fetch(this.formTarget.action, {
      method: "POST", // Could be dynamic with Stimulus values
      headers: {"Accept": "text/plain"},
      body: new FormData(this.formfilterTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
      })
    }
}
