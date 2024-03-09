// so that in the larger timeline, we can zoom in even further to a mini timeline which will contain all the books (the in date timeline)
class Movie{
    String title;
    String genres;
    int year;
    float rating;
    int votes;

    Movie(int year, float rating, int votes, String title, String genres){
        this.rating = rating;
        this.votes = votes;
        this.genres = genres;
        this.year = year;
        this.title = title;
    }

    // Setter for title
    void setTitle(String title) {
        this.title = title;
    }

    // Getter for title
    String getTitle() {
        return title;
    }

    // Setter for genres
    void setGenres(String genres) {
        this.genres = genres;
    }

    // Getter for genres
    String getGenres() {
        return genres;
    }

    // Setter for year
    void setYear(int year) {
        this.year = year;
    }

    // Getter for year
    int getYear() {
        return year;
    }

    // Setter for rating
    void setRating(float rating) {
        this.rating = rating;
    }

    // Getter for rating
    float getRating() {
        return rating;
    }

    // Setter for votes
    void setVotes(int votes) {
        this.votes = votes;
    }

    // Getter for votes
    int getVotes() {
        return votes;
    }
}
