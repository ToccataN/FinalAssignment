//drummer
public class drummer{
// drums
SndBuf kit[3];
//master
Gain master[3];

for (0 => int i; i< kit.cap(); i++){
    kit[i] => master[i] => dac;
    kit[i].gain()*.07 => kit[i].gain;   
}

//sound chain snare
kit[1] => JCRev r1 => Pan2 p1 => dac;
.2=>r1.mix;

//sound chain hat
kit[2] => NRev r2 => Pan2 p2 => dac;
.4 => r2.mix;

me.dir(-1) + "/audio/" => string pwd;

fun void drum(string path, int i){
    pwd + path + ".wav" => kit[i].read;   
}

fun void kicker(){
    
    drum("kick_05", 0);    
    
}



fun void snare() {
    
    drum("snare_01", 1); 
    Math.random2f(-.3, .3) => p1.pan;

    
    
}

//hats
["hihat_02", "hihat_03"] @=> string hi[];
fun void hatter() {
    
    drum(hi[Math.random2(0,1)], 2); 
    Math.random2f(Math.sin(-90), Math.sin(90)) => p1.pan;
    
    
}


}