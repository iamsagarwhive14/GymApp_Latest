import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController myController;
  final FocusNode focusNode;
  final FormFieldSetter onFieldSubmittedValue;
  final FormFieldValidator onValidator;
  final TextInputType keyBoardType;
  final String hint;
  final bool obscureText;
  final bool enable, autoFocus;
  final IconData icon;

  const InputTextField({
    Key? key,
    required this.myController,
    required this.focusNode,
    required this.onFieldSubmittedValue,
    required this.onValidator,
    required this.keyBoardType,
    required this.hint,
    required this.obscureText,
    this.enable = true,
    this.autoFocus = false,
    this.icon = Icons.remove_red_eye_outlined,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: myController,
        focusNode: focusNode,
        obscureText: obscureText,
        onFieldSubmitted: onFieldSubmittedValue,
        validator: onValidator,
        keyboardType: keyBoardType,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              height: 0,
              fontSize: 19,
            ),
        decoration: InputDecoration(
          suffixIcon: Icon(icon),
          hintText: hint,
          enabled: enable,
          contentPadding: const EdgeInsets.all(17),
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(height: 0, color: Colors.grey),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlue),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
