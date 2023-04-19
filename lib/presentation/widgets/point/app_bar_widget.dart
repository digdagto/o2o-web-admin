import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final Function toggleLeftPanel;

  AppBarWidget({required this.toggleLeftPanel});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xfff2f6fc),
      elevation: 0.0,
      actions: [
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => toggleLeftPanel(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}