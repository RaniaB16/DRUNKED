
const toggleAvatarChecked = () => {
  if (document.querySelectorAll(".new-form")){
    document.querySelectorAll(".new-form").forEach(avatar => {
      avatar.addEventListener('click', event => {
        avatar.classList.toggle("avatar-checked");
        if (avatar.classList.contains('avatar-checked')) {
          document.querySelector('input').setAttribute('checked', 'checked')
        } else {
          document.querySelector('input').setAttribute('checked', '')
        }
      })
    })
  }
}

export {toggleAvatarChecked};
