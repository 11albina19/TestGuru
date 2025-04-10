document.addEventListener('turbo:load', function() {
    let control = document.querySelector('.sort-by-title')

    if (control) {
        control.addEventListener('click', sortRowsByTitle)
    }
})

function sortRowsByTitle() {
    let table = document.querySelector('table');
    let rows = Array.from(table.querySelectorAll('tr')).slice(1);

    if (this.querySelector('[class*="octicon-arrow-up"]').classList.contains('hide')) {
        rows.sort(compareRowsAsc);
        this.querySelector('[class*="octicon-arrow-up"]').classList.remove('hide');
        this.querySelector('[class*="octicon-arrow-down"]').classList.add('hide');
    } else {
        rows.sort(compareRowsDesc);
        this.querySelector('[class*="octicon-arrow-down"]').classList.remove('hide');
        this.querySelector('[class*="octicon-arrow-up"]').classList.add('hide');
    }

    let tbody = table.querySelector('tbody') || table;
    rows.forEach(row => tbody.appendChild(row));
}


function compareRowsAsc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) {return -1}
    if (testTitle1 > testTitle2) {return 1}
    return 0
}

function compareRowsDesc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) {return 1}
    if (testTitle1 > testTitle2) {return -1}
    return 0
}
