
//----------------export stuff
import processing.dxf.*;
boolean dxfExport;
//-----------------
class hypotricycloid
{
  float a, b, k, j, iter;
  float res = 32;
  float revs = 4*PI;
  boolean first;
  PVector qrnd, qlast, qcurr;
 
  
  hypotricycloid()     // default constructor
  {
      /*
      
     x = a( (cos[b*T]-PI) + jcos[k*t] )
      
      */
      
    b = (3/(2*(PI)));         //variable b
    a = 100;                   //outer radius
    k = (3/2*PI);              //variable k
    j = 50;               //inner radius
    iter = 6.0;
    res = 32.0;    //pi/res 
    revs = 15*PI;
     boolean first = true;
   

  }
  hypotricycloid(float outer_radius, float w, float inner_radius, float r, float t, float re, float revolutions)   //constructor w/ parameters
  {
    a = outer_radius;
    b = w;
    j = inner_radius;
    k = r;
    iter = t;
    res = re;
     revs = revolutions;
      boolean first = true;
  }
  
  
  void drawhyp()
  {
 
  
     qcurr = new PVector(0,0);
     qlast = new PVector(0,0);
     qrnd = new PVector(0,0);  
     
    for(float T = -(revs); T < (revs); T = T + (PI/res)){
   // println( b);                                                 //||convert x,y to vector format  
        qcurr.x = a*cos((b*T)-PI)+ (j*cos(k*T));         // current updated                   //||something like p[0] = initial p[1]= curr and p[2]= last
        qcurr.y = a*sin((b*T)-PI)- (j*sin(k*T));        //
        qcurr.x = qcurr.x + (width/2);                  // current reposition
        qcurr.y = qcurr.y + (height/2);   
        //
   //----------draw it out  ------------------------
   if(!this.first)                                          //first run do nothing so qcurr is V whats going to happen below
     {
    // point(qcurr.x,qcurr.y);                          
     line(qcurr.x,qcurr.y,qlast.x,qlast.y);  
     }
     qlast.x = qcurr.x;                                  //set to post condition qlast
     qlast.y = qcurr.y;
     this.first = false;
    
   }
 }
    
}; //-----------------------end class

hypotricycloid hyp, q;  //-----------create hyp objects


void setup()
{
  size(500,500,P3D);
  background(127);
 
  
  //hyp = new hypotricycloid();
  q = new hypotricycloid(100,(11/(8*PI)),21,4*PI, 6, 5, 4*PI);
  noLoop();
}



 


//----------------draw fun!
void draw(){
    if (dxfExport) {
    beginRaw(DXF, "hyp.dxf");
  }
   background(127);
  q.drawhyp();
  //hyp.drawhyp();
  
  if(dxfExport) {
    endRaw();
    dxfExport = false;
  }
  
}




//-------------key mappings
void keyPressed() {
 
  // use a key press so that it doesn't make a million files
  if (key == 'x'){
    dxfExport = true;
    println("DXF export complete!");
  }
  if(key == 'q')
 {
   q.k = q.k + HALF_PI;
  
 }
 if(key == 'w')
 {
   q.k -= HALF_PI;
 }
   if(key == 'u')
 {
   q.b = q.b + HALF_PI;
  
 }
    if(key == 'y')
 {
   q.b = q.b - HALF_PI;
  
 }
     if(key == '9')
 {
   q.revs = q.revs - PI/64;
  
 }
      if(key == '0')
 {
   q.revs = q.revs + PI/64;
  
 }
      if(key == '1')
 {
   if(q.res - 15 < 0)
   {
     q.res = 16;
   }
   q.res = q.res - 15;
  
 }
       if(key == '2')
 {
   q.res = q.res + 15;
  
 }
 
 if(key == ',')
 {
   q.j = q.j - 10;
 }
 if (key == '.')
 {
   q.j = q.j + 10;
}
 redraw();//------------needed!

}



