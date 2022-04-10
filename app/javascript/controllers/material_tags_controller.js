import { Controller } from "@hotwired/stimulus"
import { MDCRipple } from "@material/ripple"

export default class extends Controller {
  connect() {
    MDCRipple.attachTo((this.element.querySelector("button")))
  }
}
