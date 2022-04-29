import 'package:flutter/material.dart';

import '../constants.dart';

class StyledAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StyledAppBar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/appBarBg.png'),
                  fit: BoxFit.fill)),
        ),
        title: Text(title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26.0,
              fontWeight: FontWeight.w700,
            )),
        centerTitle: true,
        backgroundColor: ColorConstants.primaryColor,
        toolbarHeight: MediaQuery.of(context).size.height * 0.15);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(130.0);
}
