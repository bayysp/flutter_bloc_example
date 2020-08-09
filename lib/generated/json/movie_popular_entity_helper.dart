import 'package:flutterrxdart/src/home/model/movie_popular_entity.dart';

moviePopularEntityFromJson(MoviePopularEntity data, Map<String, dynamic> json) {
	if (json['page'] != null) {
		data.page = json['page']?.toInt();
	}
	if (json['total_results'] != null) {
		data.totalResults = json['total_results']?.toInt();
	}
	if (json['total_pages'] != null) {
		data.totalPages = json['total_pages']?.toInt();
	}
	if (json['results'] != null) {
		data.results = new List<MoviePopularResult>();
		(json['results'] as List).forEach((v) {
			data.results.add(new MoviePopularResult().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> moviePopularEntityToJson(MoviePopularEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['page'] = entity.page;
	data['total_results'] = entity.totalResults;
	data['total_pages'] = entity.totalPages;
	if (entity.results != null) {
		data['results'] =  entity.results.map((v) => v.toJson()).toList();
	}
	return data;
}

moviePopularResultFromJson(MoviePopularResult data, Map<String, dynamic> json) {
	if (json['popularity'] != null) {
		data.popularity = json['popularity']?.toDouble();
	}
	if (json['vote_count'] != null) {
		data.voteCount = json['vote_count']?.toInt();
	}
	if (json['video'] != null) {
		data.video = json['video'];
	}
	if (json['poster_path'] != null) {
		data.posterPath = json['poster_path']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['adult'] != null) {
		data.adult = json['adult'];
	}
	if (json['backdrop_path'] != null) {
		data.backdropPath = json['backdrop_path']?.toString();
	}
	if (json['original_language'] != null) {
		data.originalLanguage = json['original_language']?.toString();
	}
	if (json['original_title'] != null) {
		data.originalTitle = json['original_title']?.toString();
	}
	if (json['genre_ids'] != null) {
		data.genreIds = json['genre_ids']?.map((v) => v?.toInt())?.toList()?.cast<int>();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['vote_average'] != null) {
		data.voteAverage = json['vote_average']?.toDouble();
	}
	if (json['overview'] != null) {
		data.overview = json['overview']?.toString();
	}
	if (json['release_date'] != null) {
		data.releaseDate = json['release_date']?.toString();
	}
	return data;
}

Map<String, dynamic> moviePopularResultToJson(MoviePopularResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['popularity'] = entity.popularity;
	data['vote_count'] = entity.voteCount;
	data['video'] = entity.video;
	data['poster_path'] = entity.posterPath;
	data['id'] = entity.id;
	data['adult'] = entity.adult;
	data['backdrop_path'] = entity.backdropPath;
	data['original_language'] = entity.originalLanguage;
	data['original_title'] = entity.originalTitle;
	data['genre_ids'] = entity.genreIds;
	data['title'] = entity.title;
	data['vote_average'] = entity.voteAverage;
	data['overview'] = entity.overview;
	data['release_date'] = entity.releaseDate;
	return data;
}