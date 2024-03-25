import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: const <TextSpan>[
            TextSpan(
              text: 'REMAR',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            TextSpan(
              text: '_CITIZEN',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Image.asset('assets/images/appBar/raster_logo_ufsb.png'),
          onPressed: () {},
          iconSize: 24,
        ),
        IconButton(
          icon: Image.asset('assets/images/appBar/raster_logo_napier.png'),
          onPressed: () {},
          iconSize: 24,
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10.0),
        child: Container(
          color: Colors.green,
          height: 10.0,
        ),
      ),
    );
  }
}
