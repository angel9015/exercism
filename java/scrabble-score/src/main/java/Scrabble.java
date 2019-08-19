class Scrabble {
    private int score;

    Scrabble(String word) {
        score = word.chars().map(c -> {
            switch(Character.toUpperCase(c)) {
                case 'D': case 'G': return 2;
                case 'B': case 'C': case 'M': case 'P': return 3;
                case 'F': case 'H': case 'V': case 'W': case 'Y': return 4;
                case 'K': return 5;
                case 'J': case 'X': return 8;
                case 'Q': case 'Z': return 10;
            }
            return 1;
        }).sum();
    }

    int getScore() {
        return score;
    }

}
