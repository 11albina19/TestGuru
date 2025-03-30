document.addEventListener('turbo:load', function () {
    let control = document.getElementById('user_password_confirmation')

    if (control) {
        control.addEventListener('input', passwordConfirmationCheck)
    }
});

function passwordConfirmationCheck() {
    let password = document.getElementById('user_password')
    let checkIcon = document.querySelector('[class*="octicon-check"]')
    let alertIcon = document.querySelector('[class*="octicon-x"]')

    if (!this.value.length) {
        checkIcon.classList.add('hide')
        alertIcon.classList.add('hide')
        return
    }

    if (this.value === password.value) {
        checkIcon.classList.remove('hide')
        alertIcon.classList.add('hide')
    } else {
        checkIcon.classList.add('hide')
        alertIcon.classList.remove('hide')
    }
}
