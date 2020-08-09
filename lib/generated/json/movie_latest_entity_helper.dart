import 'package:flutterrxdart/src/home/model/movie_latest_entity.dart';

movieLatestEntityFromJson(MovieLatestEntity data, Map<String, dynamic> json) {
	if (json['adult'] != null) {
		data.adult = json['adult'];
	}
	if (json['backdrop_path'] != null) {
		data.backdropPath = json['backdrop_path'];
	}
	if (json['belongs_to_collection'] != null) {
		data.belongsToCollection = json['belongs_to_collection'];
	}
	if (json['budget'] != null) {
		data.budget = json['budget']?.toInt();
	}
	if (json['genres'] != null) {
		data.genres = new List<dynamic>();
		data.genres.addAll(json['genres']);
	}
	if (json['homepage'] != null) {
		data.homepage = json['homepage']?.toString();
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['imdb_id'] != null) {
		data.imdbId = json['imdb_id']?.toString();
	}
	if (json['original_language'] != null) {
		data.originalLanguage = json['original_language']?.toString();
	}
	if (json['original_title'] != null) {
		data.originalTitle = json['original_title']?.toString();
	}
	if (json['overview'] != null) {
		data.overview = json['overview']?.toString();
	}
	if (json['popularity'] != null) {
		data.popularity = json['popularity']?.toInt();
	}
	if (json['poster_path'] != null) {
		data.posterPath = json['poster_path'];
	}
	if (json['production_companies'] != null) {
		data.productionCompanies = new List<dynamic>();
		data.productionCompanies.addAll(json['production_companies']);
	}
	if (json['production_countries'] != null) {
		data.productionCountries = new List<dynamic>();
		data.productionCountries.addAll(json['production_countries']);
	}
	if (json['release_date'] != null) {
		data.releaseDate = json['release_date']?.toString();
	}
	if (json['revenue'] != null) {
		data.revenue = json['revenue']?.toInt();
	}
	if (json['runtime'] != null) {
		data.runtime = json['runtime']?.toInt();
	}
	if (json['spoken_languages'] != null) {
		data.spokenLanguages = new List<dynamic>();
		data.spokenLanguages.addAll(json['spoken_languages']);
	}
	if (json['status'] != null) {
		data.status = json['status']?.toString();
	}
	if (json['tagline'] != null) {
		data.tagline = json['tagline']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['video'] != null) {
		data.video = json['video'];
	}
	if (json['vote_average'] != null) {
		data.voteAverage = json['vote_average']?.toInt();
	}
	if (json['vote_count'] != null) {
		data.voteCount = json['vote_count']?.toInt();
	}
	return data;
}

Map<String, dynamic> movieLatestEntityToJson(MovieLatestEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['adult'] = entity.adult;
	data['backdrop_path'] = entity.backdropPath;
	data['belongs_to_collection'] = entity.belongsToCollection;
	data['budget'] = entity.budget;
	if (entity.genres != null) {
		data['genres'] =  [];
	}
	data['homepage'] = entity.homepage;
	data['id'] = entity.id;
	data['imdb_id'] = entity.imdbId;
	data['original_language'] = entity.originalLanguage;
	data['original_title'] = entity.originalTitle;
	data['overview'] = entity.overview;
	data['popularity'] = entity.popularity;
	data['poster_path'] = entity.posterPath;
	if (entity.productionCompanies != null) {
		data['production_companies'] =  [];
	}
	if (entity.productionCountries != null) {
		data['production_countries'] =  [];
	}
	data['release_date'] = entity.releaseDate;
	data['revenue'] = entity.revenue;
	data['runtime'] = entity.runtime;
	if (entity.spokenLanguages != null) {
		data['spoken_languages'] =  [];
	}
	data['status'] = entity.status;
	data['tagline'] = entity.tagline;
	data['title'] = entity.title;
	data['video'] = entity.video;
	data['vote_average'] = entity.voteAverage;
	data['vote_count'] = entity.voteCount;
	return data;
}