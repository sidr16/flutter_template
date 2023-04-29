import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/constants/dio_provider.dart';
import '../../utils/constants/endpoints.dart';
import '../../utils/constants/exceptions.dart';
import '../../domain/models/content_model/content_model.dart';
import '../../domain/repositories/content_repository.dart';

class ContentRepositoryImpl implements ContentRepository {
  final Ref ref;

  const ContentRepositoryImpl(this.ref);

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
