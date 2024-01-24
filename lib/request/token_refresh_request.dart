import 'package:aad_oauth/model/config.dart';
import 'package:flutter/foundation.dart';

class TokenRefreshRequestDetails {
  final String url;
  final Map<String, String> params;
  final Map<String, String> headers;

  TokenRefreshRequestDetails(Config config, String refreshToken)
      : url = config.tokenUrl,
        params = {
          'client_id': config.clientId,
          'scope': config.scope,
          'redirect_uri': config.redirectUri,
          'grant_type': 'refresh_token',
          'refresh_token': refreshToken
        },
        headers = {
          'Accept': 'application/json',
          'Content-Type': Config.contentType,
          if (config.origin != null) 'Origin': config.origin!,
        } {
    if (config.clientSecret != null) {
      debugPrint("Adding client_secret to AuthorizationRequest()");
      params.putIfAbsent('client_secret', () => config.clientSecret!);
    }
  }
}
