
class Movie{
   String title;
   String year;
   String runtime;
   String genre;
   String plot;
   String poster;
   String imdbRating;


    Movie.empty();

    Movie.fromJson(Map<String, dynamic> data){
      this.title = data['Title'];
      this.year = data['Year'];
      this.runtime = data['Runtime'];
      this.genre = data['Genre'];
      this.plot = data['Plot'];
      this.poster = data['Poster'];
      this.imdbRating = data['imdbRating'];
   }
}