import 'package:flutter/material.dart';

class BuildPage extends StatelessWidget {
  final String assetLink;
  final String title;
  const BuildPage({
    Key? key,
    required this.assetLink,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(assetLink),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      const  SizedBox(
          height: 80,
        )
      ],
    );
  }
}
