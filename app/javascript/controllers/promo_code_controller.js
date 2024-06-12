import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="promo-code"
export default class extends Controller {
  static targets = ["code"];

  connect() {
    console.log("PromoCodeController connected");
  }

  showCode(event) {
    this.codeTarget.style.display = "block";
    const button = event.target;
    button.style.display = "none";
  }

  copyCode(event) {
    const promoCodeId = event.currentTarget.dataset.promoCodeId;
    const promoCodeElement = document.getElementById(
      `promo-code-${promoCodeId}`
    );
    const promoCode = promoCodeElement.innerText;

    navigator.clipboard
      .writeText(promoCode)
      .then(() => {
        alert("Code promotionnel copié !");
      })
      .catch((err) => {
        console.error("Could not copy text: ", err);
      });
  }
}
