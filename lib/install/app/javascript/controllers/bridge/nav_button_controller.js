import { BridgeComponent } from "@hotwired/strada"

export default class extends BridgeComponent {
  static component = "nav-button"

  connect() {
    super.connect()

    if (this.bridgeElement.enabled) {
      this.notifyBridgeOfConnect()
    }
  }

  notifyBridgeOfConnect() {
    const title = this.bridgeElement.title

    this.send("connect", { title }, () => {
      this.bridgeElement.click()
    })
  }
}
