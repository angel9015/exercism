
export const secretHandshake = (n) => {
  let r = []
  if(n!=Number(n)) {
    throw Error("Handshake must be a number")
  }
  if((n & 1) !=0) r.push('wink')
  if((n & 2) !=0) r.push('double blink')
  if((n & 4) !=0) r.push('close your eyes')
  if((n & 8) !=0) r.push('jump')        
  if((n & 16) !=0) r.reverse()  
  return r
};
