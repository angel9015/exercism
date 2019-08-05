import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

class Gigasecond(localDateTime: LocalDateTime) {
    constructor(localDate: LocalDate): this(localDate.atStartOfDay())

    val date = localDateTime.plus(1000000000, ChronoUnit.SECONDS)
}