import 'package:agds/tokens/colors.dart';
import 'package:flutter/material.dart';

enum AgButtonStyle { selected, unselected }

class AgButtonListItem extends StatelessWidget {
  const AgButtonListItem({
    required this.onTap,
    this.buttonType = AgButtonStyle.unselected,
    this.buttonText = "",
    this.isExpanded = false,
    super.key,
  });

  final AgButtonStyle buttonType;
  final String buttonText;
  final VoidCallback onTap;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final primaryColor = AgColors.primaryColor(context);
    final secondaryColor = AgColors.surfaceColor(context);
    return Container(
      width: isExpanded ? double.infinity : null,
      decoration: BoxDecoration(
        color: buttonType == AgButtonStyle.selected
            ? primaryColor
            : secondaryColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              buttonText,
              style: TextStyle(
                  color: buttonType == AgButtonStyle.selected
                      ? AgColors.surfaceColor(context)
                      : AgColors.inverseSurfaceColor(context)),
            )),
          ),
        ),
      ),
    );
  }
}
