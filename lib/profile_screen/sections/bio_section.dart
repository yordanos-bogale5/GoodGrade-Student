import 'package:flutter/material.dart';

class BioSection extends StatelessWidget {
  const BioSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " software ",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 16),
        Text(
          " be better learn better ",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
