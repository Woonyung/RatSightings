/*
Rat Sightings in NY states
October 2th, 2014
woonyungchoi@gmail.com

draw bar charts accodring to number of ratsightings in specific borough/season

it does print out the values ( working fine to read out the table)
but does not make the bar charts...
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
float startAngle = 0;
float actualAngles = 0;
float endAngle = 0;
float num = 0;
Table data;


void setup() {
  size(1000, 800);
  background(100);
  smooth();
  noLoop();
 
  beginRecord(PDF, "Monthly_01.pdf"); 
  noStroke();
  
  // load table
  //loadData();
  data = loadTable("season_test.csv", "header");
  float x = 30;
  float y = 100;
  for (TableRow row : data.rows()) { // load table and loop through each rows
    drawBarChart(row, x, y); // everytime you draw the pie chart
    y= y+ 100;
  }
  
}


void drawBarChart(TableRow data, float x, float y){
  float total = 0;
  
  float w = 0;
  float mappedW = 0;
  
  for ( int i = 0; i < data.getColumnCount(); i++){
    //total = data.getFloat("Total");
    println("Total: " + total);
  }
  
  
  // looping through all the column and make the bar charts
  for ( int i = 1; i < data.getColumnCount()-1; i++){
    w = data.getFloat(i); //
    mappedW = map(w, 0, 10000, 0, 300);
  
    println(w + " is mapped into " + mappedW);
    
    noStroke();
    fill(colorArray[i]);
    rect(x+(i*w),y,w, 30);
  }
  
}




void draw() {
  endRecord();
}
