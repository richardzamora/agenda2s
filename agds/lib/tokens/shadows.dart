import 'package:agds/agds.dart';
import 'package:flutter/widgets.dart';

inverseSurfaceShadow(context) => [
      BoxShadow(
          color: AgColors.inverseSurfaceColor(context).withOpacity(0.5),
          offset: Offset(1, 1),
          blurRadius: 2)
    ];
