import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gyms/config/user_local.dart';

class DioHelper {
  Dio dio = Dio();

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    log("token : ${UserLoacl.token}");
    Response response = await dio.get(
      ApiPath.baseUrl + endPoint,
      data: body,
      options: Options(
        headers: {
          'Accept': '*/*',
          "Authorization": "Bearer $token",
        },
      ),
    );
    log(response.statusCode.toString());
    return response;
  }

  Future<Response> postData({
    bool handleError = true,
    required String endPoint,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    log("token : ${UserLoacl.token}");
    try {
      Response response = await dio.post(
        ApiPath.baseUrl + endPoint,
        data: body,
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 204 ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
      } else if (response.statusCode == 403) {
        if (kDebugMode) {
          print(response.data);
        }
      }
      return response;
    } on DioError catch (error) {
      print(error.message.toString());
      rethrow;
    }
  }

  // Future<Response> postDataForPayment({
  //   bool handleError = true,
  //   required String endPoint,
  //   Map<String, dynamic>? body,
  //   String? token,
  // }) async {
  //   print('Started');
  //   Response response = await dio.post(
  //     baseUrl + endPoint,
  //     queryParameters: body,
  //     // data: body,
  //     options: Options(
  //       headers: {
  //         "authorization":
  //             "Bearer ${MyConfigCach.getString(key: MyConfigCacheKeys.token)}",
  //       },
  //     ),
  //   );
  //   print('Ended');
  //   return response;
  // }

  Future<Response> putData({
    required String endPoint,
    Map<String, dynamic>? body,
    String? token,

  }) async {
    return await dio.put(
      ApiPath.baseUrl + endPoint,
      data: body,
      options: Options(
           headers: {
            'Accept': 'application/json',
            "Authorization": "Bearer $token",
          },
          ),
    );
  }

// /// Cart
// Future<Response> deleteFromCart({
//   required String endPoint,
//   Map<String, dynamic>? body,
// }) async {
//   // print('data 2');
//   return await dio.put('$baseUrl$endPoint',
//       data: body,
//       options: Options(
//         headers: {
//           "authorization":
//               "Bearer ${MyConfigCach.getString(key: MyConfigCacheKeys.token)}",
//         },
//       ));
//   // print('data3');
// }

  Future<Response> deleteData({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    return await dio.delete(
      ApiPath.baseUrl + endPoint,
      data: body,
      options: Options(
          // headers: {
          //   "Authorization": "Token ${UserLocal.token}",
          // },
          ),
    );
  }

// static void logout(BuildContext context) async {
//   await MyConfigCach.clearShared();
//   Navigator.pushReplacementNamed(context, 'checkScreen');
// }
}

class ApiPath {
  static const baseUrl = 'https://gyms-s47e.onrender.com/';
  static const register = 'auth/register';
  static const login = 'auth/login';
  static const allClubs = 'user/clubs';
  static const postReport = 'user/user_reports';
  static getClubDetails({required String clubId}) => 'user/club/$clubId';
  //localhost:8080/user/club_auth/:club_id?lat=29.849979&long=31.328881
  static getClubDetailsInAuth(
          {required String clubId,
          required String lat,
          required String long}) =>
      'user/club_auth/$clubId?lat=$lat&long=$long';
  //{{base}}user/clubs/filter?filter=best
  static filterClubs({required String filter}) =>
      "user/clubs/filter?filter=$filter";
  //{{base}}user/make_sub/:subId?type=paypal
//localhost:8080/user/clubs/filter?filter=nearby&lat=30.444&long=30.2357
static getNearby({required double lat,
          required double long,})=> "user/clubs/filter?filter=nearby&lat=$lat&long=$long";
  static pressPaypayEndPoint({required String subId,required String type}) =>
      "user/make_sub/$subId?type=$type";
//{{base}}user/confirm_payment/:subId
  static confrimPayment({required String subId}) =>
      "user/confirm_payment/$subId";

      //{{base}}user/rules?type=banner
      static const  getBanner = "user/rules?type=banner";
}
