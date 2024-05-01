import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../logic/models/movies_models.dart';
import 'package:flutter_application_6/presentation/screens/details_screen.dart';

class ShowMoviesWidget extends StatefulWidget {
  final movieUri =
      'https://670ef2d6-dbdd-454c-b4d7-6960afb18cc2.mock.pstmn.io/movies';
  const ShowMoviesWidget({super.key});

  @override
  State<ShowMoviesWidget> createState() => _ShowMoviesWidgetState();
}

class _ShowMoviesWidgetState extends State<ShowMoviesWidget> {
  List<Movie> movies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMovies().then((m) {
      setState(() {
        isLoading = false;
        movies = m;
      });
    });
  }

  Future<List<Movie>> _loadMovies() async {
    await Future.delayed(const Duration(seconds: 3));
    final response = await http.get(Uri.parse(widget.movieUri));
    var returnValue = <Movie>[];

    if (response.statusCode == 200) {
      final movies = jsonDecode(response.body) as List;
      returnValue = List.generate(movies.length,
          (index) => Movie.fromJson(movies[index] as Map<String, dynamic>));
    }
    return returnValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies & Series'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return CustomItem(mov: movie);
              },
            ),
    );
  }
}

class CustomItem extends StatelessWidget {
  final Movie mov;
  const CustomItem({required this.mov});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3)
          ]),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                mov.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  mov.title,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  mov.genre,
                  style: const TextStyle(
                      fontSize: 13, color: Color.fromARGB(255, 162, 112, 151)),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          InkWell(
            child: const Center(
              child: Icon(
                Icons.arrow_circle_right,
                color: Color.fromARGB(255, 162, 112, 151),
                size: 40,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Details(movie: mov)));
            },
          ),
        ],
      ),
    );
  }
}
