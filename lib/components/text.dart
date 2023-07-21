import 'package:flutter/material.dart';
import 'package:minimal/components/spacing.dart';
import 'package:minimal/components/typography.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/github.dart';

import 'color.dart';

class CodeBody extends StatelessWidget {
  final String code;
  final String lang;

  const CodeBody({Key? key, required this.code, required this.lang})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: marginBottom24,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: HighlightView(
              // The original code to be highlighted
              code,

              // Specify language
              // It is recommended to give it a value for performance
              language: lang,

              // Specify highlight theme
              // All available themes are listed in `themes` folder
              theme: githubTheme,

              // Specify padding
              padding: const EdgeInsets.all(12),

              // Specify text style
              textStyle: codeTextStyle,
            )));
  }
}

class TextBody extends StatelessWidget {
  final String text;

  const TextBody({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginBottom24,
      child: Text(
        text,
        style: bodyTextStyle,
      ),
    );
  }
}

class TextBodySecondary extends StatelessWidget {
  final String text;

  const TextBodySecondary({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginBottom40,
      child: Text(
        text,
        style: subtitleTextStyle,
      ),
    );
  }
}

class TextHeadlineSecondary extends StatelessWidget {
  final String text;

  const TextHeadlineSecondary({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginBottom24,
      child: Text(
        text,
        style: headlineSecondaryTextStyle,
      ),
    );
  }
}

class TextBlockquote extends StatelessWidget {
  final String text;

  const TextBlockquote({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginBottom24,
      decoration: const BoxDecoration(
          border: Border(left: BorderSide(width: 2, color: Color(0xFF333333)))),
      padding: const EdgeInsets.only(left: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: bodyTextStyle,
        ),
      ),
    );
  }
}

ButtonStyle? menuButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.transparent,
    onSurface: null,
    primary: textSecondary,
    textStyle: buttonTextStyle,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16));
