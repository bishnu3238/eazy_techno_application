import 'package:flutter/material.dart';

import '../../app_constants/app_constant.dart';
import '../package/package.dart';



class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color bgColor;
  final String title;
  final bool centerTitle;
  final Widget? leading;
  final double elevation;
  final VoidCallback? onLeadingTap;
  final TextStyle? style;
  final double tabBarHeight;
  final List<Widget>? buttons;
  final PreferredSizeWidget? tabBar;
  final Widget? flexibleSpace;
  const SimpleAppBar({
    super.key,
    this.title = '',
    this.bgColor = kLight,
    this.centerTitle = true,
    this.elevation = 0,
    this.leading,
    this.style,
    this.buttons,
    this.onLeadingTap,
    this.tabBar,
    this.flexibleSpace,
    this.tabBarHeight = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(tabBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      elevation: elevation,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      title: Text(title, style: style),
      backgroundColor: bgColor,
      actions: [...?buttons],
      bottom: tabBar,
    );
  }
}

Widget leading(
  Widget widget, {
  OnTap? onPressed,
}) =>
    IconButton(
        onPressed: onPressed != null ? () => onPressed() : null, icon: widget);
