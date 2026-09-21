import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="project-images"
export default class extends Controller {
  static targets = ["list", "template"]

  connect() {
    this.index = 0
    console.log("Project Images controller connected")
  }

  add() {
    const html = this.templateTarget.innerHTML.replace(
      /NEW_RECORD/g,
      this.index
    )

    this.listTarget.insertAdjacentHTML("beforeend", html)

    this.index += 1
  }
}