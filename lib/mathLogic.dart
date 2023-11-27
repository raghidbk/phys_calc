import 'package:flutter/material.dart';

class mathLogic{
  bool inv= false;

  String Fdisp({double disp = 0,double velo = 0, double time = 0}){
    if(velo <= 0 || time <= 0 || disp<=0){
      inv = true;
    }else if(velo>0 && time>0){
      disp = velo*time;
    }else if(disp>0 && time>0){
      velo = disp/time;
    }else if(disp>0 && velo>0){
      time = disp/velo;
    }
    return 'the dipslasment is $disp the velocity is $velo and the time is $time ';
  }//displacement logic

  String Facc({double acc = 0,double veloi = 0, double velof = 0, double time=0}){
   if(acc<0 || veloi<0 || velof<0 || time<0){
     inv = true;
   }else{
     acc = (velof - veloi)/time;
   }
    return 'the acceleration is $acc';
  }//acceleration

  String FVelocity({double velof = 0, double veloi = 0,double acc = 0, double time =0}){
   if(velof<0 || veloi<0 || acc<0 || time<0){
     inv = true;
   }else{
     velof = veloi+(acc*time);
   }
    return 'the final velocity is $velof';
  }//final velocity

  String Fdistance({double dist=0,double veloi=0,double time=0,double acc=0}){
    if(dist<0 || veloi<0 || time<0 || acc<0){
      inv = true;
    }else{
      dist = (veloi*time)+(1/2)*(acc*(time*time));
    }
    return 'the distance is $dist';
  }//distance

String FFinalPostion({double postf=0,double posti=0,double veloi=0,double time=0, double acc=0}){
    if(postf<0 || posti<0 || veloi<0 || time<0 || acc<0){
      inv=true;
    }else{
      postf = posti+(veloi*time)+(1/2)*(acc*(time*time));
    }
    return 'the final position is $postf';
}
}





