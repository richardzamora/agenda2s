import 'package:flutter/material.dart';

class AgAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AgAppbar({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? ''),
    );
  }

  @override
  Size get preferredSize => _PreferredAppBarSize(null, null);
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
