const LETTER_a = 'a'.charCodeAt(0)

const zipMod = (a, b) => a.map(function(e, i) {
  return [e, b[i%b.length]];
});

const createRandomKey = () =>  {
  let rndkey = ''
  for (let i = 0; i < 100; i++) {
    rndkey += String.fromCharCode(LETTER_a + Math.floor(Math.random() * 26))
  }
  return rndkey
}

export class Cipher {
  constructor(key) {
    this._key = key || createRandomKey()
  }

  encDec(text, f)  {
    return zipMod(text.split(""), this._key.split("")).map(function([l1, l2]) {
      let n1 = l1.charCodeAt(0) - LETTER_a
      let n2 = l2.charCodeAt(0) - LETTER_a
      return String.fromCharCode( f(n1, n2) % 26 + LETTER_a)
    }).join("")
  }

  encode(plaintext) {
    return this.encDec(plaintext, (n1, n2) => (n1+n2))
  }

  decode(cipher) {
    return this.encDec(cipher, (n1, n2) => (26 + n1 - n2) % 26)
  }

  get key() {
    return this._key
  }
}
