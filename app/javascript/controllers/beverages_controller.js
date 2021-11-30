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
        'Accept': 'application/json',
        'X-CSRF-Token': csrfToken()
      },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        this._updateList(data.list_partial)
        this._updateRate(data.alcool_rate_partial)
      });
  }

  delete(event) {
    event.preventDefault();
    fetch(event.currentTarget.href, {
      method: "DELETE",
      headers: {
        'Accept': 'application/json',
        'X-CSRF-Token': csrfToken()
      }
    })
      .then(response => response.json())
      .then((data) => {
        this._updateList(data.list_partial)
        this._updateRate(data.alcool_rate_partial)
      });
  }

  _updateList(html) {
    this.listTarget.innerHTML = html
  }

  _updateRate(html) {
    const alert = document.querySelector('.alert');
    alert.outerHTML = html
  }
}
