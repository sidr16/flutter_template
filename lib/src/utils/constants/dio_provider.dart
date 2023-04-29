import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../main.dart';
import 'endpoints.dart';

final dioProvider = Provider(
  (ref) => Dio(
    BaseOptions(
      baseUrl: Endpoints().getBaseUrl(
        ref.read(langProvider).languageCode,
      ),
    ),
  ),
);
