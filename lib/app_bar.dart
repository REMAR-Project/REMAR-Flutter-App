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
          children: const  <TextSpan>[
            TextSpan(
              text: 'REMAR',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            TextSpan(
              text: '_CITIZEN',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[

        Image.asset(
          'assets/raster_logo_ufsb.png',
          height: 125,
          width: 125,
        ),
        Image.asset(
          'assets/raster_logo_napier.png',
          height: 125,
          width: 125,
        )

        //Image.asset('assets/raster_logo_napier.png'),

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