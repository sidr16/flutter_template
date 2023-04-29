


import '../models/content_model/content_model.dart';

abstract class ContentRepository {
  Future<ContentModel> getContent();
}
