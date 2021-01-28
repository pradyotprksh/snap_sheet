import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_pay/core/controller/home_controller.dart';
import 'package:google_pay/core/model/user_response.dart';
import 'package:google_pay/src/home_page/widget/circular_text_card_image.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

/// The main home page. This is the initial page which will be opened.
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<HomeController>(
        init: Get.put(HomeController())..getUserData(),
        builder: (_controller) => SnappingSheet(
          onMove: (position) {
            _controller.updateDragPosition(position);
          },
          child: Stack(
            children: <Widget>[
              _getImage(_controller.imagePosition),
            ],
          ),
          grabbing: _getGrabbingWidget(),
          grabbingHeight: 50,
          snapPositions: _getSnapPosition(),
          initSnapPosition: SnapPosition(
            positionPixel: Get.height * 0.7,
            snappingCurve: Curves.elasticOut,
            snappingDuration: Duration(
              milliseconds: 750,
            ),
          ),
          sheetBelow: SnappingSheetContent(
            draggable: true,
            child: Container(
              color: Colors.white,
              child: _getUserList(_controller.userList),
            ),
          ),
        ),
      ),
    );
  }

  _getImage(double imagePosition) => Positioned(
    bottom: imagePosition,
    left: 0,
    right: 0,
    child: Container(
      width: double.infinity,
      height: Get.height * 0.2,
      child: Image.asset(
        'assets/image.jpg',
        fit: BoxFit.cover,
      ),
    ),
  );

  _getGrabbingWidget() => Card(
    elevation: 10,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          30,
        ),
        topRight: Radius.circular(
          30,
        ),
      ),
    ),
  );

  _getSnapPosition() => [
    SnapPosition(
      positionPixel: Get.height * 0.7,
      snappingCurve: Curves.ease,
      snappingDuration: Duration(
        milliseconds: 750,
      ),
    ),
    SnapPosition(
      positionPixel: 50,
      snappingCurve: Curves.elasticOut,
      snappingDuration: Duration(
        milliseconds: 750,
      ),
    ),
    SnapPosition(
      positionFactor: 1,
      snappingCurve: Curves.ease,
      snappingDuration: Duration(
        milliseconds: 500,
      ),
    ),
  ];

  _getUserList(List<UserResponse> userList) => GridView.builder(
        shrinkWrap: true,
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        itemCount: userList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: Get.height / 1000,
        ),
        itemBuilder: (_, position) {
          var userData = userList[position];
          return CircularTextCardImage(
            35,
            userData.name,
            userData.picture,
          );
        },
      );
}
