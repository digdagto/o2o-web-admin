import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:o2o_point_configuration/presentation/controllers/configuration_controller.dart';
import 'package:o2o_point_configuration/presentation/widgets/point/custom_switch.dart';
import 'package:o2o_point_configuration/theme/app_colors.dart';

class ToggleSelectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ConfigurationController configurationController = Get.find<ConfigurationController>();

    return GetBuilder<ConfigurationController>(
      builder: (_ctrl) {
        return GestureDetector(
          onTap: !_ctrl.valuesLoaded.value
              ? () {
            print("value loaded ${_ctrl.valuesLoaded.value}");
            Fluttertoast.showToast(
              msg: "동기화 중입니다. 잠시만 기다려주세요 ",
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: Color(0xff707070),
              textColor: Colors.white,
              gravity: ToastGravity.BOTTOM,
              webBgColor: "#707070",
              timeInSecForIosWeb: 2,
            );
          }
              : null,
          child: Container(
              margin: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('포인트 사용여부 '),
                  SizedBox(height: 10,),
                  Obx(() {
                    return
                      CustomSwitch(
                        value: configurationController.usePoints.value,
                        onChanged: _ctrl.valuesLoaded.value
                            ? (bool newValue) {
                          configurationController.setUsePoints(newValue);
                          // configurationController.submitData();
                        }
                            : (bool newValue){},
                        activeColor: AppColors.primaryOrange,
                      );
                  }),
                ],
              ),
            ),

        );
      },
    );
  }
}