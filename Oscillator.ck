// Osc chain
public class OSC1 {
SqrOsc s => SawOsc o => Delay d => NRev r => ADSR env => dac;
SinOsc s1 => SawOsc o1 => r;
env.set(.1::second, .2::second, 1, .3::second);
.04 => o.gain=> o1.gain;

//reverb
.3 => r.mix;
//delay chain
.03::second => d.delay => d.max;
.4 => d.gain;
d=>d;
//fm oscs
20000 => s.freq;
30000 => s1.freq;
5000 => s.gain => s1.gain;
2=> o.sync ;
2 => o1.sync;

fun void play (int a){
  1=> env.keyOn;
  Std.mtof(a) => o.freq;
  Std.mtof(a-5) => o1.freq;    
}

fun void off(){
   1 => env.keyOff;   
}

}



