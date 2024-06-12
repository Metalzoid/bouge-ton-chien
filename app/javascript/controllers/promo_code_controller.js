import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="promo-code"
export default class extends Controller {
  static targets = ["button", "code"];

  connect() {
    console.log("PromoCodeController connected");
  }

  showCode(event) {
    this.codeTarget.style.display = "block";
    const button = event.target;
    const code = this.codeTarget.querySelector("span").textContent;
    this.buttonTarget.textContent = code;

    navigator.clipboard
      .writeText(code)
      .then(() => {
        // alert("Code promotionnel copié !");
        this.codeTarget.querySelector("#feedback-text").style.display = "block";
        setTimeout(() => {
          this.codeTarget.querySelector("#feedback-text").style.display = "none";
        }, 2000);
      })
      .catch((err) => {
        console.error("Could not copy text: ", err);
      });
  }
}
