import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cinema_booking_1888/models/movie.dart';

class MovieServices {
  Future<List<Movie>> fetchMovies() async {
    // final response = await http.get('https://imdb-best-winners.herokuapp.com/');
    final data = """ [{"Title":"Parasite","Year":"2019","Rated":"R","Released":"08 Nov 2019","Runtime":"132 min","Genre":"Comedy, Drama, Thriller","Director":"Bong Joon Ho","Writer":"Bong Joon Ho (story by), Bong Joon Ho (screenplay by), Han Jin-won (screenplay by)","Actors":"Song Kang-Ho, Lee Sun-kyun, Cho Yeo-jeong, Choi Woo-sik","Plot":"Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.","Language":"Korean, English","Country":"South Korea","Awards":"Won 4 Oscars. Another 279 wins & 255 nominations.","Poster":"https://m.media-amazon.com/images/M/MV5BYWZjMjk3ZTItODQ2ZC00NTY5LWE0ZDYtZTI3MjcwN2Q5NTVkXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_SX300.jpg","Ratings":[{"Source":"Internet Movie Database","Value":"8.6/10"},{"Source":"Rotten Tomatoes","Value":"99%"},{"Source":"Metacritic","Value":"96/100"}],"Metascore":"96","imdbRating":"8.6","imdbVotes":"524,336","imdbID":"tt6751668","Type":"movie","DVD":"N/A","BoxOffice":"USD53,369,749","Production":"CJ Entertainment, TMS Entertainment","Website":"N/A","Response":"True"},{"Title":"Green Book","Year":"2018","Rated":"PG-13","Released":"16 Nov 2018","Runtime":"130 min","Genre":"Biography, Comedy, Drama, Music","Director":"Peter Farrelly","Writer":"Nick Vallelonga, Brian Hayes Currie, Peter Farrelly","Actors":"Viggo Mortensen, Mahershala Ali, Linda Cardellini, Sebastian Maniscalco","Plot":"A working-class Italian-American bouncer becomes the driver of an African-American classical pianist on a tour of venues through the 1960s American South.","Language":"English, Italian, Russian, German","Country":"USA, China","Awards":"Won 3 Oscars. Another 54 wins & 120 nominations.","Poster":"https://m.media-amazon.com/images/M/MV5BYzIzYmJlYTYtNGNiYy00N2EwLTk4ZjItMGYyZTJiOTVkM2RlXkEyXkFqcGdeQXVyODY1NDk1NjE@._V1_SX300.jpg","Ratings":[{"Source":"Internet Movie Database","Value":"8.2/10"},{"Source":"Rotten Tomatoes","Value":"77%"},{"Source":"Metacritic","Value":"69/100"}],"Metascore":"69","imdbRating":"8.2","imdbVotes":"361,299","imdbID":"tt6966692","Type":"movie","DVD":"N/A","BoxOffice":"USD85,080,171","Production":"Charles B. Wessler Entertainment, Innisfree Pictures","Website":"N/A","Response":"True"},{"Title":"The Shape of Water","Year":"2017","Rated":"R","Released":"22 Dec 2017","Runtime":"123 min","Genre":"Adventure, Drama, Fantasy, Romance, Sci-Fi, Thriller","Director":"Guillermo del Toro","Writer":"Guillermo del Toro (screenplay by), Vanessa Taylor (screenplay by), Guillermo del Toro (story by)","Actors":"Sally Hawkins, Michael Shannon, Richard Jenkins, Octavia Spencer","Plot":"At a top secret research facility in the 1960s, a lonely janitor forms a unique relationship with an amphibious creature that is being held in captivity.","Language":"English, American Sign Language, Russian, French","Country":"USA, Canada","Awards":"Won 4 Oscars. Another 134 wins & 350 nominations.","Poster":"https://m.media-amazon.com/images/M/MV5BNGNiNWQ5M2MtNGI0OC00MDA2LWI5NzEtMmZiYjVjMDEyOWYzXkEyXkFqcGdeQXVyMjM4NTM5NDY@._V1_SX300.jpg","Ratings":[{"Source":"Internet Movie Database","Value":"7.3/10"},{"Source":"Rotten Tomatoes","Value":"92%"},{"Source":"Metacritic","Value":"87/100"}],"Metascore":"87","imdbRating":"7.3","imdbVotes":"365,321","imdbID":"tt5580390","Type":"movie","DVD":"N/A","BoxOffice":"usd63,859,435","Production":"Double Dare You, TSG Entertainment","Website":"N/A","Response":"True"},{"Title":"Moonlight","Year":"2016","Rated":"R","Released":"18 Nov 2016","Runtime":"111 min","Genre":"Drama","Director":"Barry Jenkins","Writer":"Barry Jenkins (screenplay by), Tarell Alvin McCraney (story by)","Actors":"Mahershala Ali, Shariff Earp, Duan Sanderson, Alex R. Hibbert","Plot":"A young African-American man grapples with his identity and sexuality while experiencing the everyday struggles of childhood, adolescence, and burgeoning adulthood.","Language":"English","Country":"USA","Awards":"Won 3 Oscars. Another 226 wins & 289 nominations.","Poster":"https://m.media-amazon.com/images/M/MV5BNzQxNTIyODAxMV5BMl5BanBnXkFtZTgwNzQyMDA3OTE@._V1_SX300.jpg","Ratings":[{"Source":"Internet Movie Database","Value":"7.4/10"},{"Source":"Rotten Tomatoes","Value":"98%"},{"Source":"Metacritic","Value":"99/100"}],"Metascore":"99","imdbRating":"7.4","imdbVotes":"269,475","imdbID":"tt4975722","Type":"movie","DVD":"N/A","BoxOffice":"N/A","Production":"Plan B Entertainment, Upload Films, Pastel","Website":"N/A","Response":"True"},{"Title":"Spotlight","Year":"2015","Rated":"R","Released":"20 Nov 2015","Runtime":"129 min","Genre":"Biography, Crime, Drama","Director":"Tom McCarthy","Writer":"Josh Singer, Tom McCarthy","Actors":"Mark Ruffalo, Michael Keaton, Rachel McAdams, Liev Schreiber","Plot":"The true story of how the Boston Globe uncovered the massive scandal of child molestation and cover-up within the local Catholic Archdiocese, shaking the entire Catholic Church to its core.","Language":"English","Country":"USA","Awards":"Won 2 Oscars. Another 123 wins & 142 nominations.","Poster":"https://m.media-amazon.com/images/M/MV5BMjIyOTM5OTIzNV5BMl5BanBnXkFtZTgwMDkzODE2NjE@._V1_SX300.jpg","Ratings":[{"Source":"Internet Movie Database","Value":"8.1/10"},{"Source":"Rotten Tomatoes","Value":"97%"},{"Source":"Metacritic","Value":"93/100"}],"Metascore":"93","imdbRating":"8.1","imdbVotes":"415,905","imdbID":"tt1895587","Type":"movie","DVD":"N/A","BoxOffice":"USD45,055,776","Production":"Anonymous Content, Rocklin/Faust","Website":"N/A","Response":"True"}] """;
    if (true) {
      List<dynamic> _movies = jsonDecode(data);
      return _movies.map((movieData) => Movie.fromJson(movieData)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}