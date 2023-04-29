import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repositories/content_repository_impl.dart';

final contentRepositoryProvider =
    Provider<ContentRepositoryImpl>((ref) => ContentRepositoryImpl(ref));
