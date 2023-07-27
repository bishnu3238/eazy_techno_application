import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../app_constants/app_constant.dart';
import '../../../../package/package.dart';

class LogInAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LogInAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleAppBar(
      title: appName,
      leading: FavIcon(
        icon: FontAwesomeIcons.xmark,
        onTap: null,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
