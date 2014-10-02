/*
Rat Sightings in NY states
October 1th, 2014
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


//color color1 = color(35, 206, 118);
//color color2 = color(240);
//color color3 = color(253, 110, 107);
//color color4 = color(239, 75, 86);
//color color5 = color(147, 162, 170);


color[] colorArray = { color0 , color1, color2, color3, color4, color5};


//====== variables for pie graphs ===============//
float startAngle = 0;
float actualAngles = 0;
float endAngle = 0;
float num = 0;
float ellipseSize;

String monthLabel;

Table data;


void setup() {
  size(800, 1400);
  background(255);
  smooth();
  noLoop();
 
  beginRecord(PDF, "Monthly_01.pdf"); 
  noStroke();
  
  // load table
  //loadData();
  data = loadTable("Monthly_1.csv", "header");
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
   
    monthLabel = data.getString("Month");
  }
  
  num = 360.0/total;

  // looping through all the columns and draw pie charts
  float startAngle = -90;
  float actualAngles = 0;
  float endAngle = -90;
  
  for (int i = 1; i < data.getColumnCount()-1; i++) { 
    startAngle = endAngle; // when next data set is loaded start from last's angle
    actualAngles = data.getFloat(i) * num; // calculate actual angles
    //println("actual angles: " + actualAngles);
    endAngle += actualAngles; 
    //println("end angle: " + endAngle);

    // pie graphs
    fill(colorArray[i]);
    arc(x, y, ellipseSize, ellipseSize, radians(startAngle), radians(endAngle));
    
    noStroke();
    fill(0);
    text(monthLabel, x-10, y + 50); 
  }
}




void draw() {
  endRecord();
}
