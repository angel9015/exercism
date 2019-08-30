let sum = ([a, b]) => a + b

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
    this._rows[index] = this.leftRightPairs(index).map(sum)    
  }

  leftRightPairs(index) {
    return [...this._rows[index-1], 0].map((val, idx, arr) => [arr[idx-1] || 0, arr[idx]])
  }
}
