import 'dart:developer';

import 'package:course_selling/common/entities/entities.dart';

import '../services/utils/http_utils.dart';

class UserAPI {
  static login({LoginRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/login',
      queryParameters: params?.toJson(),
    );
    log('User API Response in user api classs: ${response.toString()}');
  }
}
