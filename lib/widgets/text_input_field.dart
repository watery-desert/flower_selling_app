import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final void Function(String value) onChange;
  final String? errorText;
  final bool obscureText;
  const TextInputField({
    Key? key,
    required this.hintText,
    required this.onChange,
    required this.errorText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(4, 8),
              ),
            ],
          ),
          child: TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            onChanged: onChange,
          ),
        ),
        errorText != null
            ? Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                child: Text(
                  errorText!,
                  style: TextStyle(
                    color: Theme.of(context).errorColor,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
