import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cashloan_module/page/news/data/news_data.dart';
import 'package:cashloan_module/page/news/service/news_service.dart';
import 'package:equatable/equatable.dart';

import 'package:utility/exception/internal_server_exception.dart';
import 'package:utility/exception/service_unavailable_exception.dart';
import 'package:utility/exception/unexpected_error_exception.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  @override
  NewsState get initialState => NewsLoading();

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is GetNews) {
      NewsService _service = NewsService();
      try {
        yield await _service.getNews().then((response) {
          return NewsLoaded(
            listNews: response,
          );
        });
      } on UnexpectedErrorException catch (e) {
        yield NewsError(errorMessage: e.message);
      } on InternalServerException catch (e) {
        yield NewsError(errorMessage: e.message);
      } on ServiceUnavailableException catch (e) {
        yield NewsError(errorMessage: e.message);
      }
    }
  }
}
