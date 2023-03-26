import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/constants/dio_provider.dart';
import 'package:template/constants/endpoints.dart';
import 'package:template/constants/exaptions.dart';
import 'package:template/data/models/content_model/content_model.dart';

final contentRepository =
    Provider<ContentRepositoryApi>((ref) => ContentRepositoryApi(ref));

abstract class ContentRepository {
  Future<ContentModel> getContent();
}

class ContentRepositoryApi implements ContentRepository {
  final Ref ref;

  const ContentRepositoryApi(this.ref);

  @override
  Future<ContentModel> getContent() async {
    try {
      final response = await ref.read(dioProvider).get(Endpoints.content);

      return ContentModel.fromJson(response.data);
    } on DioError catch (error) {
      throw DataException.fromDioError(error);
    }
  }
}
