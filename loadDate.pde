void loadData() {
   table = loadTable("movie2023-2.csv", "header");
   numRows = table.getRowCount();
   
   for(int i=0; i<numRows; i++){
    int year = table.getInt(i,5);
    String title = table.getString(i,3);
    String genres = table.getString(i,7);

    float rating = table.getFloat(i,8);
    int votes = table.getInt(i,9);

    ArrayList<Movie> list = map.getOrDefault(year, new ArrayList<>());

    list.add(new Movie(year, rating, votes, title, genres));
    
    map.put(year, new ArrayList<Movie>(list));
   }

    // for(int year: map.keySet()){
    //   ArrayList<Movie> list1 = map.get(year);
    //   List<PVector> listcur = new ArrayList<PVector>();
    //   for(Movie m : list1){
    //     float x = map(m.rating, 0, 10, -minRadius, minRadius);
    //     float y = map(m.votes, 5000, 590000, -minRadius, minRadius);
    //     float z = map(m.year, 2020, 2024, -minRadius, minRadius);
    //     listcur.add(new PVector(x, y ,z));
    //   }
    //   listAll.add(listcur);
    // }
}
   
  //  
   
  //  System.out.print(categories.size()+ " "+numRows);

  //  for (int i = 0; i < categories.size(); i++) {
  //    int year = int(categories.get(i).year);
  //    int month = int(categories.get(i).month);
  //    float percentage = categories.get(i).percentage;
  //    String category = categories.get(i).category;

  //    //System.out.println(year+" "+month+" "+percentage+" "+category);

  //    float theta = map(year, 2006, 2025, 0, 2*PI);
  //    float phi = map(month, 1, 13, 0, 2*PI);
  //    float r = map(percentage, 0, 0.25, minRadius, maxRadius);
  //    float x = r * sin(phi) * cos(theta);
  //    float y = r * sin(phi) * sin(theta);
  //    float z = r * cos(phi);

  //   // float x = r * cos(theta) * radiusMultiplier;
  //   // float y = map(month, 1, 12, -100, 100) * radiusMultiplier;
  //   // float z = map(percentage, 0, 0.2, -100, 100) * radiusMultiplier;

  //    //z = 

  //    points[i] = new PVector(x, y, z);
  //    // percentages[i] = percentage;
  //  }
