import 'package:cashloan_module/page/news/data/news_data.dart';
import 'package:core/core_service.dart';
import 'package:utility/exception/internal_server_exception.dart';
import 'package:utility/exception/service_unavailable_exception.dart';
import 'package:utility/exception/unexpected_error_exception.dart';

class NewsService extends CoreRestService {
  Future<List<NewsData>> getNews() async {
    return await networkInterface
        .requestGet(
            path:
                '/top-headlines?country=us&apiKey=ef02f6e6a4d54d0eac801e9a3ed31555',
            baseUrl: 'https://newsapi.org/v2')
        .then((responseModel) {
      if (responseModel.code == 500) {
        throw InternalServerException(message: responseModel.error);
      } else if (responseModel.code == 503) {
        throw ServiceUnavailableException(message: responseModel.error);
      } else if (responseModel.code == 200) {
        return listNews(responseModel.response);
      }
      throw UnexpectedErrorException(message: responseModel.error);
    });
  }
}
