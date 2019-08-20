import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Duration;


class Gigasecond {
    
    public final Duration GIGASECOND = Duration.ofSeconds(1_000_000_000);
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
