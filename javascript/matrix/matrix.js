//
// This is only a SKELETON file for the 'Matrix' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export class Matrix {
  constructor(input) {
    this.matrix = input.split('\n').map(x => x.split(' ').map(Number))
  }

  get rows() {
    return [...this.matrix]
  }

  get columns() {
    return this.transpose(this.matrix)
  }

  transpose(rows) {
    let resultMatrix = []
    
    // Add transposed rows / cols to result
    rows[0].forEach( (col, colIdx) => {
      if(resultMatrix[colIdx]==undefined) resultMatrix.push([])
      rows.forEach( (row, rowIdx) => {
        resultMatrix[colIdx][rowIdx] = row[colIdx];
      })
    });

    return resultMatrix;
  }
}
