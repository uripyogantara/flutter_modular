part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsLoading extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoaded extends NewsState {
  final List<NewsData> listNews;

  NewsLoaded({this.listNews});

  @override
  List<Object> get props => [listNews];
}

class NewsError extends NewsState {
  final String errorMessage;
  NewsError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}
