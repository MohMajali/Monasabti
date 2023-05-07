import 'package:flutter/material.dart';

const assetImages = 'assets/images/';
const assetIcons = 'assets/icons/';
const assetFonts = 'assets/fonts/';

const Color wColor = Colors.white;
const Color bColor = Colors.black;
const Color pColor = Color(0XFF0C84FF);

//====================================================

const Color darkBlue = Color(0XFF0E478A);
const Color lightblue = Color(0XFF135FB7);
const Color white = Color(0XFFEDEDED);
const Color offWhite = Color(0XFFFFFFFF);

InputDecoration decoration(
    {required String labelText, required String hintText, required Icon icon}) {
  return InputDecoration(
    // labelText: labelText,
    label: Text(
      labelText,
      style: const TextStyle(color: lightblue, fontSize: 20),
    ),
    hintText: hintText,
    hintStyle: const TextStyle(fontSize: 20, color: lightblue),
    errorMaxLines: 3,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    suffixIcon: icon,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100.0),
      borderSide: const BorderSide(color: lightblue),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100.0),
      borderSide: const BorderSide(color: lightblue),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100.0),
      borderSide: const BorderSide(color: Colors.red, width: 2.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100.0),
      borderSide: const BorderSide(color: Colors.red, width: 2.0),
    ),
  );
}

Container button({required String text, required VoidCallback press}) {
  return Container(
    width: double.infinity,
    height: 40,
    padding: const EdgeInsets.only(left: 20, right: 20),
    margin: const EdgeInsets.only(top: 10),
    child: TextButton(
      onPressed: press,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: const BorderSide(color: lightblue))),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, color: lightblue),
      ),
    ),
  );
}

Row divider() {
  return Row(children: [
    Expanded(
      child: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: const Divider(
            color: darkBlue,
            thickness: 2,
          )),
    ),
    const Text("OR"),
    Expanded(
      child: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: const Divider(
            color: darkBlue,
            thickness: 2,
          )),
    ),
  ]);
}

SizedBox imageLogo() {
  return SizedBox(
    height: 200,
    width: double.infinity,
    child: Image.asset(
      "${assetImages}Monasbati_png.png",
      fit: BoxFit.contain,
    ),
  );
}
