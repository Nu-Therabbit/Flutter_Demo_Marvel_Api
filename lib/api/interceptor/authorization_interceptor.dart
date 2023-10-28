import 'package:dio/dio.dart';
import 'package:marvel/common/constants.dart';
import 'package:marvel/common/crypto_utils.dart';

class AuthorizationInterceptor extends Interceptor {
  // todo inject this
  final String _publicKey = "6e84eefa9809f44061fd479cee6e75c0";
  final String _privateKey = "da49d0d036f2b645e8c17e9caba963a784c201c5";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    String hash = CryptoUtils.generateMd5("$timestamp$_privateKey$_publicKey");
    options.queryParameters["apikey"] = _publicKey;
    options.queryParameters["ts"] = "$timestamp";
    options.queryParameters["hash"] = hash;
    return super.onRequest(options, handler);
  }
}
