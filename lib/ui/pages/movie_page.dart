import 'package:cinema_booking_1888/models/movie.dart';
import 'package:cinema_booking_1888/ui/widgets/movie_genre_bubles.dart';
import 'package:flutter/material.dart';


class MoviePage extends StatefulWidget {
  MoviePage(this.movie);

  final Movie movie;
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  
  @override
  Widget build(BuildContext context) {
    final movie = this.widget.movie;
    return Scaffold(
      appBar: AppBar(
        title: Text("Now Showing"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 20,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(movie.poster, fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                movie.title,
                style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star_border, color: Colors.grey),
                        SizedBox(width: 3),
                        Text(
                          movie.imdbRating,
                          style: TextStyle(
                            fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold,
                          )
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.watch, color: Colors.grey),
                        SizedBox(width: 3),
                        Text(
                          movie.runtime,
                          style: TextStyle(
                            fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold
                          )
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.movie_creation, color: Colors.grey),
                        SizedBox(width: 3),
                        Text(
                          "3D",
                          style: TextStyle(
                            fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold
                          )
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.grey),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Synopsis",
                    style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500
                    ),
                  ),
                  MovieGenres(movie.genre)
                ],
              ),
              SizedBox(height: 10,),
              Container(  
                height: 100,        
                child: Text(
                  movie.plot,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}