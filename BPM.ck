//BPM File

public class BPM 
{
   //init quaver varibales 
   static dur quarter, whole, half, eight, sixt, t32, rest;   
   
   fun void tempo(float b){
     1::minute / b  => quarter;
     quarter * 4 => whole;
     quarter*2=> half;
     quarter * .5 => eight;
     eight * .5 => sixt;
     sixt * .5 => t32;
   }
   
}



