//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float topX, topY, topWidth, topHeight;
float bottomX, bottomY, bottomWidth, bottomHeight;
float picWidthAdjusted2=0.0, picHeightAdjusted2=0.0;
PImage pic1, pic2, pic3;
Boolean nightMode=false;
int tintDayMode=255, tintDayModeOpacity=50, tintRed=64, tintGreen=64, tintBlue=40, tintNightModeOpacity=85;
//
void setup()
{
  size(1300, 1100); //Landscape
  appWidth = width;
  appHeight = height;
  //
  //Population
  pic1 = loadImage("../Images/water.jpg");
  pic2 = loadImage("../Images/seal1.jpg");
  pic3 = loadImage("../Images/seal1.jpg");
  //
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  //
  topX = appWidth *1/4;
  topY = appHeight * 3/20;
  topWidth = appWidth * 1/2;
  topHeight = appHeight * 1/5;
  bottomX = appWidth * 1/4;
  bottomY = appHeight * 1/2;
  bottomWidth = appWidth * 1/2;
  bottomHeight = appHeight * 1/5;
  //
  int picWidth2 = 525 ;
  int picHeight2 = 840 ; 
  float smallerDimension2, largerDimension2, imageWidthRatio2=0.0, imageHeightRatio2=0.0;
 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //2
  if ( picWidth2 >= picHeight2 ) { //True if Landscape or Square
    largerDimension2 = picWidth2;
    smallerDimension2 = picHeight2;
    //
    //Landscape Image larger image to smaller rectangle (or larger)
    picWidthAdjusted2 = topWidth; //stretch or reduce
    imageHeightRatio2 = smallerDimension2 / largerDimension2;
    picHeightAdjusted2 = picWidthAdjusted2 * imageHeightRatio2;
    //
    if ( picHeightAdjusted2 > topHeight ) {// Error catch
      println("STOP: image is too big for rectangle layout1");
      exit(); //stop further use of the APP
    }
  } else { //if Portrait
    largerDimension2 = picHeight2;
    smallerDimension2 = picWidth2;
    //
    picHeightAdjusted2 = topHeight; 
    imageWidthRatio2 = smallerDimension2 / largerDimension2;
    picWidthAdjusted2 = picHeightAdjusted2 * imageWidthRatio2;
    if ( picWidthAdjusted2 > topWidth ) {
      println("STOP: image is too big for rectangle layout");
      exit(); //stop further use of the APP
    }
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //Rectangular Layout and Image Drawing to CANVAS
  rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  rect( topX, topY, topWidth, topHeight );
  rect( bottomX, bottomY, bottomWidth, bottomHeight );
  //

  image( pic1, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
}//End setup
//
void draw()
{
  image( pic2, topX, topY, picWidthAdjusted2, picHeightAdjusted2 );
  image( pic3, bottomX, bottomY, bottomWidth, bottomHeight );
}//End draw
//
void keyPressed() {
}//End keyPressed
//
void mousePressed() {
  //  
  //Mouse Pressed will control background image
  if ( mouseButton == LEFT) {
    nightMode = true;
    rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
    tint(35, 78,134); //RGB: Night Mode
    image( pic1, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  }
  if ( mouseButton == RIGHT ) {
    nightMode = false;
    rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
    tint(256, 256, 256);
    image(pic1, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  }
}//End mousePressed
//
//End Main Program
