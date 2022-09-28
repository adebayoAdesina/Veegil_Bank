import 'package:flutter/material.dart';
import '../util/utils.dart';
import '../constant/colors.dart';

class InputTextField extends StatelessWidget {
  final String hintText;
  final ValueChanged onSaved;
  final bool isObscure;
  final TextInputType keyboard;
  final IconData icon;
  const InputTextField({
    Key? key,
    required this.hintText,
    required this.onSaved,
    this.isObscure = false,
    this.keyboard = TextInputType.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextFormField(
      keyboardType: keyboard,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
        fontSize: SizeConfig.blockSizeHorizontal! * 5,
      ),
      onSaved: (e) => onSaved,
      obscureText: isObscure,
      validator: (value) {
        if (value!.isEmpty ||
            value.contains(' ') ||
            value.contains('@') ||
            value.contains('.')) {
          return 'Invalid Username';
        }
      },
      decoration: InputDecoration(
        fillColor: AppColor().kGrayThreeColor.withOpacity(0.5),
        filled: true,
        prefixIcon: Container(
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              border: Border(
            right: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.primary,
            ),
          )),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor().kGrayOneColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor().kGrayOneColor,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
          fontSize: SizeConfig.blockSizeHorizontal! * 5,
        ),
      ),
    );
  }
}
