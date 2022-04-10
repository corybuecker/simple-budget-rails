import { Controller } from "@hotwired/stimulus"
import { MDCSnackbar } from '@material/snackbar'

export default class extends Controller {
  connect() {
    const snackbar = new MDCSnackbar(this.element)
    snackbar.open()
  }
}
