import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "icon"]

  connect() {
    this.opened = false
    document.addEventListener("click", this.handleOutsideClick)
  }

  disconnect() {
    document.removeEventListener("click", this.handleOutsideClick)
  }

  toggle(event) {
    event.stopPropagation()
    this.opened ? this.close() : this.open()
  }

  open() {
    this.menuTarget.classList.remove("hidden")
    this.iconTarget.classList.add("rotate-180")
    this.opened = true
  }

  close() {
    this.menuTarget.classList.add("hidden")
    this.iconTarget.classList.remove("rotate-180")
    this.opened = false
  }

  handleOutsideClick = (event) => {
    if (!this.element.contains(event.target)) {
      this.close()
    }
  }
}