class Endpoints {
  static const String apiV1 = 'api/v1';

  String getBaseUrl(String lang) => 'http://api.splay.uz/$lang/';

  static const String content = '/$apiV1/content';
}
