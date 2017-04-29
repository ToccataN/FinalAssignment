//Score.ck
<<<"CHAD RISTON">>>;

BPM tempo;
tempo.tempo(120);
drummer d;
voices v;
OSC1 osc;
shake shaker;
bow bowed;

[50, 52, 53, 55, 57, 58, 60, 49] @=> int dMin[];

0 => int beat;
0 => int measure;

//kick patterns
[[-1],[-1]] @=> int drum0[][];
[[0, 3],[-1]] @=> int drumA[][];
[[0, 3, 8, 11, 14 ], [4,12]] @=> int drumB[][];
[[0, 3, 8, 11, 14 ], [-1]] @=> int drumC[][];

//drum controllers
fun int hat(int b, int hat){
 
        if (b % hat ==0 && hat != -1){
            d.hatter();
        }        
     
}

fun void kick(int b, int a[][]){
    for (0=> int i; i <  a[0].cap(); i++){
            if (b == a[0][i]){
              d.kicker();
            }    
    }
}

fun void snare(int b, int a[][]){
    for (0=> int i; i <  a[1].cap(); i++){
        if (b == a[1][i]){
            d.snare();
        }    
    }
}

fun void drums(int b, int a[][], int h){
       hat(b, h);
       kick(b, a);
       snare(b, a);
}

//vox controls

[[0],[4]] @=> int voxPat1[][];
[[0,8],[4,10]] @=> int voxPat2[][];

fun void voxPlayer(int beat, int b[][], int note){
   
   for (0 => int i; i< b[0].cap(); i++){
      if (beat == b[0][i]){
          v.chords(note, Math.random2f(.5,.7), "minor");
      } else if (beat == b[1][i]){
          v.off();  
      }
  }
    
}
//OSC! controls

[[0,8],[0, 3],[ 7, 15]] @=> int oscpat1[][];
[[0,4, 8, 12],[4, 5, 6, 5],[ 3, 7, 11, 15]] @=> int oscpat2[][];

fun void oscPlayer(int beat, int b[][]){
    
    for (0 => int i; i< b[0].cap(); i++){
        if (beat == b[0][i]){
            osc.play(dMin[b[1][i]]);
        } else if (beat == b[2][i]){osc.off();}
    }
    
}

//bowed lead instrument
[[2, 1, 4, 0],[0, 6, 8, 14]] @=> int bowPat1[][];
[[5,4, 2, 0],[0, 4,8,12]] @=> int bowPat2[][];

fun void bowPlayer(int beat, int b[][]){
    for (0 => int i; i < b[0].cap(); i++){
        if (beat == b[1][i]){
            bowed.off();
            bowed.play(dMin[b[0][i]]+12);
        }   
    }
}

//main score

Machine.add(me.dir() + "grain.ck")=> int grainId;
while (measure < 60){
    if (measure < 2){} else if (measure >=2 && measure< 4){
        voxPlayer(beat, voxPat1, dMin[0]);
        
    } else if (measure >=4 && measure< 6) {
        drums(beat, drumA, 2);
        voxPlayer(beat, voxPat1, dMin[0]);
    }  else if (measure >=6 && measure< 10) {
        if (beat == 0 && measure == 6){Machine.remove(grainId);}
        oscPlayer(beat, oscpat1);  
        drums(beat, drumB, 2);
        voxPlayer(beat, voxPat2, dMin[0]);
    }  else if (measure >=10 && measure< 14){
         oscPlayer(beat, oscpat2);  
         drums(beat, drumB, 1);
         voxPlayer(beat, voxPat2, dMin[4]);        
     }else if (measure >=14 && measure< 18) {
         oscPlayer(beat, oscpat1);  
         drums(beat, drumB, 2);
         voxPlayer(beat, voxPat2, dMin[0]);
     }  else if (measure >=18 && measure< 22){
         oscPlayer(beat, oscpat2);  
         drums(beat, drumB, 1);
         voxPlayer(beat, voxPat2, dMin[4]);        
     } else if (measure >= 22 && measure < 26){
       drums(beat, drum0, 2);
       oscPlayer(beat, oscpat1);   
     } else if (measure >= 26 && measure < 30){
       drums(beat, drum0, 2);
       oscPlayer(beat, oscpat1);
       if(beat%2 ==0){
         shaker.player(dMin[Math.random2(0, 6)]);     
       } 
     }  else if (measure >= 30 && measure < 34){
       drums(beat, drumC, 2);
       oscPlayer(beat, oscpat1);
       if(beat%2 ==0){
           shaker.player(dMin[Math.random2(0, 6)]);     
       } 
     } else if (measure >= 34 && measure < 38){
       drums(beat, drumC, 2);
       oscPlayer(beat, oscpat1);
       bowPlayer(beat, bowPat1);
       if(beat%2 ==0){
           shaker.player(dMin[Math.random2(0, 6)]);     
       } 
     } else if (measure >= 38 && measure < 42){
       drums(beat, drumB, 2);
       oscPlayer(beat, oscpat2);
       bowPlayer(beat, bowPat2);
       if(beat%2 ==0){
           shaker.player(dMin[Math.random2(0, 6)]);     
       } 
   } else if (measure >= 42 && measure < 46){
       drums(beat, drumB, 2);
       voxPlayer(beat, voxPat1, dMin[0]);
       oscPlayer(beat, oscpat1);
       bowPlayer(beat, bowPat1);
       if(beat%2 ==0){
           shaker.player(dMin[Math.random2(0, 6)]);     
       } 
   } else if (measure >= 46 && measure < 50){
       drums(beat, drumB, 2);
       voxPlayer(beat, voxPat2, dMin[4]);
       oscPlayer(beat, oscpat2);
       bowPlayer(beat, bowPat2);
       if(beat%2 ==0){
           shaker.player(dMin[Math.random2(0, 6)]);     
       } 
   } else if (measure >= 50 && measure < 54){
       drums(beat, drumB, 2);
       voxPlayer(beat, voxPat1, dMin[0]);
       oscPlayer(beat, oscpat1);
       bowPlayer(beat, bowPat1);
       if(beat%2 ==0){
           shaker.player(dMin[Math.random2(0, 6)]);     
       } 
   } else if (measure >= 54 && measure < 58){
       drums(beat, drumB, 2);
       voxPlayer(beat, voxPat2, dMin[4]);
       oscPlayer(beat, oscpat2);
       bowPlayer(beat, bowPat2);
       if(beat%2 ==0){
           shaker.player(dMin[Math.random2(0, 6)]);     
       } 
   } else {
       bowed.off();
       if (beat == 0 && measure != 59){
         Machine.add(me.dir() + "grain.ck")=> int grainId;
      } 
   }
    
    
    if (beat == 15){  
        measure ++; 
        0 => beat;
    } else {
        beat ++;   
    }
    tempo.sixt=>now;
}
Machine.remove(grainId);

