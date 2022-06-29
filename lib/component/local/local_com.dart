import 'package:flutter/material.dart';

Widget defaultFormField({
  required String label,
  required TextInputType keyboardType,
  required var controller,
   String? validateText,
  required IconData prefix,
   String? hint,
  IconData? sufix,
  VoidCallback? sufixpressed,
  bool obsecure = false,
  bool isPasswordField = false,
  ValueChanged? sub,
  FormFieldValidator<String>? vali
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obsecure ,
        onFieldSubmitted: sub,
        validator: vali,
        decoration: InputDecoration(
          errorStyle: TextStyle(
            color: Colors.white
          ),
          filled: true,
          focusColor: Colors.black,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
           hintText: label,
          prefixIcon: Icon(prefix),
          suffixIcon: sufix != null ? IconButton(icon: Icon(sufix), onPressed: sufixpressed
          ) : null,
        ),
      ),
    );


Widget defaultButton({
  required String title,
  required VoidCallback? pressed,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SizedBox(
        width: double.infinity,
        height: 40.0,
        child: MaterialButton(
          onPressed: pressed,
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
          ),
          color: const Color(0xFF203239),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
      ),
    );
