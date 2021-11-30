
const toggleAvatarChecked = () => {
  document.querySelectorAll(".new-form").forEach(avatar => {
    avatar.addEventListener('click', event => {
      avatar.classList.toggle("avatar-checked");
      if (avatar.classList.contains('avatar-checked')) {
        avatar.querySelector('input').setAttribute('checked', 'checked')
      } else {
        avatar.querySelector('input').setAttribute('checked', '')
      }
    })
  })
}

toggleAvatarChecked();
