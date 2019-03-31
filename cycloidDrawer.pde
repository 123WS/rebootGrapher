
PVector rnd, curr, last;
//PrintWriter output;

// Float T = -(6 * PI);                    //---variables for hypotrocycloid
  float b = (3/(2*(PI)));
  float a = 100;                   //outer radius
  float k = 2*PI;              //variable k
  float j = 50;             //inner radius
  
  
void setup()
{
  size(500,500);
  background(127);
 // output = createWriter("points.txt");
  curr = new PVector(250,250);
  last = new PVector(0,0);
  rnd = new PVector(0,0);  
}

 
  
  
  
 /*float x = 250;
float y = 250;
float z = 250;
float c = 250;                           //----------now use pvector

  float fx = 0;
  float fy = 0;
  int fyi = 0;
  int fxi = 0;
  int yi = 0;
  int xi = 0;*/
  float v = 0.0;
  
  boolean first = true;
  boolean lasti = false;
void draw()
{
  
 // float q=k;
  
  
  
  if(mousePressed)
  {
    j = mouseX;
    a = mouseY;
     if(key == 'b')
    {
      k += QUARTER_PI;
      
    }
    if( key == 'l')
    {
      k = PI;
      b = PI;
    }
    if(key == 'c')
    {
      k -= QUARTER_PI;
    }
    if(key == 'd')
    {
     b += QUARTER_PI;  
    }
    
    if(key == 'g')
    {
      b -= QUARTER_PI;
    }
    
  }
  
  
  background(127);

  
 // println( "-------------------------------");
 // while( !last )
  //{
    if(first){
      
  for(float T = -(8*PI); T < (8*PI); T = T + (PI/64)){
   // println( b);                                                 //convert x,y to vector format  
    curr.x = a*cos((b*T)-PI)+ (j*cos(k*T));                            //something like p[0] = initial p[1]= curr and p[2]= last
    curr.y = a*sin((b*T)-PI)- (j*sin(k*T));
    curr.x = curr.x + (width/2);
    curr.y = curr.y + (height/2);
    if(curr.x == last.x)
      {
        println("----------------------");
        break;
      }
      
      
      
      
      
    //output.println(curr.x+ "\t"+ curr.y+"\t"+ (T/PI));    //-----------txt file output
 /* 
 if(first==true)
  {
    fx = x;
    fy = y;
    
    fxi = int(fx/10);
    fyi  = int(fy/10);
    first = false;
    println( fxi + " :fxi"  + fyi + " :fy");
  }
 
  if( (yi == fyi) &&(first))
    {
      //println( "-------------------------------");
      last = true;
      break;
    }
    
      xi = int(x/10);
      yi = int(y/10);*/
    point(curr.x,curr.y);                                                //using vectors ===>   p[1] => p[2],,,,,  point(p[1].x,p[1].y)
   line(curr.x,curr.y,last.x,last.y);                         //line(p[1].x,p[1].y,p[2].x,p[2].y)
   
   // println(xi + "-----------------"+fxi+"        "+fyi+  "--------------" + yi);
   last.x = curr.x;
   last.y = curr.y;
  // T = T + (PI/6);
   
  // println(x + "            " + y + "                      " + (T) );
  
   
  }
    }
  
 //   first = false;
   // }
    
  
  
  
  
  
  
/*
  if( j <= 500)
  {
    j = j-5;
     T = -(6 * PI);
     if(j==-500)
     {
       j=500;
     }
     println(j+"------------------------");
    }
  if( j <= -500)
  { 
    j = j+5;
     T = -(6 * PI);
     println(j+"------------------------");
  }
if(mousePressed == true)
   {
     b = b + (PI/3);
     T = -(6 * PI);
     
     
   }
  */
 // output.flush();
 // output.close();
  //exit();
  
}

//-------------------------------class of the hyp


class hypotricycloid
{
  float a, b, k, j;
  int sf;                //scale factor
  PVector qrnd, qlast, qcurr;
  
  hypotricycloid()     // default constructor
  {
   
    b = (3/(2*(PI)));
    a = 100;                   //outer radius
    k = 2*PI;              //variable k
    j = 50;
    sf = 2;

  }
  hypotricycloid(float q, float w, float e, float r, int s)   //constructor w/ parameters
  {
    
    a = q;
    b = w;
    j = e;
    k = r;
    sf = s;
  }
  
  
  void drawhyp()
  {
     qcurr = new PVector(width/sf,height/sf);
     qlast = new PVector(0,0);
     qrnd = new PVector(0,0);                   //-------initial condition vector
     
     
    for(float T = -(8*PI); T < (8*PI); T = T + (PI/64)){
   // println( b);                                                //||convert x,y to vector format  
        qcurr.x = a*cos((b*T)-PI)+ (j*cos(k*T));                            //||something like p[0] = initial p[1]= curr and p[2]= last
        qcurr.y = a*sin((b*T)-PI)- (j*sin(k*T));
        qcurr.x = qcurr.x + (width/sf);
        qcurr.y = qcurr.y + (height/sf);
        
   //----------draw it out  ------------------------
     point(qcurr.x,qcurr.y);                                                //||using vectors ===>   p[1] => p[2],,,,,  point(p[1].x,p[1].y)
     line(qcurr.x,qcurr.y,qlast.x,qlast.y);  
     qlast.x = qcurr.x;
     qlast.y = qcurr.y;
   }
 }
    
}; //-----------------------end class

