void loadData(){
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


void drawGuideEllipse(float y){
  float ellipseSize = 0;
  for ( int i = 0; i < guideEllipse.length; i++){
    ellipseSize = map(guideEllipse[i], 0, 1411, 0, 80);
    println(i + ":" + ellipseSize);
    fill(255,0,0);
    noStroke();
    ellipse( 300 + i + i *100, y, ellipseSize, ellipseSize);
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
    println(total + " is mapped into : " + ellipseSize);
   
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
