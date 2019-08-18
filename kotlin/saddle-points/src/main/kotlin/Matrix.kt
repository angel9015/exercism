class Matrix(val rows: List<List<Int>>) {
    val saddlePoints: Set<MatrixCoordinate> = rows.foldIndexed(emptySet<MatrixCoordinate>()) { rowIdx, rowAcc, row ->
        val rowMax = row.max()
        row.foldIndexed(rowAcc) { elIdx, elAcc, el ->
            if(el==rowMax) {
                val colMin = column(elIdx).min()
                if(el==colMin) {
                    elAcc + MatrixCoordinate(rowIdx, elIdx)
                } else {
                    elAcc
                }
            } else {
                elAcc
            }
        }
    }

    fun column(idx: Int) = rows.map {
        it.get(idx)
    }
}