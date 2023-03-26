import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/constants/endpoints.dart';
import 'package:template/main.dart';

final dioProvider = Provider(
  (ref) => Dio(
    BaseOptions(
      baseUrl: Endpoints().getBaseUrl(
        ref.read(langProvider).languageCode,
      ),
    ),
  ),
);
