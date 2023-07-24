import 'package:flutter/material.dart';

class OrangeTextFormField extends StatefulWidget {
  final bool isPasswordField;
  final bool obscureText;
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const OrangeTextFormField({
    Key? key,
    this.isPasswordField = false,
    this.obscureText = false,
    required this.labelText,
    required this.controller,
    required this.keyboardType,
    required this.validator,
  }) : super(key: key);

  @override
  State<OrangeTextFormField> createState() => _OrangeTextFormFieldState();
}

class _OrangeTextFormFieldState extends State<OrangeTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.isPasswordField
          ? TextInputType.visiblePassword
          : widget.keyboardType,
      controller: widget.controller,
      cursorColor: Colors.orange,
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: Colors.orange,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.orange,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.red.shade700,
            width: 3,
            style: BorderStyle.solid,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.red.shade700,
            width: 3,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.orange,
            width: 3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 3,
          ),
        ),
        labelText: widget.labelText,
        errorMaxLines: 3,
        errorStyle: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 16,
          color: Colors.red.shade700,
        ),
        suffixIcon: widget.obscureText || widget.isPasswordField
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
      obscureText:
          !widget.isPasswordField && !widget.obscureText ? false : _obscureText,
      autocorrect: false,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
