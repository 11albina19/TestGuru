document.addEventListener('turbo:load', function () {

  const container = document.getElementById('progress-container');
  if (!container) {
    return;
  }

  const position = container.dataset.position;
  const count = container.dataset.count;

  if (!isNaN(position) && !isNaN(count) && count > 0) {
    const progress = (position / count) * 100;
    const bar = document.getElementById('progress-bar');
    
    bar.style.width = progress + '%';
  }
});
