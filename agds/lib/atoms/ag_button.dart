import 'package:agds/tokens/colors.dart';
import 'package:flutter/material.dart';

enum AgButtonType { primary, secondary }

class AgButton extends StatelessWidget {
  const AgButton({
    required this.onTap,
    this.buttonType = AgButtonType.primary,
    this.buttonText = "",
    this.isExpanded = false,
    super.key,
  });

  final AgButtonType buttonType;
  final String buttonText;
  final VoidCallback onTap;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final primaryColor = AgColors.primaryColor(context);
    final secondaryColor = AgColors.secondaryColor(context);
    return Container(
      width: isExpanded ? double.infinity : null,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color:
            buttonType == AgButtonType.primary ? primaryColor : secondaryColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(buttonText)),
          ),
        ),
      ),
    );
  }
}
