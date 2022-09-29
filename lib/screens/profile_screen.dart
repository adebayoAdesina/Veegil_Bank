import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_banking/constant/colors.dart';
import '../util/utils.dart';
import '../widgets/profile_list_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: uHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            uSafeAreaSizedBox,
            uSafeAreaSizedBox,
            Text(
              'My Account',
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
                color:
                    Theme.of(context).colorScheme.onSecondary.withOpacity(0.75),
              ),
            ),
            uLogSizedBoxH(),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              // child: CachedNetworkImage(imageUrl: ),
            ),
            uLogSizedBoxH(),
            GestureDetector(
              onTap: (() => context.read<AppColor>().changeColor()),
              child: Container(
                height: 30,
                width: 30,
                color: Colors.red,
              ),
            ),
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return const ProfileListCard();
              },
            )
          ],
        ),
      ),
    );
  }
}


