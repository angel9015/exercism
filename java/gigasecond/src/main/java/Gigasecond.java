import java.time.LocalDate;
import java.time.LocalDateTime;

class Gigasecond {
    public final long GIGASECOND = 1000000000;
    LocalDateTime time;

    Gigasecond(LocalDate moment) {
        this(moment.atStartOfDay());
    }

    Gigasecond(LocalDateTime moment) {
        time = moment.plusSeconds(GIGASECOND);
    }

    LocalDateTime getDateTime() {
        return time;    
    }

}
