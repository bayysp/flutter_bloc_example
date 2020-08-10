import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterrxdart/src/home/bloc/movie_bloc/movie_bloc.dart';
import 'package:flutterrxdart/src/utils/constant.dart';

class SelectedTagView extends StatefulWidget {
  final activeTags;
  final MovieEvent movieEvent;

  const SelectedTagView({Key key, this.activeTags, this.movieEvent}) : super(key: key);

  @override
  _SelectedTagViewState createState() => _SelectedTagViewState();
}

class _SelectedTagViewState extends State<SelectedTagView> {
  MovieBloc movieBloc;

  @override
  void initState() {
    print("SelectedTagView - onInitState");
    movieBloc = BlocProvider.of<MovieBloc>(context);
    movieBloc.add(widget.movieEvent);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    movieBloc.add(widget.movieEvent);

    return BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
      print("SelectedtagView - activetags : ${widget.activeTags}");
      print("SelectedtagView - movieEvent : ${widget.movieEvent.status}");

      switch (state.status) {
        case MovieStateStatus.SUCCESS:
          return Text(state.data.toString());
          break;

        case MovieStateStatus.LOADING:
          return _onLoading();
          break;

        case MovieStateStatus.ERROR:
          return _onError(state.errorMessage);
          break;

        default:
          return _onLoading();
          break;
      }
    });
  }

  Widget _onLoading() {
    return Container(
      color: Colors.white,
      child: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }

  Widget _onError(String errorMessage) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text("Error message : $errorMessage"),
      ),
    );
  }

  Widget _onFetched() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 4),
      child: Column(
        children: <Widget>[
          _buildTitleList(),
          _buildMovieList(),
        ],
      ),
    );
  }

  Widget _buildTitleList() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text("${Constant.tags[widget.activeTags]} Movie List"),
    );
  }

  Widget _buildMovieList() {
    return Container();
  }

//  void onChangeMovieEvent() {
//    print("SelectedTagView - onChangeMovieEvent");
//    if (widget.activeTags == 0) {
//      movieBloc.add(MovieEvent.onPopulars());
//    } else if (widget.activeTags == 1) {
//      movieBloc.add(MovieEvent.onTopRated());
//    } else if (widget.activeTags == 2) {
//      movieBloc.add(MovieEvent.onNowPlaying());
//    } else if (widget.activeTags == 3) {
//      movieBloc.add((MovieEvent.onLatest()));
//    } else if (widget.activeTags == 4) {
//      movieBloc.add(MovieEvent.onUpcoming());
//    } else {
//      movieBloc.add(MovieEvent.onPopulars());
//    }
//  }
}
