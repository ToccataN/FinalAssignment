public class shake {
 Gain master[3];
 Shakers shaker[3];
 Pan2 p[3];
 Echo e => NRev r => dac;
 
 .5:: second => e.delay =>  e.max;
 .5 => r.mix => e.mix;
 
 [0, 4,6,10, 16, 22] @=> int arr[];
 
 for (0 => int i; i< master.cap(); i++){
     if (i==0){
       shaker[i] => master[i] => p[i].left => e; 
     }  else if ( i== 1) {
        shaker[i] => master[i] => p[i].right => e; 
     }  else {
        shaker[i] => master[i] => p[i] => e; 
     } 
 } 
 
 fun void panner(){
     Math.random2f(-1, 1) => p[2].pan;
 }
 
 fun void player(int note){
     for (0 => int i; i< shaker.cap(); i++){
       Math.random2(0, arr.cap()-1) => int a;
       shaker[i].preset(arr[a]);
       shaker[i].energy(Math.random2f(.4,.6));    
       shaker[i].objects(Math.random2f(60, 90));
       shaker[i].decay(Math.random2f(.6,.9));
       Std.mtof(note) => float f;
       Math.random2f(f-100, f+100) => shaker[i].freq;
       .5=> shaker[i].noteOn;  
     }   
 }   
 
 fun void off(){
     for (0 => int i; i< shaker.cap(); i++){
       1=> shaker[i].noteOff;   
     }
 }  

    
}









