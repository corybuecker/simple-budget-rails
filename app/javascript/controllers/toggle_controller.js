import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form"];

  save(options) {
    this.element.submit();
  }
}
