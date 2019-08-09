//
// This is only a SKELETON file for the 'Matrix' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export class Matrix {
  constructor(input) {
    this.matrix = input.split('\n').map(x => x.split(' ').map(y => Number(y)))
  }

  get rows() {
    return [...this.matrix]
  }

  get columns() {
    // Prepare result column matrix
    let r = []
    this.matrix[0].forEach(col => {
      r.push([])
    })

    // Add transposed rows / cols to result
    this.matrix.forEach( (row, rowIdx) => {
      row.forEach( (el, elIdx) => {
        r[elIdx][rowIdx] = el;
      })
    });

    return r;
  }
}
