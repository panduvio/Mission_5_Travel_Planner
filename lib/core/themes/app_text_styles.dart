import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // === HEADINGS ===
  static final TextStyle h1 = GoogleFonts.urbanist(
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle h2 = GoogleFonts.urbanist(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle h3 = GoogleFonts.urbanist(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  // === BODIES ===
  static final TextStyle bodyLarge = GoogleFonts.urbanist(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle bodyMedium = GoogleFonts.urbanist(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle bodySmall = GoogleFonts.urbanist(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  // === LABELS ===
  static final TextStyle labelMedium = GoogleFonts.urbanist(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle labelLarge = GoogleFonts.urbanist(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  // === BUTTON ===
  static final TextStyle button = GoogleFonts.urbanist(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}
