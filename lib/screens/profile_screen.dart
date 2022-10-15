import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_data.dart';
import '../util/utils.dart';
import '../widgets/profile_list_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List _profileCards = [
    'Profile',
    'Log Out',
  ];

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AppData>().user;
    String _url =
        'https://img.freepik.com/free-vector/hand-holding-phone-with-digital-wallet-service-sending-money-payment-transaction-transfer-through-mobile-app-flat-illustration_74855-20589.jpg?w=1060&t=st=1664491980~exp=1664492580~hmac=e73ef0d2b7f2da44a7f5d9d288511f0f6a5fa9d6ab11af9f3881ab88ae416c1a';
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: uHorizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              uSafeAreaSizedBox,
              uSafeAreaSizedBox,
              Text(
                'My Account',
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal! * 6.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              Text(
                user.number.toString(),
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
                  // color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Opacity(
                    opacity: 0.8,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      imageUrl: _url,
                    ),
                  ),
                ),
              ),
              uLogSizedBoxH(),
              uLogSizedBoxH(),
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return ProfileListCard(
                    text: _profileCards[index],
                    isLogOut: index == 1 ? true : false,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
