import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/models/news_model/news_model.dart';
import 'repository_providers.dart';

final appleNewsProvider = FutureProvider<List<NewsModel>>(
    (ref) async => await ref.read(contentRepositoryProvider).getAppleNews());
