document.addEventListener('turbo:load', function() { 
  let controls = document.querySelectorAll('.form-inline-link')
  
    if (controls.length) {
      for (let i = 0; i < controls.length; i++) {
        controls[i].addEventListener('click', formInlineLinkHandler)
      }
    }
  
    let errors = document.querySelector('.resource-errors')
  
    if (errors) {
      let resourceId = errors.dataset.resourceId
      formInlineHandler(resourceId)
    }
  })
  
  function formInlineLinkHandler(event) {
    event.preventDefault()
  
    let testId = this.dataset.testId
    formInlineHandler(testId)
  }
  
  function formInlineHandler(testId) {
    let link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
    let testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
    let formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')
  
    if (formInline.classList.contains('d-none')) {
      testTitle.classList.add('d-none')
      formInline.classList.remove('d-none')
      link.textContent = 'Cancel'
    } else {
      testTitle.classList.remove('d-none')
      formInline.classList.add('d-none')
      link.textContent = 'Edit'
    }
  }
