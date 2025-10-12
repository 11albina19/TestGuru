import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { finishAt: Number, serverTime: Number}
  static targets = ["output"]

  connect() {
    this.offset = this.serverTimeValue - Math.floor(Date.now() / 1000)
    this.tick()
    this.timer = setInterval(() => this.tick(), 1000)
  }

  tick() {
    const now = Math.floor(Date.now() / 1000) + this.offset
    const secondsLeft = Math.floor(this.finishAtValue - now)

    if (secondsLeft <= 0) {
      //а тут переадресовать на результат
    } else {
      const minutes = Math.floor(secondsLeft / 60)
      const seconds = secondsLeft % 60
      this.outputTarget.textContent = `${minutes}:${seconds.toString().padStart(2, "0")}`
      debugger
    }
  }
}
