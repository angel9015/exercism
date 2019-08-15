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
    let resultMatrix = []
    
    // Add transposed rows / cols to result
    this.matrix.forEach( (row, rowIdx) => {
      row.forEach( (el, elIdx) => {
        if(resultMatrix[elIdx]==undefined) resultMatrix.push([])
        resultMatrix[elIdx][rowIdx] = el;
      })
    });

    return resultMatrix;
  }
}
