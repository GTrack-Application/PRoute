import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:p_route/Constants/app_urls.dart';

class ResetPasswordServices {
  static Future<void> forgotPassword(
    String email,
    String activity,
  ) async {
    const baseUrl = '${AppUrls.domain}/api/member/forgot/password';
    final uri = Uri.parse(baseUrl);
    return http.post(
      uri,
      body: json.encode(
        {
          // body should include email
          'email': email,
          'activity': activity,
        },
      ),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Host': 'gs1ksa.org',
      },
    ).then((response) {
      if (response.statusCode == 200) {
        // handle successful response
      } else {
        throw Exception('Could not send code, please try again later');
      }
    });
  }

  // Verify OTP
  static Future<void> verifyCode(
    String email,
    String activity,
    String code,
  ) async {
    const baseUrl = '${AppUrls.domain}/api/member/verify/forgot/password/code';
    final uri = Uri.parse(baseUrl);
    return http.post(
      uri,
      body: json.encode(
        {
          // body should include email
          'email': email,
          'activity': activity,
          'code': code,
        },
      ),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Host': 'gs1ksa.org',
      },
    ).then((response) {
      if (response.statusCode == 200) {
        // handle successful response
      } else {
        throw Exception('Could not verify code, please try again later');
      }
    }).catchError((error) {
      throw Exception(error);
    });
  }

  // Reset Password
  static Future<void> resetPassword(
    String email,
    String activity,
    String password,
    String confirmPassword,
  ) async {
    const baseUrl = '${AppUrls.domain}/api/member/password/reset';
    final uri = Uri.parse(baseUrl);
    return http.post(
      uri,
      body: json.encode(
        {
          // body should include email
          'email': email,
          'activity': activity,
          'password': password,
          'password_confirmation': confirmPassword,
        },
      ),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Host': 'gs1ksa.org',
      },
    ).then((response) {
      if (response.statusCode == 200) {
        // handle successful response
      } else {
        throw Exception('Could not reset password, please try again later');
      }
    }).catchError((error) {
      throw Exception(error);
    });
  }
}
