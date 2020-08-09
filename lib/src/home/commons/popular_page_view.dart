import 'package:flutter/material.dart';
import 'package:flutterrxdart/src/home/data_source/movie_data_source.dart';
import 'package:flutterrxdart/src/home/model/movie_popular_entity.dart';
import 'package:flutterrxdart/src/network/base_network.dart';
import 'package:flutterrxdart/src/utils/constant.dart';

class PopularPageView extends StatefulWidget {
  final List<MoviePopularResult> populars;

  const PopularPageView({Key key, this.populars}) : super(key: key);

  @override
  _PopularPageViewState createState() => _PopularPageViewState();
}

class _PopularPageViewState extends State<PopularPageView> {
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.9);

  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.2,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
            print("pageview changed value to ${_currentPageNotifier.value}");
          },
          itemBuilder: (context, index) {
            return _buildItemPoster(context, index);
          }),
    );
  }

  Widget _buildItemPoster(BuildContext context, int position) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 8, 8),
      decoration: Constant.cardBoxDecoration,
      child: InkWell(
        onTap: () {
          print("PopularPageView - onTap on item number $position");
        },
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.network(
            MovieDataSource.instance
                .loadImageBackdrop(widget.populars[position].backdropPath),
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              return progress == null
                  ? child
                  : LinearProgressIndicator(
                      value: progress.cumulativeBytesLoaded.toDouble(),
                    );
            },
          ),
        ),
      ),
    );
  }
}
