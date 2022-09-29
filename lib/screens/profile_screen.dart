import 'package:flutter/material.dart';
import '../util/utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          uSafeAreaSizedBox,
          Text(
            'My Account No',
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal! * 8,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          Text(
            '08018118817',
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.75),
            ),
          )
        ],
      ),
    );
  }
}
