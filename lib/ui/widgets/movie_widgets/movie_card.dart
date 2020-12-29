import 'package:cinema_booking_1888/models/movie.dart';
import 'package:cinema_booking_1888/ui/pages/movie_page.dart';
import 'package:flutter/material.dart';


class MovieCard extends StatelessWidget {
  const MovieCard(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return
    InkWell(
      onTap: (){
         Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MoviePage(movie)),
              );
      },
      child:
       Container(
        padding: EdgeInsets.only(top: 10, left: 10, ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Expanded(
            child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                    movie.poster,
                    fit: BoxFit.cover,
                  ),
                )),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),),
                Text(movie.runtime, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),)
              ],
            ),
          )
        ]),       
       )
     );
  }
}



