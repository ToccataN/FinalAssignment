

//granular background


class Gr {
    SndBuf s => Pan2 p => Delay d => d => NRev r=>  dac;
    .4=> r.mix;
    .5::second => d.max => d.delay;
    .1 => d.gain;
    
    me.dir(-1)+ "/audio/" => string pwd;
    
   
    
    fun void grain( string y,  int x, int sam){
        pwd + y  => s.read;
        0=> s.pos;
        
        s.samples()/x => int grain;
        Math.random2(1, s.samples()-grain) => s.pos;
        Math.random2f(2.0, 5.0) => s.rate;
        Math.random2f(1.0, 1.5) =>s.gain;  
        Math.random2f(-1.0, 1.0) => p.pan;
        sam::samp => now;
        
    }
}

Gr g;
while (true){
  spork ~ g.grain(  "stereo_fx_05.wav", Math.random2(500, 10000), Math.random2(10000, 20000));
  8000::samp => now;  
}
