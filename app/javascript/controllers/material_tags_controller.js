import { Controller } from "@hotwired/stimulus"
import { MDCRipple } from "@material/ripple"
import { MDCDataTable } from '@material/data-table';

export default class extends Controller {
  connect() {
    MDCRipple.attachTo(this.element.querySelector("button"))
    new MDCDataTable(this.element.querySelector('.mdc-data-table'))
  }
}
