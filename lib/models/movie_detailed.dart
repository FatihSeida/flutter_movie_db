// To parse this JSON data, do
//
//     final movieDetailed = movieDetailedFromMap(jsonString);

import 'dart:convert';
import '/models/genre.dart';
import '/models/production_company.dart';
import '/models/production_country.dart';
import '/models/spoken_language.dart';

MovieDetailed movieDetailedFromMap(String str) =>
    MovieDetailed.fromMap(json.decode(str));

String movieDetailedToMap(MovieDetailed data) => json.encode(data.toMap());

class MovieDetailed {
  MovieDetailed({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  String backdropPath;
  dynamic belongsToCollection;
  int budget;
  List<Genre> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  dynamic posterPath;
  List<ProductionCompany> productionCompanies;
  List<ProductionCountry> productionCountries;
  DateTime releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  factory MovieDetailed.fromMap(Map<String, dynamic> json) => MovieDetailed(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        belongsToCollection: json['belongs_to_collection'],
        budget: json['budget'],
        genres: List<Genre>.from(json['genres'].map((x) => Genre.fromMap(x))),
        homepage: json['homepage'],
        id: json['id'],
        imdbId: json['imdb_id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'].toDouble(),
        posterPath: json['poster_path'],
        productionCompanies: List<ProductionCompany>.from(
            json['production_companies']
                .map((x) => ProductionCompany.fromMap(x))),
        productionCountries: List<ProductionCountry>.from(
            json['production_countries']
                .map((x) => ProductionCountry.fromMap(x))),
        releaseDate: DateTime.parse(json['release_date']),
        revenue: json['revenue'],
        runtime: json['runtime'],
        spokenLanguages: List<SpokenLanguage>.from(
            json['spoken_languages'].map((x) => SpokenLanguage.fromMap(x))),
        status: json['status'],
        tagline: json['tagline'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
      );

  Map<String, dynamic> toMap() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'belongs_to_collection': belongsToCollection,
        'budget': budget,
        'genres': List<dynamic>.from(genres.map((x) => x.toMap())),
        'homepage': homepage,
        'id': id,
        'imdb_id': imdbId,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'production_companies':
            List<dynamic>.from(productionCompanies.map((x) => x.toMap())),
        'production_countries':
            List<dynamic>.from(productionCountries.map((x) => x.toMap())),
        'release_date':
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        'revenue': revenue,
        'runtime': runtime,
        'spoken_languages':
            List<dynamic>.from(spokenLanguages.map((x) => x.toMap())),
        'status': status,
        'tagline': tagline,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };
}
