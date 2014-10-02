/*
Rat Sightings in NY states
October 1th, 2014
woonyungchoi@gmail.com

draw pie chart accodring to number of ratsightings in specific borough / month
*/

import processing.pdf.*;

//===========color codes ==============//
color redColor = color(251, 143, 131);
color orangeColor = color(253, 209, 135);
color yellowColor = color(254, 243, 129);
color yellowGreenColor = color(171, 251, 133);
color GreenColor = color(99, 232, 145);

color[] colorArray = { 
  redColor, yellowGreenColor, yellowColor, orangeColor, GreenColor};


//====== variables for pie graphs ===============//
float startAngle = 0;
float actualAngles = 0;
float endAngle = 0;
float num = 0;
float ellipseSize;


Table data;


void setup() {
  size(800, 1400);
  background(255);
  smooth();
  noStroke();
  noLoop();
 
  beginRecord(PDF, "filename.pdf"); 
  
  // load table
  //loadData();
  data = loadTable("Monthly.csv", "header");
  float x = 100;
  float y = 100;
  for (TableRow row : data.rows()) { // load table and loop through each rows
    drawPieChart(row, x, y); // everytime you draw the pie chart
    
    x = x + 150; // give me a padding
    // if x is greater than 700
    if (x > 700) {
        x = 100;
        y = y +150;  // increment y
    }
  }
  
  
}


void drawPieChart(TableRow data, float x, float y) { // passing the table data(array), graphs' x/y position
  
  // get total sum of dataset so that I can map those as size of pie charts
  float total = 0;
  float ellipseSize = 0;
  for ( int i = 0; i < data.getColumnCount(); i++) {
    //total += data.getFloat(i);
    total = data.getFloat("Total");
    ellipseSize = map(total, 0, 1411, 0, 80);
    
  }
  
  num = 360.0/total;

  // looping through all the columns and draw pie charts
  float startAngle = -90;
  float actualAngles = 0;
  float endAngle = -90;
  
  for (int i = 0; i < data.getColumnCount()-1; i++) { 
    startAngle = endAngle; // when next data set is loaded start from last's angle
    actualAngles = data.getFloat(i) * num; // calculate actual angles
    //println("actual angles: " + actualAngles);
    endAngle += actualAngles; 
    //println("end angle: " + endAngle);

    // pie graphs
    fill(colorArray[i]);
    arc(x, y, ellipseSize, ellipseSize, radians(startAngle), radians(endAngle));
  }
}




void draw() {
  endRecord();
}
