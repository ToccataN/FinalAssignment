//Vocal Instrument

public class voices
{
  
  Gain master => NRev r => dac;
  FMVoices vox[3];
  .5 => r.mix;
  for ( 0 => int i; i < vox.cap(); i++){
    .05 => vox[i].gain;  
    vox[i] => master;    
  }
  
  fun float gain (float i){
      if (i < 1){
          for (0 => int i; i < vox.cap(); i++){
              i => vox[i].gain;      
          }
      } else {
         <<<"try again">>>;   
      }  
  }
  
  fun void off() {
      for (0 => int j ; j < vox.cap(); j++){
          1 => vox[j].noteOff;
      }  
  }
  
  fun void chords( int i, float on, string prog){
      if (prog == "minor"){
          Std.mtof(i) => vox[0].freq; 
          Std.mtof(i+3) => vox[1].freq; 
          Std.mtof(i+7) => vox[2].freq;
       } 
       
       for (0 => int j; j< vox.cap(); j++){
           on => vox[j].noteOn;
       }
       
   } 
                     

   
     
    
}



