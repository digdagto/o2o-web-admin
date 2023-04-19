import 'package:flutter/material.dart';
import 'package:o2o_point_configuration/theme/app_colors.dart';

class CustomToast extends StatelessWidget {
  final String message;

  CustomToast({required this.message});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.05,
      left: MediaQuery.of(context).size.width * 0.5 - 100,
      child: Material(
        borderRadius: BorderRadius.circular(31),
        color: AppColors.toastBgColor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 60),
          child: Text(
            message,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

Future<void> showCustomToast(BuildContext context, String message) async {
  OverlayState? overlayState = Overlay.of(context);
  OverlayEntry? overlayEntry;

  if (overlayState != null) {
    overlayEntry = OverlayEntry(builder: (context) => CustomToast(message: message));
    overlayState.insert(overlayEntry);

    await Future.delayed(Duration(seconds: 2));

    overlayEntry.remove();
  }
}

