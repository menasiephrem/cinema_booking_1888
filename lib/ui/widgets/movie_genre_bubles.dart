import 'package:flutter/material.dart';

class MovieGenres extends StatefulWidget {
  MovieGenres(this.genre);

  final String genre;
  @override
  _MovieGenresState createState() => _MovieGenresState();
}

class _MovieGenresState extends State<MovieGenres> {

  List<String> _genres;

  @override
  void initState() {
    super.initState();
    setState(() {
      _genres = this.widget.genre.replaceAll(",", "").split(" ").toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: 
       _genres == null? CircularProgressIndicator():
       Container(
         constraints: BoxConstraints(minWidth: 100, maxWidth: MediaQuery.of(context).size.width - 150),
         child:
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: 
                  Row(
                    children: _genres.map((e) => 
                      Row(
                        children: [
                          Container(
                           decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(
                              color: Colors.grey[200],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(9))
                          ),
                          height: 18,
                          child: 
                            ClipRRect(
                              borderRadius: BorderRadius.circular(9.0),
                              child: Container(
                                margin: EdgeInsets.fromLTRB(6,2,15,0),
                                child: Text(
                                  e,
                                  style: TextStyle(
                                    fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                            )            
                          ),
                          SizedBox(width: 8),              
                        ],
                      )
                    ).toList(),
                  )            
          ),
       )
    );
  }
}
