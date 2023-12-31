import 'package:flutter/material.dart';

Widget customTextField(
    {required String textLevel,
    Color? textColor,
    String? hintText,
    Color? backgroundColor,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    TextEditingController? controller,
    IconData? prefixIcon,
    IconData? suffixIcon,
      required bool obscureText,
    String? obscuringCharacter,
    required BuildContext context}) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.1,
    decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20)),
    child: Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 0),
          child: TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            validator: validator,
            obscuringCharacter: '*',
            obscureText: obscureText,
            onChanged: (val) {
              // setState(() {
              //   // isEmailCorrect = isEmail(val);
              // });
            },
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              prefixIcon: Icon(
                prefixIcon,
                color: Colors.green,
              ),
              suffixIcon: Icon(
                suffixIcon,
                color: Colors.green,
              ),
              filled: true,
              fillColor: Colors.transparent,
              labelText: textLevel,
              hintText: hintText,
              labelStyle:
                  TextStyle(color: textColor, fontWeight: FontWeight.bold),
              // suffixIcon: IconButton(
              //     onPressed: () {},
              //     icon: Icon(Icons.close,
              //         color: Colors.purple))
            ),
          ),
        ),
      ],
    ),
  );
}
