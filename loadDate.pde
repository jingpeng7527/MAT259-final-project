void loadData() {
   table = loadTable("movie2023-2.csv", "header");
   numRows = table.getRowCount();
   
   for(int i=0; i<numRows; i++){
    int year = table.getInt(i,5);
    String title = table.getString(i,3);
    String genres = table.getString(i,7);

    float rating = table.getFloat(i,8);
    int votes = table.getInt(i,9);
    String tconst = table.getString(i,1);

    //ArrayList<Movie> list = map.getOrDefault(year, new ArrayList<>());
    Movie m = new Movie(year, rating, votes, title, genres, tconst);
    list.add(m);
    
    map.put(title, m);
   }
}
