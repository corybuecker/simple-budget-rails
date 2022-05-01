import { Controller } from "@hotwired/stimulus"
import { MDCRipple } from "@material/ripple"
import { MDCTextField } from '@material/textfield'
import { MDCFormField } from '@material/form-field';
import { MDCRadio } from '@material/radio';
import { MDCTextFieldHelperText } from '@material/textfield/helper-text'
import { MDCSelect } from '@material/select';

export default class extends Controller {
  static targets = ["radio", "textfield", "button", "checkbox", "textfieldHelper", "select"]

  radioTargetConnected(element) {
    const formField = new MDCFormField(element)
    const radio = new MDCRadio(element.querySelector('.mdc-radio'))
    formField.input = radio
  }

  textfieldHelperTargetConnected(element) {
    new MDCTextFieldHelperText(element)
  }

  textfieldTargetConnected(element) {
    new MDCTextField(element)
  }

  buttonTargetConnected(element) {
    new MDCRipple(element)
  }

  checkboxTargetConnected(element) {
    const formField = new MDCFormField(element)
    const radio = new MDCRadio(element.querySelector('.mdc-checkbox'))
    formField.input = radio
  }

  selectTargetConnected(element) {
    new MDCSelect(element)
  }
}
