function transpose<T>(matrix: T[][]): T[][] {
  return matrix[0].map((_, colIndex) => matrix.map(row => row[colIndex]));
}

class Matrix {
  private readonly _rows: number[][];

  constructor(input: string) {
    this._rows =input.split('\n').map(z => z.split(' ').map(x => parseFloat(x)));
  }

  get rows(): Array<Array<number>> {
    return this._rows;
  }

  get columns(): Array<Array<number>> {
    //return this._rows[0].map((_, colIndex) => this._rows.map(row => row[colIndex]));
    return transpose(this._rows);
  }
}

export default Matrix