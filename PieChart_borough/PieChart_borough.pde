/*
Rat Sightings in NY states
October 5th, 2014
woonyungchoi@gmail.com

draw pie chart accodring to number of ratsightings in specific borough / month
*/

import processing.pdf.*;

//===========color codes ==============//
color color0 = color(255); // just for placeholder
color color1 = color(114, 169, 234); // dark blue
color color2 = color(234, 201, 253); // pale purple
color color3 = color(164, 194, 253); // pale blue
color color4 = color(102, 194, 252); // sky blue
color color5 = color(248, 252, 255); // grayish white

color[] colorArray = { color0 , color1, color2, color3, color4, color5};

//====== variables for pie graphs ===============//
float[] guideEllipse = { 300, 500, 1000, 1300};

float startAngle = 0;
float actualAngles = 0;
float endAngle = 0;
float num = 0;
float ellipseSize;

String monthLabel;

Table data;



void setup() {
  size(800, 3000);
  background(255);
  smooth();
  noLoop();
 
  beginRecord(PDF, "Monthly_01.pdf"); 
  noStroke();
  
  // load table
  loadData();
  
  // guide for size of pie graphs- loa this function only for layout
  // drawGuideEllipse(200);
}



void draw() {
  endRecord();
}
