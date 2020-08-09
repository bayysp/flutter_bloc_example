import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterrxdart/src/home/bloc/movie_bloc/movie_bloc.dart';
import 'package:flutterrxdart/src/home/bloc/popular_bloc/popular_bloc.dart';
import 'package:flutterrxdart/src/home/home_page_screen.dart';
import 'package:flutterrxdart/src/utils/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PopularBloc>(
          create: (BuildContext context) => PopularBloc(),
        ),
        BlocProvider<MovieBloc>(
          create: (BuildContext context) => MovieBloc(),
        )
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            elevation: 0.0,
            backgroundColor: Colors.white,
            title: Text("Movie Catalogue", style: Constant.appBarTitleStyle),
          ),
          body: HomePageScreen(),
        ),
      ),
    );
  }
}
