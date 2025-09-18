import 'package:flutter/material.dart';

class TitleMediumTitle extends StatelessWidget {
  const TitleMediumTitle({
    super.key,
    required this.title
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,style:Theme.of(context).textTheme.titleMedium,);
  }
}
