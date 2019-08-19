import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Duration;
import java.time.temporal.ChronoUnit;


class Gigasecond {
    public final Duration GIGASECOND = Duration.of(1_000_000_000, ChronoUnit.SECONDS);
    LocalDateTime time;

    Gigasecond(LocalDate moment) {
        this(moment.atStartOfDay());
    }

    Gigasecond(LocalDateTime moment) {
        time = moment.plus(GIGASECOND);
    }

    LocalDateTime getDateTime() {
        return time;    
    }

}
