class ApiConstants {
  ApiConstants._();

  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "ae75178f6782f6e604869087e2848542";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static const String trendingUrl = "$baseUrl/trending/movie/day?api_key=$apiKey";
  static const String popularUrl = "$baseUrl/movie/popular?api_key=$apiKey";
  static const String comingSoonUrl = "$baseUrl/movie/upcoming?api_key=$apiKey";
  static const String playingNowUrl = "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String movieDetails = "$baseUrl/movie/";
}
