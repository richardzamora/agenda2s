import 'package:agds/tokens/colors.dart';
import 'package:flutter/material.dart';

enum AgButtonType { primary, secondary }

class AgButton extends StatelessWidget {
  const AgButton({
    required this.onTap,
    this.buttonType = AgButtonType.primary,
    this.buttonText = "",
    this.isExpanded = false,
    this.isEnable = true,
    super.key,
  });

  final AgButtonType buttonType;
  final String buttonText;
  final VoidCallback onTap;
  final bool isEnable;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        AgColors.primaryColor(context).withOpacity(isEnable ? 1 : 0.5);
    final secondaryColor =
        AgColors.secondaryColor(context).withOpacity(isEnable ? 1 : 0.5);
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
          onTap: isEnable ? onTap : null,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              buttonText,
              style: TextStyle(color: AgColors.surfaceColor(context)),
            )),
          ),
        ),
      ),
    );
  }
}
