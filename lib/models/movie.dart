class Movie {
  final int id;
  final String title;
  final String poster_path;
  final String release_date;
  final String vote_average;
  final String backdrop_path;
  Movie(
      {required this.id,
      required this.title,
      required this.poster_path,
      required this.release_date,
      required this.vote_average,
      required this.backdrop_path});
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'],
        title: json['title'],
        poster_path: json['poster_path'] ?? '',
        release_date: json['release_date'],
        vote_average: json['vote_average'],
        backdrop_path: '${json['backdrop_path']}');
  }
}
