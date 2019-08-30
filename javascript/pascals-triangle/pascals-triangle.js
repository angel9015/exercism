export class Triangle {
  constructor(number) {
    this.number = number;
  }

  get lastRow() {
    return this.rows[this.number - 1]
  }

  get rows() {
    if (this._rows) {
      return this._rows
    }
    return this.createRows()
  }

  createRows() {
    this._rows = [[1]]
    for (var i = 1; i < this.number; i++) {
      this.createRow(i)
    }
    return this._rows
  }

  createRow(index) {
    this._rows.push([1])
    // Calculate the intermediate numbers by taking the sum of the corresponding vals of the previous row
    for (var j = 1; j < index; j++) {
      this._rows[index][j] = this._rows[index - 1][j - 1] + this._rows[index - 1][j]
    }
    this._rows[j].push(1)
  }
}
