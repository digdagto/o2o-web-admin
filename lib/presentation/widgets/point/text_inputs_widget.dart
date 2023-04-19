import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o2o_point_configuration/presentation/controllers/configuration_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:o2o_point_configuration/theme/app_colors.dart';
import 'package:o2o_point_configuration/utils/utils.dart';


class TextInputsWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const TextInputsWidget({Key? key, required this.formKey}) : super(key: key);
  @override
  _TextInputsWidgetState createState() => _TextInputsWidgetState();
}

class _TextInputsWidgetState extends State<TextInputsWidget> {
  final TextEditingController _pointController = TextEditingController();
  final TextEditingController _lowerLimitController = TextEditingController();
  final TextEditingController _upperLimitController = TextEditingController();
  final TextEditingController _minUseController = TextEditingController();
  final TextEditingController _maxUseController = TextEditingController();
  late final ConfigurationController configurationPageController;


  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _pointController.dispose();
    _lowerLimitController.dispose();
    _upperLimitController.dispose();
    _minUseController.dispose();
    _maxUseController.dispose();

    super.dispose();
  }


  @override
  void initState() {
    super.initState();

    configurationPageController =
    Get.find<ConfigurationController>();

    // Set initial values for the controllers
    _pointController.text = configurationPageController.points.value.toString();
    _lowerLimitController.text = configurationPageController.lowerLimit.value.toString();
    _upperLimitController.text = configurationPageController.upperLimit.value.toString();
    _minUseController.text = configurationPageController.minUse.value.toString();
    _maxUseController.text = configurationPageController.maxUse.value.toString();

    // Add listeners
    _pointController.addListener(() {
      configurationPageController.setPoints(
          int.tryParse(_pointController.text) ?? 0);
    });

    _lowerLimitController.addListener(() {
      configurationPageController.setLowerLimit(
          double.tryParse(_lowerLimitController.text) ?? 0.0);
    });

    _upperLimitController.addListener(() {
      configurationPageController.setUpperLimit(
          double.tryParse(_upperLimitController.text) ?? 0.0);
    });

    _minUseController.addListener(() {
      configurationPageController.setMinUse(
          int.tryParse(_minUseController.text) ?? 0);
    });

    _maxUseController.addListener(() {
      configurationPageController.setMaxUse(
          int.tryParse(_maxUseController.text) ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildTitle(String title) {
      return Container(
        margin: EdgeInsets.only(left: 0),
        child: Text(
          title,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget _buildLabelText(String labelText) {
      return Obx(() {
        final isEnabled = configurationPageController.usePoints.value;
        return SizedBox(
          width: isMobileDevice(context) ? currentScreenWidth(context) /2 :  300,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, left: 4),
            child: Text(
              labelText,
              style: TextStyle(
                color: isEnabled ? Colors.black : Colors.grey,
              ),
            ),
          ),
        );
      });
    }

    void _updateControllerValue(TextEditingController controller, Rx rxValue,
        ConfigurationController _ctrl) {
      if (_ctrl.valuesLoaded.value) {
        Future.microtask(() {
          controller.value = controller.value.copyWith(
            text: rxValue.value.toString(),
            selection: TextSelection.fromPosition(
              TextPosition(offset: rxValue.value.toString().length),
            ),
          );
        });
      }
    }

    void _showToastMessage(bool isEnabled, bool valuesLoaded) {
      Fluttertoast.showToast(
        msg: !valuesLoaded
            ? "동기화 중입니다. 잠시만 기다려주세요 "
            : "포인트 사용 여부를 먼저 선택해주세요",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Color(0xff707070),
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        webBgColor: "#707070",
        timeInSecForIosWeb: 2,
      );
    }

    Widget _buildTextFormField(TextEditingController controller, bool isEnabled,
        ConfigurationController _ctrl) {
      return Container(
        width: 240.0,
        height: 66,
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.right,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '필수 입력 내용입니다.';
            }
            return null;
          },
          style: TextStyle(color: isEnabled ? Colors.black : Colors.grey),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryOrange, width: 2.0),
            ),
            hintStyle: TextStyle(color: isEnabled ? Colors.black : Colors.grey),
            errorText: controller.text.isEmpty ? '필수 입력 내용입니다.' : null,
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: isEnabled ? Colors.black : Colors.grey),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            labelStyle: TextStyle(color: isEnabled ? Colors.black : Colors.grey),
          ),
          enabled: isEnabled && _ctrl.valuesLoaded.value,
        ),
      );
    }

    Widget _buildInputRow(BuildContext context, String hintText, TextEditingController controller,
        bool isEnabled, ConfigurationController _ctrl) {
      return isMobileDevice(context)
          ? Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildTextFormField(controller, isEnabled, _ctrl),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Text(hintText),
          ),
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTextFormField(controller, isEnabled, _ctrl),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Text(hintText),
          ),
        ],
      );
    }


    Widget _buildInputFieldContent(
        BuildContext context, String hintText, TextEditingController controller, Rx rxValue) {
      return Obx(() {
        final isEnabled = configurationPageController.usePoints.value;
        return GetX<ConfigurationController>(
          builder: (_ctrl) {
            _updateControllerValue(controller, rxValue, _ctrl);
            return ValueListenableBuilder<TextEditingValue>(
              valueListenable: controller,
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: (!isEnabled || !_ctrl.valuesLoaded.value)
                      ? () => _showToastMessage(isEnabled, _ctrl.valuesLoaded.value)
                      : null,
                  child: _buildInputRow(context, hintText, controller, isEnabled, _ctrl),
                );
              },
            );
          },
        );
      });
    }




    Widget _buildInputField(BuildContext context, String labelText, String hintText,
        TextEditingController controller, Rx rxValue) {
      return

        isMobileDevice(context) ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabelText(labelText),
          SizedBox(height: 8,),
          _buildInputFieldContent(context, hintText, controller, rxValue),
        ],
      ) : Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildLabelText(labelText),
            _buildInputFieldContent(context, hintText, controller, rxValue),
          ],
        ) ;
    }



    return Container(
      margin: EdgeInsets.all(16.0),
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitle("적립 방식"),
          SizedBox(height: 12.0),
            _buildInputField(context, '결제금액의', '%', _pointController, configurationPageController.points),
            SizedBox(height: 16.0),
            _buildInputField(context,'최소 적립 가능 결제 금액', '원', _lowerLimitController, configurationPageController.lowerLimit),
            SizedBox(height: 16.0),
            _buildInputField(context,'최대 적립 가능 결제 금액', '원', _upperLimitController, configurationPageController.upperLimit),
            SizedBox(height: 16.0),
            _buildTitle("사용 방식"),
            SizedBox(height: 12.0),
            _buildInputField(context,'최소 사용 가능 포인트', 'P', _minUseController, configurationPageController.minUse),
            SizedBox(height: 16.0),
            _buildInputField(context,'최대 사용 가능 포인트', 'P', _maxUseController, configurationPageController.maxUse),
          ],
        ),
      ),
    );


  }
}