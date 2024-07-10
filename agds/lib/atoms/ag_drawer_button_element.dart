import 'package:flutter/material.dart';

import '../agds.dart';

class DrawerButtonElement extends StatelessWidget {
  const DrawerButtonElement({
    required this.text,
    required this.onTap,
    this.isSelected = false,
    super.key,
  });
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: isSelected
                ? AgColors.primaryColor(context)
                : AgColors.secondaryColor(context)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: !isSelected ? onTap : null,
            borderRadius: BorderRadius.circular(5),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Center(child: Text(text)),
            ),
          ),
        ),
      ),
    );
  }
}
