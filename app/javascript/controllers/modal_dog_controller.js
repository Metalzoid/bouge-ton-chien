import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal-dog"
export default class extends Controller {
  static targets = ["modal"]

  open(event) {
    event.preventDefault();
    this.modalTarget.classList.add('modal-open')
    this.modalTarget.classList.add('show')
    this.modalTarget.style.display = 'block'
    this.modalTarget.removeAttribute('aria-hidden')
    this.modalTarget.setAttribute('aria-modal', true)
    this.modalTarget.setAttribute('role', 'dialog')
  }

  close() {
      this.modalTarget.remove()
  }
}
