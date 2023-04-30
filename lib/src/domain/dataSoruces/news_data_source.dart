import '../models/news_model/news_model.dart';

abstract class NewsDataSource {
  Future<List<NewsModel>> getAppleNews();
}
