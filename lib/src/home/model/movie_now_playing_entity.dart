import 'package:flutterrxdart/generated/json/base/json_convert_content.dart';
import 'package:flutterrxdart/generated/json/base/json_filed.dart';

class MovieNowPlayingEntity with JsonConvert<MovieNowPlayingEntity> {
	List<MovieNowPlayingResult> results;
	int page;
	@JSONField(name: "total_results")
	int totalResults;
	MovieNowPlayingDates dates;
	@JSONField(name: "total_pages")
	int totalPages;
}

class MovieNowPlayingResult with JsonConvert<MovieNowPlayingResult> {
	double popularity;
	@JSONField(name: "vote_count")
	int voteCount;
	bool video;
	@JSONField(name: "poster_path")
	String posterPath;
	int id;
	bool adult;
	@JSONField(name: "backdrop_path")
	String backdropPath;
	@JSONField(name: "original_language")
	String originalLanguage;
	@JSONField(name: "original_title")
	String originalTitle;
	@JSONField(name: "genre_ids")
	List<int> genreIds;
	String title;
	@JSONField(name: "vote_average")
	double voteAverage;
	String overview;
	@JSONField(name: "release_date")
	String releaseDate;
}

class MovieNowPlayingDates with JsonConvert<MovieNowPlayingDates> {
	String maximum;
	String minimum;
}
