


import '../models/news_model/news_model.dart';

abstract class ContentRepository {
  Future<List<NewsModel>> getAppleNews();
}
