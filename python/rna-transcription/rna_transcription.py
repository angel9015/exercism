TRANSCRIPTIONS = {
    'G': 'C',
    'C': 'G',
    'T': 'A',
    'A': 'U',
}
def to_rna(dna_strand):
    return "".join(TRANSCRIPTIONS[l] for l in dna_strand)
