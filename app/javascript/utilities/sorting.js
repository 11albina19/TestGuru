document.addEventListener('turbo:load', function() {
    var control = document.querySelector('.sort-by-title')

    if (control) {
        control.addEventListener('click', sortRowsByTitle)
    }
})

function sortRowsByTitle() {
    var table = document.querySelector('table');
    var rows = Array.from(table.querySelectorAll('tr')).slice(1);

    if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
        rows.sort(compareRowsAsc);
        this.querySelector('.octicon-arrow-up').classList.remove('hide');
        this.querySelector('.octicon-arrow-down').classList.add('hide');
    } else {
        rows.sort(compareRowsDesc);
        this.querySelector('.octicon-arrow-down').classList.remove('hide');
        this.querySelector('.octicon-arrow-up').classList.add('hide');
    }

    var tbody = table.querySelector('tbody') || table;
    rows.forEach(row => tbody.appendChild(row));
}


function compareRowsAsc(row1, row2) {
    var testTitle1 = row1.querySelector('td').textContent
    var testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) {return -1}
    if (testTitle1 > testTitle2) {return 1}
    return 0
}

function compareRowsDesc(row1, row2) {
    var testTitle1 = row1.querySelector('td').textContent
    var testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) {return 1}
    if (testTitle1 > testTitle2) {return -1}
    return 0
}
