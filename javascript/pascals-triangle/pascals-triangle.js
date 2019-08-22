
export class Triangle {
  constructor(number) {
    this.number = number;
  }

  get lastRow() {
    return this.createRows()[this.number - 1]
  }

  get rows() {
    return this.createRows()
  }

  createRows() {
    // Don't calculate this again
    if (this._rows) {
      return this._rows
    }
    // This is the 1st row
    this._rows = [[1]]
    // For each row
    for (var i = 1; i < this.number; i++) {
      // Push the rightmost number
      this._rows.push([1])
      // Calculate the intermediate numbers by taking the sum of the corresponding vals of the previous row
      for (var j = 1; j < i; j++) {
        this._rows[i][j] = this._rows[i - 1][j - 1] + this._rows[i - 1][j]
      }
      // Push the leftmost number
      this._rows[j].push(1)
    }
    return this._rows
  }
}
