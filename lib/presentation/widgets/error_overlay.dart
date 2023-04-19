import 'package:flutter/material.dart';

class ErrorOverlay extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onConfirm;

  const ErrorOverlay({
    Key? key,
    required this.errorMessage,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.6,
          child: const ModalBarrier(dismissible: false, color: Colors.black),
        ),
        Center(
          child: AlertDialog(
            title: Text('Error'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: onConfirm,
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void showErrorOverlay(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return ErrorOverlay(
        errorMessage: errorMessage,
        onConfirm: () {
          Navigator.of(context).pop();
        },
      );
    },
  );
}
