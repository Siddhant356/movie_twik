import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_twik/model/movie.dart';

class Home extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();
  final List movies = [
    "Titanic",
    "Shutter Iland",
    "Inception",
    "Conjuring",
    "Anabella",
    "Once upon a time in Hollywood",
    "Rush Hour",
    "Transformer",
    "Avengers",
    "Titanic",
    "Shutter Iland",
    "Inception",
    "Conjuring",
    "Anabella",
    "Once upon a time in Hollywood",
    "Rush Hour",
    "Transformer",
    "Avengers",
    "Predestination",
    "Seven"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4.5,
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(movieList[index].images[0]),
                      fit: BoxFit.cover),
                      //color: Colors.blue,
                      borderRadius: BorderRadius.circular(21.9),
                    ),
                  ),
                ),
                title: Text(movieList[index].title),
                subtitle: Text("${movieList[index].genre}"),
                trailing: Text("..."),
                // onTap: ()=> debugPrint("${movies.elementAt(index)}"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieListViewDetails(movieName: movieList[index].title,
                          movie: movieList[index])));
                },
              ),
            );
          }),
    );
  }
}

class MovieListViewDetails extends StatelessWidget {

  final String movieName;
  final Movie movie;


  const MovieListViewDetails({Key key, this.movieName, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Center(
        child: Container(
          child: RaisedButton(child: Text("Go Back ${this.movieName}"), onPressed: () {
            Navigator.pop(context);
          }),
        ),
      ),
    );
  }
}
