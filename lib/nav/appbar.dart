import 'package:flutter/material.dart';

class CustomNav extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Calculator'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40.0);
}
