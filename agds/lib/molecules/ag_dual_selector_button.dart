import 'package:agds/agds.dart';
import 'package:flutter/material.dart';

class AgDualSelectorButton extends StatelessWidget {
  const AgDualSelectorButton({
    super.key,
    required this.selectedElements,
    required this.element,
    required this.firstIcon,
    required this.secondIcon,
    required this.onFirstAction,
    required this.onSecondAction,
    this.isEnabled = true,
  });

  final List<AgSelectorModel> selectedElements;
  final bool isEnabled;
  final AgSelectorModel element;
  final IconData firstIcon;
  final IconData secondIcon;
  final VoidCallback onFirstAction;
  final VoidCallback onSecondAction;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const SizedBox(width: 300),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 4, left: 8),
              padding: const EdgeInsets.all(8.0),
              width: 130,
              decoration: BoxDecoration(
                color: !isEnabled
                    ? AgColors.primaryColor(context).withOpacity(0.3)
                    : AgColors.inverseSurfaceColor(context).withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Icon(
                firstIcon,
                color: AgColors.primaryColor(context),
                size: 20,
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(top: 4, right: 8),
              padding: const EdgeInsets.all(8.0),
              width: 130,
              decoration: BoxDecoration(
                color: !isEnabled
                    ? AgColors.secondaryColor(context).withOpacity(0.3)
                    : AgColors.inverseSurfaceColor(context).withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Icon(
                secondIcon,
                color: AgColors.primaryColor(context),
                size: 20,
              ),
            ),
          ],
        ),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            width: 210,
            child: Text(
              element.text,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: AgColors.inverseSurfaceColor(context),
                  fontWeight: FontWeight.bold),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 4, left: 8),
              child: InkWell(
                onTap: !isEnabled ? onFirstAction : null,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(8.0),
                  width: 130,
                  child: Icon(
                    firstIcon,
                    color: Colors.transparent,
                    size: 20,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 4, right: 8),
              child: InkWell(
                onTap: !isEnabled ? onSecondAction : null,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  width: 130,
                  child: Icon(
                    secondIcon,
                    color: Colors.transparent,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
