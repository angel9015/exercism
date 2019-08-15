object HandshakeCalculator {
    fun calculateHandshake(n: Int): List<Signal> {
        val r = mutableListOf<Signal>() 
        if(n and 1!=0) r.add(Signal.WINK)
        if(n and 2!=0) r.add(Signal.DOUBLE_BLINK)
        if(n and 4!=0) r.add(Signal.CLOSE_YOUR_EYES)
        if(n and 8!=0) r.add(Signal.JUMP)        
        if(n and 16!=0) r.reverse()        

        return r
    }
}