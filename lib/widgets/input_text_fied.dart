import 'package:flutter/material.dart';
import 'package:simple_banking/screens/sign_up_screen.dart';
import '../util/utils.dart';
import '../constant/colors.dart';

class InputTextField extends StatefulWidget {
  final String hintText;
  final ValueChanged onChanged;
  final bool isObscure;
  final TextInputType keyboard;
  final IconData icon;
  final SignUpInput userInputType;
  const InputTextField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.isObscure = false,
    this.keyboard = TextInputType.text,
    required this.icon, required this.userInputType,
  }) : super(key: key);

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends InputsFunction {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
    return TextFormField(
      keyboardType: widget.keyboard,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
        fontSize: SizeConfig.blockSizeHorizontal! * 5,
      ),
      onChanged: (e) => widget.onChanged(e),
      obscureText: widget.isObscure,
      validator: (value) {
        // if (value!.isEmpty ||
        //     value.contains(' ') ||
        //     value.contains('@') ||
        //     value.contains('.')) {
        //   return 'Invalid Username';
        // }
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
              widget.icon,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        hintText: widget.hintText,
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


abstract class InputsFunction extends State<InputTextField> {
  String hello = 'hello';
}