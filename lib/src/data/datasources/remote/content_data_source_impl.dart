import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/dataSoruces/news_data_source.dart';
import '../../../domain/models/news_model/news_model.dart';
import '../../../utils/constants/dio_provider.dart';
import '../../../utils/constants/endpoints.dart';
import '../../../utils/constants/exceptions.dart';

class NewsDataSourceImpl implements NewsDataSource {
  final Ref ref;

  const NewsDataSourceImpl(this.ref);

  @override
  Future<List<NewsModel>> getAppleNews() async {
    try {
      final response = await ref
          .read(dioProvider)
          .get(Endpoints.everything, queryParameters: {
        'q': 'apple',
        'sortBy': 'popularity',
        'apiKey': Endpoints.apiKey,
      });

      return (response.data['articles'] as List)
          .map((news) => NewsModel.fromJson(news))
          .toList();
    } on DioError catch (error) {
      throw DataException.fromDioError(error);
    }
  }
}

final newsDataSourceProvider =
    Provider<NewsDataSource>((ref) => NewsDataSourceImpl(ref));
