// gender_container_widget.dart
import 'package:flutter/material.dart';

class GenderContainerWidget extends StatefulWidget {
  const GenderContainerWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.backgroundColor,
  });
  final String title;
  final IconData icon;
  final Color backgroundColor;
  @override
  State<GenderContainerWidget> createState() => _GenderContainerWidgetState();
}

class _GenderContainerWidgetState extends State<GenderContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(22, 37, 23, 21),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        spacing: 11,
        children: [
          Icon(widget.icon, size: 64, color: Colors.white),
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
