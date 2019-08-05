def distance(strand_a, strand_b):
    if len(strand_a) != len(strand_b):
        raise ValueError("Lengths must be equal")

    return sum(t[0]!=t[1] for t in zip(strand_a, strand_b))
    
    



