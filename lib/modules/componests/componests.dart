import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.black,
  bool isUpprCsae = true,
  double radius = 0.0,
  required String text,
  required Function function,
}) =>
    Container(
        width: width,
        height: 50.0,
        child: MaterialButton(
          onPressed: () {
            function();
          },
          child: Text(
            isUpprCsae ? text.toUpperCase() : text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            radius,
          ),
          color: background,
        ));

Widget defoultbTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String? value) validate,
  required String label,
  required IconData prifix,
  bool isPassword = false,
  IconData? suffix,
  Function? suffixPresert,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      validator: (String? value) => validate(value),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prifix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPresert!();
                },
                icon: Icon(suffix))
            : null,
        border: const OutlineInputBorder(),
      ),
    );
