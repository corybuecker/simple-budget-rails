import { Controller } from "@hotwired/stimulus"
import { MDCBanner } from '@material/banner';

export default class extends Controller {
  connect() {
    const banner = new MDCBanner(document.querySelector('.mdc-banner'))
    banner.open()
  }
}
