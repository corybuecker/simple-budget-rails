import { Controller } from "@hotwired/stimulus"
import { MDCRipple } from "@material/ripple"
import { MDCTextField } from '@material/textfield'
import { MDCFormField } from '@material/form-field';
import { MDCRadio } from '@material/radio';


export default class extends Controller {
  static targets = ["radio", "textfield", "button"]

  radioTargetConnected(element) {
    const formField = new MDCFormField(element)
    const radio = new MDCRadio(element.querySelector('.mdc-radio'))
    formField.input = radio
  }

  textfieldTargetConnected(element) {
    new MDCTextField(element)
  }

  buttonTargetConnected(element) {
    new MDCRipple(element)
  }
}
