import 'package:flutterrxdart/src/home/model/movie_now_playing_entity.dart';

movieNowPlayingEntityFromJson(MovieNowPlayingEntity data, Map<String, dynamic> json) {
	if (json['results'] != null) {
		data.results = new List<MovieNowPlayingResult>();
		(json['results'] as List).forEach((v) {
			data.results.add(new MovieNowPlayingResult().fromJson(v));
		});
	}
	if (json['page'] != null) {
		data.page = json['page']?.toInt();
	}
	if (json['total_results'] != null) {
		data.totalResults = json['total_results']?.toInt();
	}
	if (json['dates'] != null) {
		data.dates = new MovieNowPlayingDates().fromJson(json['dates']);
	}
	if (json['total_pages'] != null) {
		data.totalPages = json['total_pages']?.toInt();
	}
	return data;
}

Map<String, dynamic> movieNowPlayingEntityToJson(MovieNowPlayingEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.results != null) {
		data['results'] =  entity.results.map((v) => v.toJson()).toList();
	}
	data['page'] = entity.page;
	data['total_results'] = entity.totalResults;
	if (entity.dates != null) {
		data['dates'] = entity.dates.toJson();
	}
	data['total_pages'] = entity.totalPages;
	return data;
}

movieNowPlayingResultFromJson(MovieNowPlayingResult data, Map<String, dynamic> json) {
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

Map<String, dynamic> movieNowPlayingResultToJson(MovieNowPlayingResult entity) {
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

movieNowPlayingDatesFromJson(MovieNowPlayingDates data, Map<String, dynamic> json) {
	if (json['maximum'] != null) {
		data.maximum = json['maximum']?.toString();
	}
	if (json['minimum'] != null) {
		data.minimum = json['minimum']?.toString();
	}
	return data;
}

Map<String, dynamic> movieNowPlayingDatesToJson(MovieNowPlayingDates entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['maximum'] = entity.maximum;
	data['minimum'] = entity.minimum;
	return data;
}