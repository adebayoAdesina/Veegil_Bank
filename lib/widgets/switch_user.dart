import 'package:flutter/material.dart';
import '../util/utils.dart';



class SwitchUser extends StatelessWidget {
  final String info;
  final String switchUser;
  final Function onTap;
  const SwitchUser({
    Key? key,
    required this.info,
    required this.switchUser,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            info,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
          ),
          GestureDetector(
            onTap: ()=> onTap(),
            child: Text(
              switchUser,
              style: TextStyle(color: Colors.blue,fontSize: SizeConfig.blockSizeHorizontal! * 3.5),
            ),
          )
        ],
      ),
    );
  }
}
