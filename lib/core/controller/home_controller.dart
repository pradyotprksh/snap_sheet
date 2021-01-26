import 'dart:math';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:google_pay/core/model/user_response.dart';

/// The home controller for the home screen which will handle the UI related
/// logic or the business logic will happen here.
class HomeController extends GetxController {
  /// List of users
  List<UserResponse> userList = [];

  /// Image position
  double imagePosition = Get.height * 0.7 + 50;

  /// to add the value while dragging for parallax effect
  var _toAdd = 0;

  /// Last drag position. to know if its scrolling above or down
  var _lastKnownPosition = 0.0;

  /// Get the user list.
  void getUserData() async {
    var userJson = await rootBundle.loadString('assets/json/user_json.json');
    userList = userResponseFromMap(userJson);
    update();
  }

  /// Update the image position based on [position].
  void updateDragPosition(double position) {
    // If less then scrolling above.
    if (_lastKnownPosition < position) {
      _toAdd = 0;
      imagePosition = position + 50;
    } else {
      imagePosition = position + 50 - _toAdd++;
    }
    _lastKnownPosition = position;
    // should not go above the initial position of sheet.
    imagePosition = min(imagePosition, Get.height * 0.7 + 50);
    // should not go below the center of the screen.
    imagePosition = max(Get.height * 0.5, imagePosition);
    // whenever reached to the initial position or totally down make toAdd to 0.
    if (position == Get.height * 0.7 + 50 || position == 50) _toAdd = 0;
    update();
  }
}
