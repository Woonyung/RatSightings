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
color color0 = color(114, 169, 234); // dark blue
color color1 = color(234, 201, 253); // pale purple
color color2 = color(164, 194, 253); // pale blue
color color3 = color(102, 194, 252); // sky blue
color color4 = color(248, 252, 255); // grayish white
color color5 = color(0, 0, 255); // for placeholder


color[] colorArray = { color0 , color1, color2, color3, color4, color5};

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
  data = loadTable("Season1.csv", "header");
  float y = 100;
  for (TableRow row : data.rows()) { // load table and loop through each rows
    drawBarChart(row,y); // everytime you draw the pie chart

    y= y+ 100;
  }
  
}


void drawBarChart(TableRow data, float y){
  float total = 0;
  
  float w = 0;
  float mappedW = 0;
  float startX = 30;
  float endX = 30; 

  
  // looping through all the column and make the bar charts
  for ( int i = 0; i < data.getColumnCount()-1; i++){
    w = data.getFloat(i); //
    mappedW = map(w, 0, 10000, 0, 300); // actual bar 
    startX = endX;
    
    endX += mappedW;

    println(i + ": " + w + " is mapped into " + mappedW);
    noStroke();
    fill(colorArray[i]);
    rect(startX, y, mappedW, 10);
  }
  
}




void draw() {
  endRecord();
}
