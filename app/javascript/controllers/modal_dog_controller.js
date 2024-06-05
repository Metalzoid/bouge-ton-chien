import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="modal-dog"
export default class extends Controller {
  static targets = ["modal", "form", "dogs"]

  open() {
    this.modalTarget.classList.add('modal-open')
    this.modalTarget.classList.add('show')
    this.modalTarget.style.display = 'block'
    this.modalTarget.removeAttribute('aria-hidden')
    this.modalTarget.setAttribute('aria-modal', true)
    this.modalTarget.setAttribute('role', 'dialog')
  }

  close() {
    this.modalTarget.classList.remove('modal-open')
    this.modalTarget.classList.remove('show')
    this.modalTarget.style.display = 'initial'
    this.modalTarget.setAttribute('aria-hidden')
    this.modalTarget.removeAttribute('aria-modal', true)
    this.modalTarget.removeAttribute('role', 'dialog')
  }

  update(event) {
    event.preventDefault()
    fetch(this.formTarget.action, {
      method: "POST", // Could be dynamic with Stimulus values
      headers: {"Accept": "text/plain"},
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.dogsTarget.insertAdjacentHTML("beforeend", data)
      })
    }
}
