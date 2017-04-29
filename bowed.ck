public class bow {
 Gain master => dac;
 .3 => master.gain;
 
 NRev r;
 .8 => r.mix;
 
 Bowed bow => ADSR env1 => r => master;  
 (.2::second, .1::second, 1, .5::second) => env1.set; 
 
  
 
 
 fun void play(int note) {
   //bow params
   Math.random2f(.4,.6) => bow.bowPressure;
   Math.random2f(.30,.35) => bow.bowPosition;
   Math.random2f(100, 110) => bow.vibratoFreq;
   Math.random2f(.05,.06) => bow.vibratoGain;
   Math.random2f(.3,.4) => bow.noteOn;
   Std.mtof(note) => bow.freq;
   
   //blit params
   
  
  
   1=> env1.keyOn; 
 }
  
  fun void off(){
    1 => bow.noteOff ;
    1 => env1.keyOff;   
  }
    
}



