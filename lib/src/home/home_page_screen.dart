import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterrxdart/src/home/bloc/popular_bloc/popular_bloc.dart';
import 'package:flutterrxdart/src/home/commons/generated_movie_tags.dart';
import 'package:flutterrxdart/src/home/commons/popular_page_view.dart';
import 'package:flutterrxdart/src/home/commons/selected_tag_view.dart';
import 'package:flutterrxdart/src/home/model/movie_popular_entity.dart';
import 'package:flutterrxdart/src/utils/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  MoviePopularEntity _populars;
  PopularBloc popularBloc;
  String _errorMessage = '';

  @override
  void initState() {
    popularBloc = BlocProvider.of<PopularBloc>(context);
    popularBloc.add(PopularEvent.onDefault());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularBloc, PopularState>(builder: (context, state) {
      switch (state.status) {
        case PopularStateStatus.SUCCESS:
          if (state.data is MoviePopularEntity) {
            _populars = state.data;
            return _onFetched();
          }
          return _onError();
          break;

        case PopularStateStatus.ERROR:
          _errorMessage = state.errorMessage;
          return _onError();

        case PopularStateStatus.LOADING:
          return _onLoading();
          break;

        default:
          return _onLoading();
          break;
      }
    });
  }

  Widget _onError() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(_errorMessage ?? "Error"),
      ),
    );
  }

  Widget _onFetched() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(8, 10, 8, 4),
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Top 5 Popular Movie",
                  style: Constant.subtitleMenu,
                ),
              ),
              PopularPageView(populars: _populars.results),
              GeneratedMovieTags(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _onLoading() {
    return Container(
      color: Colors.white,
      child: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
