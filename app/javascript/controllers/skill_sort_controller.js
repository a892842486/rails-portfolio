import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  dragstart(event) {
    this.draggedSkillId = event.currentTarget.dataset.skillId
  }

  dragover(event) {
    event.preventDefault()
  }

  drop(event) {
    event.preventDefault()

    const draggedSkill = this.element.querySelector(
      `[data-skill-id="${this.draggedSkillId}"]`
    )

    if (!draggedSkill) return

    const draggedRow = draggedSkill.parentElement
    const targetRow = event.currentTarget.parentElement

    const rows = [...this.element.children]

    const draggedIndex = rows.indexOf(draggedRow)
    const targetIndex = rows.indexOf(targetRow)

    if (draggedIndex < targetIndex) {
      targetRow.after(draggedRow)
    } else {
      targetRow.before(draggedRow)
    }

    const skillIds = [...this.element.querySelectorAll("[data-skill-id]")]
      .map(skill => skill.dataset.skillId)

    fetch("/admin/skills/reorder", {
      method: "PATCH",
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ skill_ids: skillIds })
    })
  }
}