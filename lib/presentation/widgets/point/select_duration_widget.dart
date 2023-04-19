import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:o2o_point_configuration/presentation/controllers/configuration_controller.dart';
import 'package:o2o_point_configuration/theme/app_colors.dart';
import 'package:o2o_point_configuration/utils/utils.dart';

class SelectDurationWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        bool isMobile = isMobileDevice(context);

        return Container(
          margin: EdgeInsets.all(16.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('유효기간'),
              isMobile ? _buildDropdown() : _buildRadioRow(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRadioRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildRadioTile(1, '1년'),
        _buildRadioTile(2, '2년'),
        _buildRadioTile(3, '3년'),
        _buildRadioTile(4, '4년'),
        _buildRadioTile(5, '5년'),
      ],
    );
  }

  Widget _buildDropdown() {
    final ConfigurationController configurationPageController =
    Get.find<ConfigurationController>();

    return Obx(() {
      return DropdownButton<int>(
        value: configurationPageController.duration.value,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(
          fontSize: 18,
          color: AppColors.primaryOrange,
        ),
        underline: Container(
          height: 2,
          color: AppColors.primaryOrange,
        ),
        onChanged: (int? newValue) {
          if (newValue != null) {
            configurationPageController.setDuration(newValue);
          }
        },
        items: List.generate(5, (index) {
          int value = index + 1;
          String title = '$value년';
          return DropdownMenuItem(
            child: Row(
              children: [
                SizedBox(width: 10),
                Container(
                  width: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            value: value,
          );
        }),
      );
    });
  }


  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: AppColors.primaryOrange,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      webBgColor: "#707070",
      timeInSecForIosWeb: 2,
    );
  }

  Widget _buildRadioTile(int value, String title) {
    return Obx(() {
      ConfigurationController _ctrl = Get.find<ConfigurationController>();
      bool isEnabled = _ctrl.usePoints.value && _ctrl.valuesLoaded.value;

      return Container(
        width: 110,
        child: GestureDetector(
          onTap: isEnabled
              ? null
              : () => _showToast("포인트 사용 여부를 먼저 선택해주세요"),
          child: _buildRadioListTile(value, title, isEnabled),
        ),
      );
    });
  }
  Widget _buildRadioListTile(int value, String title, bool isEnabled) {
    final ConfigurationController configurationPageController =
    Get.find<ConfigurationController>();

    return ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      minLeadingWidth: 0,
      onTap: isEnabled
          ? () {
        print("select value ${value}");
        configurationPageController.setDuration(value);
      }
          : null,
      leading: Radio(
        value: value,
        groupValue: configurationPageController.duration.value,
        onChanged: isEnabled
            ? (int? value) {
          print("select value ${value}");
          configurationPageController.setDuration(value!);
        }
            : null,
        activeColor: isEnabled ? AppColors.primaryOrange : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 12, color: isEnabled ? Colors.black : Colors.grey),
      ),
    );
  }


}
