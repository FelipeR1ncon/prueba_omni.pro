import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';

@Singleton()
class ClientHTTP extends http.BaseClient {
  final http.Client _inner;
  final Talker _logger;

  ClientHTTP(this._inner, this._logger);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (kDebugMode) _logger.info(request.url);
    return _inner.send(request);
  }
}
