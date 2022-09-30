import 'package:flutter/material.dart';

class TransactionAlert extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function noFunction;
  final Function yesFunction;

  const TransactionAlert(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.noFunction,
      required this.yesFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(subTitle),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(3),
              ),
              onPressed: () => noFunction(),
              icon: const Icon(
                Icons.remove,
                color: Colors.red,
              ),
              label: const Text(
                'No',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(3),
              ),
              onPressed: () => yesFunction(),
              icon: const Icon(
                Icons.done,
                color: Colors.green,
              ),
              label: const Text(
                'Yes',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
