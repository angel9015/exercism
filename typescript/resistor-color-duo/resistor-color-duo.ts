enum ResistorValues {
  black = 0,
  brown = 1,
  red = 2,
  orange = 3,
  yellow = 4,
  green = 5,
  blue = 6,
  violet = 7,
  grey = 8,
  white = 9
}

declare type ResistorValuesType = keyof typeof ResistorValues;

export class ResistorColor {
  constructor(private colors: string[]) {
    if(colors.length < 2) {
      throw new Error("At least two colors need to be present")
    }
    this.colors = colors.slice(0, 2)
  }
  value = () => this.colors.map(
    v => ResistorValues[v as ResistorValuesType].valueOf()
  ).reduce(
    (a, b) => a*10 + b
  ) 
}
