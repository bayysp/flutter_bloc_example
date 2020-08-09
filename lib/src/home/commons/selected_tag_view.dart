import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterrxdart/src/home/bloc/movie_bloc/movie_bloc.dart';
import 'package:flutterrxdart/src/utils/constant.dart';

class SelectedTagView extends StatefulWidget {
  final activeTags;

  const SelectedTagView({Key key, this.activeTags}) : super(key: key);

  @override
  _SelectedTagViewState createState() => _SelectedTagViewState();
}

class _SelectedTagViewState extends State<SelectedTagView> {

  MovieBloc movieBloc;

  @override
  void initState() {
    movieBloc = BlocProvider.of<MovieBloc>(context);
    movieBloc.add(MovieEventFetchPopular());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
      if (state is MovieStateIsLoading) {
        return _onLoading();
      } else if (state is MovieStateIsNotLoaded) {
        return _onError();
      } else if (state is MovieStatePopularFetched) {
        return Center(
          child: Text(state.moviePopularEntity.toString()),
        );
      } else if (state is MovieStateTopRatedFetched) {
        return Center(
          child: Text(state.status.toString()),
        );
      } else if (state is MovieStateNowPlayingFetched) {
        return Center(
          child: Text(state.status.toString()),
        );
      } else if (state is MovieStateLatestFetched) {
        return Center(
          child: Text(state.status.toString()),
        );
      } else if (state is MovieStateUpcomingFetched) {
        return Center(
          child: Text(state.status.toString()),
        );
      } else {
        return Container();
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

  Widget _onError() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text("Error Fetched"),
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
}