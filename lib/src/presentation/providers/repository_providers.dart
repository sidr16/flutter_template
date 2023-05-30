import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repositories/content_repository_impl.dart';
import '../../domain/repositories/content_repository.dart';

final contentRepositoryProvider =
    Provider<ContentRepository>((ref) => ContentRepositoryImpl(ref));
