import 'package:flutter/material.dart';

import '../../../core/theme/news_app_colors.dart';

class SuggestionCardWidget extends StatelessWidget {
  SuggestionCardWidget({Key? key, required this.suggestionText, required this.onTap})
      : super(key: key);

  String suggestionText;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          color: NewsAppColors.lightBlue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(suggestionText),
          )
      ),
    );
  }
}