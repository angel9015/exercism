class Matrix {
  private _rows: Array<Array<number>>;

  constructor(input: string) {
    this._rows =input.split('\n').map(z => z.split(' ').map(x => parseFloat(x)));
  }

  get rows(): Array<Array<number>> {
    return this._rows;
  }

  get columns(): Array<Array<number>> {
    return this._rows[0].map((_, colIndex) => this._rows.map(row => row[colIndex]));
  }
}

export default Matrix
