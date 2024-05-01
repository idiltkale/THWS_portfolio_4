import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_6/logic/models/movies_models.dart';

class Details extends StatelessWidget {
  final Movie movie;

  Details({required this.movie});

  Widget styledText(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "   $label:",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color.fromARGB(255, 162, 112, 151),
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          "  $value",
          style: const TextStyle(
            fontSize: 17,
            color: Colors.black,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    String safeTotalSeasons = movie.totalSeasons ?? "none";
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Container(
            width: 400,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.black),
            ),
            child: Image.network(
              movie.images2,
              fit: BoxFit.cover,
            ),
          ),
          Row(children: [
            styledText("Year", movie.year.toString()),
            SizedBox(width: 10),
            styledText("Runtime", movie.runtime),
            SizedBox(width: 10),
            styledText("Language", movie.language),
          ]),
           SizedBox(height: 10, ),
          Row(children: [
            styledText("imdb", movie.imdb),
            SizedBox(width: 10),
            styledText("Type", movie.type),
            SizedBox(width: 10),
            styledText("Seasons", safeTotalSeasons),
          ]),
          SizedBox(height: 10),
          styledText("Plot", movie.plot),
          SizedBox(height: 10),
          styledText("Actors", movie.actors),
          SizedBox(height: 10),
          styledText("Country", movie.country),
          SizedBox(height: 10),
          styledText("Director", movie.director),
          SizedBox(height: 10),
          styledText("Awards", movie.awards),
          SizedBox(height: 10),
          styledText("Writer(s)", movie.writer),
          Container(
            width: 400,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.black),
            ),
            child: Image.network(
              movie.images3,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
