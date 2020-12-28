
class Movie{
   String title;
   String year;
   String runtime;
   String genre;
   String plot;
   String poster;
   String imdbRating;
   int id;


    Movie.empty();

    Movie.fromJson(Map<String, dynamic> data, int id){
      this.title = data['Title'];
      this.year = data['Year'];
      this.runtime = data['Runtime'];
      this.genre = data['Genre'];
      this.plot = data['Plot'];
      this.poster = data['Poster'];
      this.imdbRating = data['imdbRating'];
      this.id = id; // used to randomly assign show time
   }
}