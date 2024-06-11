import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="filter"
export default class extends Controller {
  static targets = ["water", "poop", "fam", "trash", "form", "list"];

  sort(event) {
    event.preventDefault();
    const water = this.waterTarget.checked ? "&filter%5Bwater%5D=1" : "";
    const trash = this.trashTarget.checked ? "&filter%5Btrashs%5D=1" : "";
    const poop = this.poopTarget.checked ? "&filter%5Bpoopbag%5D=1" : "";
    const fam = this.famTarget.checked ? "&filter%5Bfamilyfriendly%5D=1" : "";
    const url = `${this.formTarget.action}?filter%5Bwater%5D=0${water}&filter%5Btrashs%5D=0${trash}&filter%5Bpoopbag%5D=0${poop}&filter%5Bfamilyfriendly%5D=0${fam}&commit=Filtrer`;

    fetch(url, { headers: { Accept: "text/plain" } })
      .then((response) => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
      });
  }
}
