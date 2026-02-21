import 'package:flutter/material.dart';
import 'package:book_tracking_app/utils/constants.dart';

class StatusBadge extends StatelessWidget {
  final BookStatus status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        status.label,
        style: TextStyle(color: status.color, fontSize: 12),
      ),
      avatar: Icon(status.icon, size: 16, color: status.color),
      backgroundColor: status.color.withValues(alpha: 0.1),
      side: BorderSide.none,
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );
  }
}
