import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mandi/core/constants/environment.dart';

class MandiDivider extends StatelessWidget {
  final Color? color;
  final double? thickness;
  final double? opacity;
  final double? shapeSize;
  final BoxShape? shape;

  const MandiDivider({
    super.key,
    this.color,
    this.thickness,
    this.opacity,
    this.shapeSize,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: thickness ?? 0.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    color ?? theme.colorScheme.primary,
                    color ?? theme.colorScheme.primary,
                    if (shape != null) Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          if (shape != null) ...[
            Gap(Environment.size8),
            Container(
              height: shapeSize ?? 6.0,
              width: shapeSize ?? 6.0,
              decoration: BoxDecoration(
                shape: shape ?? BoxShape.circle,
                color: color ?? theme.colorScheme.primary.withValues(alpha: opacity ?? 0.6),
              ),
            ),
            Gap(Environment.size8),
          ],
          Expanded(
            child: Container(
              height: thickness ?? 0.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    if (shape != null) Colors.transparent,
                    color ?? theme.colorScheme.primary,
                    color ?? theme.colorScheme.primary,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
