import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Highlights of Cinema", "Presented to you"],
      startDelay: 500,
      typeSpeed: 50,
      backDelay: 250,
      backSpeed: 30,
      loop: true,
      loopCount: 5,
    })
  }
}
