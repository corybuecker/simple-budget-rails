import { Controller } from "@hotwired/stimulus"
import { MDCDialog } from '@material/dialog'

export default class extends Controller {
  connect() {
    const dialog = new MDCDialog(this.element)

    // Do not attempt to open the dialog if loading from a cache. This can cause
    // the dialog to flash before the Turbo Drive page replacement. The
    // component WILL reconnect from the cache.
    if (document.documentElement.hasAttribute("data-turbo-preview") === false) {
      dialog.open()
    }
  }
}
