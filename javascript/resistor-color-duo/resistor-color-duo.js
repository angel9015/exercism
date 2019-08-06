//
// This is only a SKELETON file for the 'Resistor Color Duo' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const value = ([val1, val2]) => {
  return COLORS.indexOf(val1)*10 + COLORS.indexOf(val2)
};

export const COLORS = ["black","brown","red","orange","yellow","green","blue","violet","grey","white"];

