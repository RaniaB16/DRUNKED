import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static targets = ["list"]
  static values = { partyId: Number }

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "PartyChannel", id: this.partyIdValue },
      { received: data => this.listTarget.innerHTML = data }
    )
    console.log(`Subscribed to the party with the id ${this.partyIdValue}.`);
  }
}
