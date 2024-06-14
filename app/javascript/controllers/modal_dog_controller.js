import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal-dog"
export default class extends Controller {
  static targets = ["modal", "form", "dogs"];

  submit(event) {
    event.preventDefault()
    fetch(this.formTarget.action, {
      method: "POST", // Could be dynamic with Stimulus values
      headers: {"Accept": "application/json"},
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.success) {
          const modal = bootstrap.Modal.getInstance(document.getElementById("modalForm"))
          modal.hide();
          this.dogsTarget.insertAdjacentHTML("afterbegin", data.partial);
        } else {
          this.formTarget.outerHTML = data.form;
        }
      })
    }



}
