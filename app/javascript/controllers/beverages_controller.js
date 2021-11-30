import { csrfToken } from "@rails/ujs";
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['button', 'form', 'list']

  select() {
    this.buttonTarget.disabled = false;
  }

  send(event) {
    event.preventDefault();
    fetch(this.formTarget.action, {
      method: "POST",
      headers: {
        'Accept': 'text/plain',
        'X-CSRF-Token': csrfToken()
      },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => { this.listTarget.innerHTML = data });
  }

  delete(event) {
    event.preventDefault();
    fetch(event.currentTarget.href, {
      method: "DELETE",
      headers: {
        'X-CSRF-Token': csrfToken()
      }
    })
    event.currentTarget.parentElement.remove();
  }
}
