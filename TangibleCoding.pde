/*

  Meng Shi
  lolaee@gmail.com
  for course Strategy Lab at Carnegie Mellon University
  Mon May 6, 2013
 */

// we need to import the TUIO library
// and declare a TuioProcessing client variable
import TUIO.*;
TuioProcessing tuioClient;

// these are some helper variables which are used
// to create scalable graphical feedback
float cursor_size = 15;
float object_size = 60;
float table_size = 500;
float scale_factor = 1;
PFont font;
PFont font_mono;
float colorhsb;

PImage f0background;
PImage f1boy;
PImage f2fresh;
PImage f3wheel;
PImage f4girl;
PImage f5blessed;
PImage f6great;
PImage window;

int windowsPosx;
int windowsPosy;



void setup()
{
  //size(screen.width,screen.height); 
  size(1440, 900);

  noStroke();


  loop();
  frameRate(50);
  //noLoop();

  hint(ENABLE_NATIVE_FONTS);
  font = createFont("lobster", 18);
  font_mono = createFont("monaco", 13);
  scale_factor = height/table_size;

  // we create an instance of the TuioProcessing client
  // since we add "this" class as an argument the TuioProcessing class expects
  // an implementation of the TUIO callback methods (see below)
  tuioClient  = new TuioProcessing(this);

  f0background = loadImage("f0background.png");
  f1boy = loadImage("f1boy.png");
  f2fresh = loadImage("f2fresh.png");
  f3wheel = loadImage("f3wheel.png");
  f4girl = loadImage("f4girl.png");
  f5blessed = loadImage("f5blessed.png");
  f6great = loadImage("f6great.png");


  window = loadImage("windows.png");


  windowsPosx=width-430;
  windowsPosy=120;
  colorhsb=141;

  //   imageMode(CENTER);
}

// within the draw method we retrieve a Vector (List) of TuioObject and TuioCursor (polling)
// from the TuioProcessing client and then loop over both lists to draw the graphical feedback.
void draw()
{
  background(255);
  smooth();
  // interface head
  fill(21, 27, 31);
  noStroke();
  rect(0, 0, width, 80);

  fill(238, 238, 238);
  textFont(font, 30);
  text("Codecademy Playground", 40, 50);

  // windows
  image(window, windowsPosx, windowsPosy);

  // text rect background in windows
  fill(245, 245, 245);
  rect(windowsPosx+26, windowsPosy+43, 300, 57);

  fill(56, 56, 56);
  textFont(font_mono);
  text("Hi there! Let's start by playing", windowsPosx+35, windowsPosy+65);
  text("with tangible code blocks!", windowsPosx+35, windowsPosy+87);

  //interface footer
  fill(167, 209, 231);
  noStroke();
  rect(0, height-80, width, 80);

  fill(0, 128, 205);
  noStroke();
  rect(0, height-72, width, 72);

  textFont(font, 18*scale_factor); // font size is 18
  float obj_size = object_size*scale_factor; // 60
  float cur_size = cursor_size*scale_factor; // 15

  Vector tuioObjectList = tuioClient.getTuioObjects();

  //===================================

  for (int i=0;i<tuioObjectList.size();i++) {
    TuioObject tobj = (TuioObject)tuioObjectList.elementAt(i);

    // ================f0
    if (tobj.getSymbolID()==0) {

      // what happens in the canvas
      pushMatrix();
      translate(tobj.getScreenX(width), tobj.getScreenY(height));
      rotate(tobj.getAngle());

      colorMode(HSB);
      tint(colorhsb, 200, 230); 
      //      rect(-20, -20, 320, 320);
      colorMode(RGB, 255);
      image(f0background, -20, -20);
      noTint();

      popMatrix();

      // code description in the windows

      float xpos0=tobj.getScreenX(width);
      float ypos0=tobj.getScreenY(height);
      float angle0=tobj.getAngle()/(2*PI)*360;


      String x = new String(Float.toString(xpos0));
      String y = new String(Float.toString(ypos0));
      String deg = new String(Float.toString(angle0));

      float thetay=120;// relative position to windowsPosy
      float theta=22; // line theta

      float thetax=103; // relative posiiton to windows
      float thetatab=57; // tab

      fill(56, 56, 56);
      textFont(font_mono);
      text(x, windowsPosx+thetax, windowsPosy+thetay);
      text(y, windowsPosx+thetax+thetatab, windowsPosy+thetay);
      text(">> rect(      ,      , 320, 320);", windowsPosx+35, windowsPosy+thetay);

      fill(0, 182, 94);
      text("//draw a square", windowsPosx+35, windowsPosy+thetay+theta);
      text("//at position (      ,      )", windowsPosx+35, windowsPosy+thetay+theta*2);  
      text("//width and height equal to (320, 320)", windowsPosx+35, windowsPosy+thetay+theta*3);  

      text(x, windowsPosx+thetax+thetatab, windowsPosy+thetay+theta*2);  
      text(y, windowsPosx+thetax+thetatab*2, windowsPosy+thetay+theta*2);

      float blockgap=10;
      fill(245, 245, 245);
      rect(windowsPosx+26, windowsPosy+thetay+theta*3+blockgap, 300, 57);

      fill(56, 56, 56);
      text("don't forget semicolon\';\'", windowsPosx+35, windowsPosy+thetay+theta*4+blockgap);
      text("let's learn add images and text", windowsPosx+35, windowsPosy+thetay+theta*5+blockgap);

      float newstartY = windowsPosy+thetay+theta*3+blockgap+74;
      text(">> rect(      ,      , 320, 85);", windowsPosx+35, newstartY+theta);

      text(">> text(\"Start coding now!\");", windowsPosx+35, newstartY+theta*2);

      text(x, windowsPosx+thetax, newstartY+theta);  
      text(y, windowsPosx+thetax+thetatab, newstartY+theta);
      fill(0, 182, 94);
      text("//similarly, a rectangle & some text", windowsPosx+35, newstartY);
    }

    // ================f3

    else if (tobj.getSymbolID()==3) {
      pushMatrix();
      translate(tobj.getScreenX(width), tobj.getScreenY(height));
      rotate(tobj.getAngle());

      imageMode(CENTER);
      image(f3wheel, 0, 0);
      imageMode(CORNER);
      colorhsb=tobj.getAngle()/(PI*2)*255;
      popMatrix();

      float newstartY=522+22*4;
      float theta=22; // line theta

      int xf=int(map(tobj.getAngle()/(PI*2)*255, 0, 255, 0, 255));
      String x = new String(Integer.toString(xf));

      textFont(font_mono);
      fill(56, 56, 56);
      text(">> colorMode(HSB);", windowsPosx+35, newstartY+theta*2);

      fill(0, 182, 94);
      text("//switch to hsb color mode", windowsPosx+35, newstartY+theta*1);


      fill(0, 182, 94);
      text("//change color hue", windowsPosx+35, newstartY+theta*3);

      fill(56, 56, 56);
      text(">> tint(    , 255, 255);", windowsPosx+35, newstartY+theta*4);
      text(x, windowsPosx+99, newstartY+theta*4);
    }

    // ================f1

    else if (tobj.getSymbolID()==1) {
      pushMatrix();
      translate(tobj.getScreenX(width), tobj.getScreenY(height));
      rotate(tobj.getAngle());

      image(f1boy, 0, 0);
      popMatrix();

      textFont(font_mono);
      float newstartY=390+66;
      float theta=22; // line theta

      fill(0, 182, 94);
      text("//add an image", windowsPosx+35, newstartY);

      fill(56, 56, 56);
      text(">> PImage boy = loadImage(\"boy.png\");", windowsPosx+35, newstartY+theta);
      text(">> image( boy,       ,       );", windowsPosx+35, newstartY+theta*3);

      float xpos0=tobj.getScreenX(width);
      float ypos0=tobj.getScreenY(height);

      String x = new String(Float.toString(xpos0));
      String y = new String(Float.toString(ypos0));
      text(x, windowsPosx+160, newstartY+theta*3);
      text(y, windowsPosx+220, newstartY+theta*3);

      fill(0, 182, 94);
      text("// placement position", windowsPosx+35, newstartY+theta*2);
    }

// ================f4

    else if (tobj.getSymbolID()==4) {
      pushMatrix();
      translate(tobj.getScreenX(width), tobj.getScreenY(height));
      rotate(tobj.getAngle());

      image(f4girl, 0, 0);
      popMatrix();

      textFont(font_mono);
      float newstartY=390+66;
      float theta=22; // line theta

      fill(0, 182, 94);
      text("//add an image", windowsPosx+35, newstartY);

      fill(56, 56, 56);
      text(">> PImage girl = loadImage(\"girl.png\");", windowsPosx+35, newstartY+theta);
      text(">> image( girl,      ,      );", windowsPosx+35, newstartY+theta*3);

      float xpos0=tobj.getScreenX(width);
      float ypos0=tobj.getScreenY(height);

      String x = new String(Float.toString(xpos0));
      String y = new String(Float.toString(ypos0));
      text(x, windowsPosx+160, newstartY+theta*3);
      text(y, windowsPosx+220, newstartY+theta*3);

      fill(0, 182, 94);
      text("// placement position", windowsPosx+35, newstartY+theta*2);
    }

    // ================f5

      else if (tobj.getSymbolID()==5) {


      pushMatrix();
      translate(tobj.getScreenX(width), tobj.getScreenY(height));
      rotate(tobj.getAngle());
      colorMode(HSB);
      tint(colorhsb, 200, 230);
      colorMode(RGB); 
      image(f5blessed, 0, -30);

      noTint();
      popMatrix();

      float newstartY=522+22;
      float theta=22; // line theta


      textFont(font_mono);
      fill(0, 182, 94);
      text("// add a mood description", windowsPosx+35, newstartY);
      text("// placement position", windowsPosx+35, newstartY+theta*2);
      fill(56, 56, 56);
      text(">> PImage mood = loadImage(\"blessed.png\");", windowsPosx+35, newstartY+theta);
      text(">> image(mood,      ,      );", windowsPosx+35, newstartY+theta*3);
      float xpos0=tobj.getScreenX(width);
      float ypos0=tobj.getScreenY(height);

      String x = new String(Float.toString(xpos0));
      String y = new String(Float.toString(ypos0));

      text(x, windowsPosx+150, newstartY+theta*3);
      text(y, windowsPosx+210, newstartY+theta*3);
    }
    
    // ================f6

      else if (tobj.getSymbolID()==6) {


      pushMatrix();
      translate(tobj.getScreenX(width), tobj.getScreenY(height));
      rotate(tobj.getAngle());
      colorMode(HSB);
      tint(colorhsb, 200, 230);
      colorMode(RGB); 
      image(f6great, 0, -30);
      
      noTint();
      popMatrix();

      float newstartY=522+22;
      float theta=22; // line theta


      textFont(font_mono);
      fill(0, 182, 94);
      text("// add a mood description", windowsPosx+35, newstartY);
      text("// placement position", windowsPosx+35, newstartY+theta*2);
      fill(56, 56, 56);
      text(">> PImage mood = loadImage(\"great.png\");", windowsPosx+35, newstartY+theta);
      text(">> image(mood,      ,      );", windowsPosx+35, newstartY+theta*3);
      float xpos0=tobj.getScreenX(width);
      float ypos0=tobj.getScreenY(height);

      String x = new String(Float.toString(xpos0));
      String y = new String(Float.toString(ypos0));

      text(x, windowsPosx+150, newstartY+theta*3);
      text(y, windowsPosx+210, newstartY+theta*3);
    }
    
    // ================f2

      else if (tobj.getSymbolID()==2) {


      pushMatrix();
      translate(tobj.getScreenX(width), tobj.getScreenY(height));
      rotate(tobj.getAngle());
      colorMode(HSB);
      tint(colorhsb, 200, 230);
      colorMode(RGB); 
      image(f2fresh, 0, -30);

      //      fill(255, 0, 0);
      //      text("I am feeling lucky!", 80, 100);
      noTint();
      popMatrix();

      float newstartY=522+22;
      float theta=22; // line theta


      textFont(font_mono);
      fill(0, 182, 94);
      text("// add a mood description", windowsPosx+35, newstartY);
      text("// placement position", windowsPosx+35, newstartY+theta*2);
      fill(56, 56, 56);
      text(">> PImage mood = loadImage(\"fresh.png\");", windowsPosx+35, newstartY+theta);
      text(">> image(mood,      ,      );", windowsPosx+35, newstartY+theta*3);
      float xpos0=tobj.getScreenX(width);
      float ypos0=tobj.getScreenY(height);

      String x = new String(Float.toString(xpos0));
      String y = new String(Float.toString(ypos0));

      text(x, windowsPosx+150, newstartY+theta*3);
      text(y, windowsPosx+210, newstartY+theta*3);
    }
    



//    fill(255, 0, 255);
//    text(tobj.getSymbolID(), tobj.getScreenX(width), tobj.getScreenY(height));
  }


  //  

  //  ================================================================

  Vector tuioCursorList = tuioClient.getTuioCursors();
  for (int i=0;i<tuioCursorList.size();i++) {
    TuioCursor tcur = (TuioCursor)tuioCursorList.elementAt(i);
    Vector pointList = tcur.getPath();

    if (pointList.size()>0) {
      stroke(0, 0, 255);
      TuioPoint start_point = (TuioPoint)pointList.firstElement();
      ;
      for (int j=0;j<pointList.size();j++) {
        TuioPoint end_point = (TuioPoint)pointList.elementAt(j);
        line(start_point.getScreenX(width), start_point.getScreenY(height), end_point.getScreenX(width), end_point.getScreenY(height));
        start_point = end_point;
      }

      stroke(192, 192, 192);
      fill(192, 192, 192);
      ellipse( tcur.getScreenX(width), tcur.getScreenY(height), cur_size, cur_size);
      fill(0);
      text(""+ tcur.getCursorID(), tcur.getScreenX(width)-5, tcur.getScreenY(height)+5);
    }
  }
}

// these callback methods are called whenever a TUIO event occurs

// called when an object is added to the scene
void addTuioObject(TuioObject tobj) {
  println("add object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle());
}

// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
  println("remove object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+")");
}

// called when an object is moved
void updateTuioObject (TuioObject tobj) {
  println("update object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle()
    +" "+tobj.getMotionSpeed()+" "+tobj.getRotationSpeed()+" "+tobj.getMotionAccel()+" "+tobj.getRotationAccel());
}

// called when a cursor is added to the scene
void addTuioCursor(TuioCursor tcur) {
  println("add cursor "+tcur.getCursorID()+" ("+tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY());
}

// called when a cursor is moved
void updateTuioCursor (TuioCursor tcur) {
  println("update cursor "+tcur.getCursorID()+" ("+tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY()
    +" "+tcur.getMotionSpeed()+" "+tcur.getMotionAccel());
}

// called when a cursor is removed from the scene
void removeTuioCursor(TuioCursor tcur) {
  println("remove cursor "+tcur.getCursorID()+" ("+tcur.getSessionID()+")");
}

// called after each message bundle
// representing the end of an image frame
void refresh(TuioTime bundleTime) { 
  redraw();
}

