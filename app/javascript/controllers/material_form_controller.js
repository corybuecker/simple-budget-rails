import { Controller } from "@hotwired/stimulus"
import { MDCRipple } from "@material/ripple"
import { MDCTextField } from '@material/textfield'

export default class extends Controller {
  connect() {
    MDCRipple.attachTo((this.element.querySelector("button")))
    this.element.querySelectorAll('.mdc-text-field').forEach(el => { new MDCTextField(el) })
  }
}
