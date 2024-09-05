import 'package:agds/molecules/ag_chip_element.dart';
import 'package:agds/tokens/shadows.dart';
import 'package:flutter/material.dart';

import '../agds.dart';

class AgCardElement extends StatelessWidget {
  const AgCardElement({
    this.title,
    this.subtitle,
    this.content,
    this.chips,
    this.onTap,
    this.icon,
    this.onIconTap,
    super.key,
  });

  final String? title;
  final String? subtitle;
  final List<String>? content;
  final List<AgSelectorModel>? chips;
  final VoidCallback? onTap;
  final Widget? icon;
  final VoidCallback? onIconTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: AgColors.surfaceColor(context),
            borderRadius: BorderRadius.circular(10),
            boxShadow: inverseSurfaceShadow(context),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: onTap,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (title != null)
                          Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(title!)),
                        if (subtitle != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 8),
                            child: Text(subtitle!),
                          ),
                        if (content != null)
                          for (String value in content!)
                            Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: Text(value)),
                      ],
                    )),
                    if (icon != null)
                      IconButton(onPressed: onIconTap, icon: icon!),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (chips != null)
          Wrap(
            alignment: WrapAlignment.start,
            runSpacing: 4,
            spacing: 4,
            children: [
              for (AgSelectorModel value in chips!)
                AgChipElement(
                  hasRequiredOption: true,
                  element: value,
                  multiplierSize: 0.8,
                ),
            ],
          ),
      ],
    );
  }
}
