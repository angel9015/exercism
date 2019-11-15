import java.util.List;
import java.util.Collections;
import java.util.ArrayList;

class HandshakeCalculator {

    List<Signal> calculateHandshake(int number) {
        List<Signal> r = new ArrayList<>();
        if((number & 1) !=0) r.add(Signal.WINK);
        if((number & 2) !=0) r.add(Signal.DOUBLE_BLINK);
        if((number & 4) !=0) r.add(Signal.CLOSE_YOUR_EYES);
        if((number & 8) !=0) r.add(Signal.JUMP);
        if((number & 16) !=0) Collections.reverse(r);
        return r;
        
    }

}
