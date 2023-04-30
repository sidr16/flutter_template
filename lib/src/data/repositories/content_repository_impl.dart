import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/models/news_model/news_model.dart';
import '../../domain/repositories/content_repository.dart';
import '../datasources/remote/content_data_source_impl.dart';

class ContentRepositoryImpl implements ContentRepository {
  final Ref ref;

  const ContentRepositoryImpl(this.ref);

  @override
  Future<List<NewsModel>> getAppleNews() async {
    return await ref.read(newsDataSourceProvider).getAppleNews();
  }
}

final contentRepositoryProvider =
    Provider<ContentRepositoryImpl>((ref) => ContentRepositoryImpl(ref));
