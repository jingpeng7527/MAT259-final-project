void constructGUI() {
  cp5.addTextfield("input")
    .setPosition(width-15-150, 15)
    .setSize(150, 30)
    .setFont(createFont("SansSerif", 15))
    .setColor(background)
    .setColorActive(color(foreground))
    .setColorBackground(color(foreground, 200))
    .setColorForeground(background)
    .setColorCaptionLabel(foreground)
    .setColorCursor(background)
    .getCaptionLabel().setVisible(false);
    
  List l = Arrays.asList("a", "b", "c", "d", "e", "f", "g", "h");
  cp5.addScrollableList("dropdown")
     .setPosition(width-15-150, 50)
     .setSize(150, height-100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(l)
     //.addItems(selectedKeywords)
     .setFont(createFont("SansSerif", 10))
     .setType(ControlP5.LIST)
     .setColorActive(color(foreground))
     .setColorBackground(color(foreground, 200))
     .setColorForeground(background)
     .setColorCaptionLabel(foreground)
     .setColorValue(background)
     .getCaptionLabel().setVisible(false);

  cp5.setAutoDraw(false);
}

void drawGUI() {
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  textFont(font);
  stats();  
  
  pushMatrix();
  textFont(font);
  textSize(12);
  fill(#FFFFFF, 150);
  textAlign(RIGHT, BOTTOM);
  text("MAT 259 | Jing Peng", width-15, height-45);
  text("Movies rating since 2020 from IMDb",  width-15, height-30);
  text("Data Source: IMDb Non-Commercial Datasets", width-15, height-15);
  textValue = cp5.get(Textfield.class, "input").getText();

  textSize(20);
  textAlign(LEFT, TOP);  
   text("Movies rating since 2020 from IMDb", 15, 15);
   text("MAT 259 | Jing Peng", 15, 45);

  popMatrix();
  cp5.draw();

  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}

void stats(){
  if(selectedKeywords.size() == 0)
    return;
    
  Movie w = map.get(selectedKeywords.get(0));

  textSize(45);
  textAlign(LEFT, CENTER);
  text(w.title, 15, height-150);
  
  fill(foreground);
  textSize(20);
  text("Year: " + w.year, 20, height-100);
  text("Rating: " + w.rating, 20, height-75);
  text("Votes: " + w.votes, 20, height-50);
  text("Genres: " + w.genres, 20, height-25);
}

void drawAxis(){
    pushMatrix();
    stroke(100);
    noFill();
    strokeWeight(1);
    translate(-0.5*minRadius,0,0);
    box(2*minRadius,2*1.2*minRadius,2*minRadius);
    popMatrix();
    
    fill(foreground);
    textSize(25);
    textAlign(RIGHT, BOTTOM);
    pushMatrix();
    translate(1*minRadius, 1.2*minRadius, 0);
    text("Rating", 0, 0);
    popMatrix();
    
    textAlign(LEFT, BOTTOM);
    pushMatrix();
    translate(0, -1.2*minRadius, minRadius);
    rotate(-HALF_PI, 0, 1, 0);
    text("Year", 0, 0);
    popMatrix();
    
    pushMatrix();
    translate(-1.5*minRadius, 1.2*minRadius, 0);
    rotate(3*HALF_PI, 0, 0, 1);
    text("Votes", 0, 0);
    popMatrix();
}
