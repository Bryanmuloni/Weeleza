import 'dart:ui';

import 'package:flutter/material.dart';

class ExtendableFab extends StatefulWidget {
  final Widget label;
  final IconData icon;
  final VoidCallback onPressed;

  ExtendableFab({Key key, this.icon, this.label, this.onPressed}) : super(key: key);

  @override
  _ExtendableFabState createState() => _ExtendableFabState();
}

class _ExtendableFabState extends State<ExtendableFab> {
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = NavigationRail.extendedAnimation(context);
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        // The extended fab has a shorter height than the regular fab.
        return Container(
          height: 56,
          padding: EdgeInsets.symmetric(
            vertical: lerpDouble(0, 6, animation.value),
          ),
          child: animation.value == 0
              ? FloatingActionButton(
                  child: Icon(widget.icon),
                  onPressed: widget.onPressed,
                )
              : Align(
                  alignment: AlignmentDirectional.centerStart,
                  widthFactor: animation.value,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8),
                    child: FloatingActionButton.extended(
                      icon: Icon(widget.icon),
                      label: widget.label,
                      onPressed: widget.onPressed,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
