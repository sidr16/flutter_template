import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repositories/content_repository_impl.dart';
import '../../domain/models/news_model/news_model.dart';

final appleNewsProvider = FutureProvider<List<NewsModel>>(
    (ref) async => await ref.read(contentRepositoryProvider).getAppleNews());
