import 'package:flutter/material.dart';

import '../agds.dart';

class AgCardElement extends StatelessWidget {
  const AgCardElement({
    this.title,
    this.subtitle,
    this.content,
    this.onTap,
    this.icon,
    this.onIconTap,
    super.key,
  });

  final String? title;
  final String? subtitle;
  final List<String>? content;
  final VoidCallback? onTap;
  final Widget? icon;
  final VoidCallback? onIconTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: AgColors.surfaceColor(context),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: AgColors.inverseSurfaceColor(context),
            offset: Offset(0.5, 0.5),
            blurRadius: 2,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) Text(title!),
                  if (subtitle != null) Text(subtitle!),
                  if (content != null)
                    for (String value in content!) Text(value),
                ],
              )),
              if (icon != null) IconButton(onPressed: onIconTap, icon: icon!),
            ],
          ),
        ),
      ),
    );
  }
}
