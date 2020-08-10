import 'package:flutter/material.dart';
import 'package:flutterrxdart/src/home/bloc/movie_bloc/movie_bloc.dart';
import 'package:flutterrxdart/src/home/commons/selected_tag_view.dart';
import 'package:flutterrxdart/src/utils/constant.dart';

class GeneratedMovieTags extends StatefulWidget {
  @override
  _GeneratedMovieTagsState createState() => _GeneratedMovieTagsState();
}

class _GeneratedMovieTagsState extends State<GeneratedMovieTags> {
  int _activeTags = 0;
  MovieEvent _movieEvent;
  @override
  void initState() {
    _movieEvent = MovieEvent.onPopulars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _buildTags(context, 0),
              _buildTags(context, 1),
              _buildTags(context, 2),
              _buildTags(context, 3),
              _buildTags(context, 4),
            ],
          ),
        ),
        SelectedTagView(
          activeTags: _activeTags,
          movieEvent: _movieEvent,
        ),
      ],
    );
  }

  Widget _buildTags(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.fromLTRB(8, 2, 8, 4),
      child: OutlineButton(
        highlightedBorderColor: Colors.blue,
        highlightColor: Colors.white12,
        textColor: (_activeTags == index) ? Colors.indigo : Colors.grey,
        onPressed: () {
          setState(() {

            print("GeneratedMovieTags - ${Constant.tags[index]} clicked");
            _activeTags = index;
            print("GeneratedMovieTags - active tags : $_activeTags");
            onChangeMovieEvent();
          });
        },
        child: Container(
          child: Text(
            Constant.tags[index],
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  void onChangeMovieEvent() {
    if (_activeTags == 0) {
      _movieEvent = MovieEvent.onPopulars();
    } else if (_activeTags == 1) {
      _movieEvent = MovieEvent.onTopRated();
    } else if (_activeTags == 2) {
      _movieEvent = MovieEvent.onNowPlaying();
    } else if (_activeTags == 3) {
      _movieEvent = MovieEvent.onLatest();
    } else if (_activeTags == 4) {
      _movieEvent = MovieEvent.onUpcoming();
    } else {
      _movieEvent = MovieEvent.onPopulars();
    }
  }
}
