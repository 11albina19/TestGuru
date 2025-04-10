let passwordConfirmation, password, checkIcon, alertIcon

document.addEventListener('turbo:load', function () {
    passwordConfirmation = document.getElementById('user_password_confirmation')
    password = document.getElementById('user_password')
    checkIcon = document.querySelector('[class*="octicon-check"]')
    alertIcon = document.querySelector('[class*="octicon-x"]')

    document.querySelector('form').addEventListener('input', function (event) {
        if (event.target === password || event.target === passwordConfirmation) {
            passwordConfirmationCheck()
        }
    })
});

function passwordConfirmationCheck() {
    if (!password.value.length || !passwordConfirmation.value.length) {
        checkIcon.classList.add('hide')
        alertIcon.classList.add('hide')
        return
    }

    if (passwordConfirmation.value === password.value) {
        checkIcon.classList.remove('hide')
        alertIcon.classList.add('hide')
    } else {
        checkIcon.classList.add('hide')
        alertIcon.classList.remove('hide')
    }
}
