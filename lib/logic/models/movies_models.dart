class Movie{
  final String title;
  final String director;
  final String image;
  final String writer;
  final String year;
  final String rated;
  final String plot;
  final String runtime;
  final String genre;
  final String actors;
  final String language;
  final String country;
  final String awards;
  final String images2;
  final String images3;
  final String imdb;
   final String type;
   final String? totalSeasons;


  Movie({required this.title , required this.director ,required this.image,required this.writer ,
   required this.year, required this.plot,required this.images3,required this.images2, required this.rated,
    required this.actors, required this.runtime, required this.language, required this.genre,
     required this.country, required this.awards, required this.imdb, required this.type, this.totalSeasons,});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'],
      awards: json['Awards'],
      director: json['Director'],
      genre: json['Genre'],
      runtime: json['Runtime'],
      language: json['Language'],
      rated: json['Rated'],
      image: json['Images'][0],
      country: json['Country'],
      actors: json['Actors'],
      writer: json['Writer'],
      type: json['Type'],
      year: json['Year'],
      plot: json['Plot'],
      images2: json['Images'][1],
      images3: json['Images'][2],
      imdb: json["imdbRating"],
       totalSeasons: (json['Type'] == 'series' && json.containsKey('totalSeasons'))
        ? json['totalSeasons'] 
        : null, 
    );

  
  

  }

  Map<String, dynamic> toJson()=> {
    'Title': title,
    'Director': director,
    'Images' : image,
    'Runtime' : runtime,
    'Writer' : writer,
    'Year' : year,
    'Plot' : plot,
    'Actors' : actors,
    'Genre' : genre,
    'Language' : language,
    'Rated' : rated,
    'Country' : country,
    'Awards' : awards,
    'Type' : type,
    'Images' : images2,
    'Images' : images3,
    'imdbRating' : imdb,
    'totalSeasons': totalSeasons,
  };

}