class Transcriptor {
  toRna(seq: string): string {
    return seq.split('').map(nucleotide => {
      switch (nucleotide) {
        case 'A': return 'U'
        case 'C': return 'G'
        case 'G': return 'C'
        case 'T': return 'A'
        default: throw 'Invalid input DNA.'
      }
    }).join('')
  }
}

export default Transcriptor
