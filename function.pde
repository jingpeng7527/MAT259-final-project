void drawPoints(){

    for(int i =0; i<list.size();i++){
        // PVector p1 = cur.get(i);
        Movie curMovie = list.get(i);
        
        float transparence = map(curMovie.votes, 5000, 590000, 60, 300);
        float pointSize = map(curMovie.votes, 5000, 590000, 6, 15);
        float titleSize = map(curMovie.votes, 5000, 590000, 15, 20);
        
        float x = map(curMovie.rating, 1.0, 10.0, -1.5*minRadius, 0.5*minRadius);
        float y = map(curMovie.votes, 5000, 865773, -1.2*minRadius, 1.2*minRadius);
        float z = map(curMovie.year, 2020, 2024, -minRadius, minRadius);

        pushMatrix();
        stroke(#FFFFFF, transparence);
        strokeWeight(pointSize);
        //stroke(#FFFFFF, random(150, 255));
        translate(x, y, z);
        point(0,0,0);
        
        pushMatrix();
        textAlign(LEFT, TOP);
        textFont(font, titleSize);
        
         try{
              if(textValue.equals("")){
                cp5.get(ScrollableList.class, "dropdown").hide();
                fill(foreground, 100);
                textSize(titleSize);   
              }
           else if(match(curMovie.title, textValue) != null){
              cp5.get(ScrollableList.class, "dropdown").show();
              String ge = curMovie.genres.split(",", 1)[0];
              fill(pickColor(ge), 200);
              textSize(titleSize*1.5);
              selectedKeywords.add(curMovie.title);
              cp5.get(ScrollableList.class, "dropdown").setItems(selectedKeywords);
            }
            else{
              fill(foreground, 100);
              textSize(titleSize);
            }
          }
          catch(Exception e){
            fill(background);
            textSize(8);
          }
          
        if(selectedKeywords.size() == 0) 
            cp5.get(ScrollableList.class, "dropdown").hide();

        if (curMovie.rating < 7) {
            //println("rating!!!"+curMovie.rating);
            textAlign(RIGHT, TOP);
            rotateY(-PI/2);
        }
        text(curMovie.title, 0,0,0);    
        popMatrix();
        popMatrix();
    }

}
color pickColor(String genre){
  if(genre.equals("Action"))
    return categoryColors[15];
  else if(genre.equals("Adventure"))
    return categoryColors[0];
  else if(genre.equals("Animation"))
    return categoryColors[1];
  else if(genre.equals("Biography"))
    return categoryColors[2];
  else if(genre.equals("Comedy"))
    return categoryColors[3];
  else if(genre.equals("Crime"))
    return categoryColors[4];
  else if(genre.equals("Documentary"))
    return categoryColors[5];
  else if(genre.equals("Drama"))
    return categoryColors[6];
  else if(genre.equals("Family"))
    return categoryColors[7];
   else if(genre.equals("Fantasy"))
    return categoryColors[8];
   else if(genre.equals("History"))
    return categoryColors[9];
   else if(genre.equals("Horror"))
    return categoryColors[10];
    else if(genre.equals("Mystery"))
    return categoryColors[11];
    else if(genre.equals("Romance"))
    return categoryColors[12];
   else if(genre.equals("Sci-Fi"))
    return categoryColors[13];
   else
    return categoryColors[14];
}
