import 'package:cashloan_module/page/news/bloc/news_bloc.dart';
import 'package:cashloan_module/page/news/news_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsPage extends StatefulWidget {
  static const String PATH = '/cashloan-news';
  static const String TAG = 'Cashloan News';
  @override
  State<StatefulWidget> createState() {
    return _NewsState();
  }
}

class _NewsState extends State<NewsPage> {
  NewsBloc _newsBloc;

  @override
  void initState() {
    _newsBloc = NewsBloc();
    _newsBloc.add(GetNews());
    super.initState();
  }

  @override
  void dispose() {
    _newsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: _newsBloc,
        builder: (BuildContext context, NewsState state) {
          if (state is NewsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsError) {
            return Center(
              child: Text("Error : ${state.errorMessage}"),
            );
          } else if (state is NewsLoaded) {
            return NewsView(
              listNews: state.listNews,
            );
          }
          return Container();
        },
      ),
    );
  }
}
