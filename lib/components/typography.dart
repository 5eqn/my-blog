import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal/components/color.dart';

// Simple
TextStyle headlineTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(
  fontSize: 32,
  color: textPrimary,
  letterSpacing: 1.5,
));

TextStyle headlineSecondaryTextStyle = GoogleFonts.montserrat(
    textStyle: const TextStyle(fontSize: 24.5, color: textPrimary));

TextStyle subtitleTextStyle = GoogleFonts.openSans(
    textStyle: const TextStyle(
  fontSize: 17,
  color: textSecondary,
  letterSpacing: 1,
));

TextStyle bodyTextStyle = GoogleFonts.openSans(
    textStyle: const TextStyle(fontSize: 17, color: textPrimary));

TextStyle codeTextStyle = GoogleFonts.jetBrainsMono(
    textStyle: const TextStyle(fontSize: 17, color: textPrimary));

TextStyle buttonTextStyle = GoogleFonts.montserrat(
    textStyle:
        const TextStyle(fontSize: 17, color: textPrimary, letterSpacing: 1));

// Advanced
// TODO: Add additional text styles.
