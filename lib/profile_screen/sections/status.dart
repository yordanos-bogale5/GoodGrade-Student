import 'package:flutter/material.dart';

class StatusSection extends StatelessWidget {
  const StatusSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        children: [
          Text(
            "23",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          Text("AGE ", style: Theme.of(context).textTheme.headlineSmall),
        ],
      ),
      Column(
        children: [
          Text(
            "16",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          Text("Buy BOOKS", style: Theme.of(context).textTheme.headlineSmall),
        ],
      ),
      Column(
        children: [
          Text(
            "15 €",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "TOTAL COST",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    ]);
  }
}
