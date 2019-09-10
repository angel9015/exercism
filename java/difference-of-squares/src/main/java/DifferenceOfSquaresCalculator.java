import java.util.stream.IntStream;

class DifferenceOfSquaresCalculator {

    int computeSquareOfSumTo(int input) {
        int s = IntStream.range(1, input + 1).sum();
        return s * s;
    }

    int computeSumOfSquaresTo(int input) {
        return IntStream.range(1, input + 1).map(i -> i * i).sum();
    }

    int computeDifferenceOfSquares(int input) {
        return computeSquareOfSumTo(input) - computeSumOfSquaresTo(input);
    }

}
