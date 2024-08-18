import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DeviceController with ChangeNotifier {
  final String baseUrl = "http://192.168.4.1";
  final Dio _dio = Dio();

  Future<void> sendRequest(String endpoint) async {
    final url = '$baseUrl/$endpoint';
    try {
      final response = await _dio.get(url);
      print(response.statusCode);
      log(response.data);
    } on DioException catch (e) {
      log('Error: ${e.message}');
    }
    notifyListeners();
  }

  void onLeftPivot() => sendRequest('left-pivot');
  void onRightSmooth() => sendRequest('right-smooth');
  void onLeftSmooth() => sendRequest('left-smooth');
  void onRightPivot() => sendRequest('right-pivot');
  void onForward() => sendRequest('forward');
  void onBackward() => sendRequest('backward');
  void onHorn() => sendRequest('horn');
  void onHornOff() => sendRequest('horn-off');
  void onLamp() => sendRequest('lamp');
  void onLampOff() => sendRequest('lamp-off');
  void onSpecialOne() => sendRequest('special-one');
  void onSpecialTwo() => sendRequest('special-two');
  void onOff() => sendRequest('off');
}
