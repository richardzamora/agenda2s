import 'package:agds/agds.dart';
import 'package:flutter/material.dart';

import '../tokens/text_style.dart';

class AgChipElement extends StatelessWidget {
  const AgChipElement({
    super.key,
    required this.element,
    this.onDeleted,
    this.hasRequiredOption = false,
    this.multiplierSize = 1,
  });

  final bool hasRequiredOption;
  final AgSelectorModel element;
  final VoidCallback? onDeleted;
  final double multiplierSize;

  @override
  Widget build(BuildContext context) {
    return Chip(
      side: multiplierSize < 1 ? BorderSide.none : null,
      backgroundColor: AgColors.surfaceColor(context),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasRequiredOption)
            Container(
              margin: EdgeInsets.only(right: 4 * multiplierSize),
              padding: EdgeInsets.all(4 * multiplierSize),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: element.isRequired
                    ? AgColors.primaryColor(context).withOpacity(0.3)
                    : AgColors.secondaryColor(context).withOpacity(0.3),
              ),
              child: Icon(
                element.isRequired ? Icons.lock : Icons.lock_open,
                color: AgColors.primaryColor(context),
                size: 20 * multiplierSize,
              ),
            ),
          Text(
            element.text,
            style: AgTextStyle.ralewayStyle.copyWith(
              fontWeight: FontWeight.w600,
              color: AgColors.inverseSurfaceColor(context),
              fontSize: 12.0 * multiplierSize,
            ),
          ),
        ],
      ),
      deleteIcon: Icon(
        Icons.delete,
        color: AgColors.errorColor(context),
        size: 20 * multiplierSize,
      ),
      onDeleted: onDeleted,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
