interface IHash {
    [key: string]: number;
}

const ResistorValues: IHash = {
  "black": 0,
  "brown": 1,
  "red": 2,
  "orange": 3,
  "yellow": 4,
  "green": 5,
  "blue": 6,
  "violet": 7,
  "grey": 8,
  "white": 9
}

export class ResistorColor {
  private colors: string[]

  constructor(colors: string[]) {
    this.colors = colors.slice(0, 2)
    if(this.colors.length < 2) {
      throw new Error("At least two colors need to be present")
    }
  }
  value = (): number => {
    return this.colors.map(v => ResistorValues[v]).reduce((a, b) => a*10 + b)
  }
}
