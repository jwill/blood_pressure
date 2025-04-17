import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4287580752),
      surfaceTint: Color(4287580752),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294957787),
      onPrimaryContainer: Color(4285674297),
      secondary: Color(4284242065),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293124095),
      onSecondaryContainer: Color(4282663032),
      tertiary: Color(4284899348),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4293846412),
      onTertiaryContainer: Color(4283254784),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4287823882),
      surface: Color(4294965495),
      onSurface: Color(4280424730),
      onSurfaceVariant: Color(4283581252),
      outline: Color(4286935923),
      outlineVariant: Color(4292329922),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281871918),
      inversePrimary: Color(4294947511),
      primaryFixed: Color(4294957787),
      onPrimaryFixed: Color(4282058769),
      primaryFixedDim: Color(4294947511),
      onPrimaryFixedVariant: Color(4285674297),
      secondaryFixed: Color(4293124095),
      onSecondaryFixed: Color(4279767626),
      secondaryFixedDim: Color(4291150079),
      onSecondaryFixedVariant: Color(4282663032),
      tertiaryFixed: Color(4293846412),
      onTertiaryFixed: Color(4280228864),
      tertiaryFixedDim: Color(4291938675),
      onTertiaryFixedVariant: Color(4283254784),
      surfaceDim: Color(4293383894),
      surfaceBright: Color(4294965495),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963440),
      surfaceContainer: Color(4294765290),
      surfaceContainerHigh: Color(4294370532),
      surfaceContainerHighest: Color(4293975774),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4284359466),
      surfaceTint: Color(4287580752),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4288698462),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281544550),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285228705),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282070784),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285886243),
      onTertiaryContainer: Color(4294967295),
      error: Color(4285792262),
      onError: Color(4294967295),
      errorContainer: Color(4291767335),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965495),
      onSurface: Color(4279701263),
      onSurfaceVariant: Color(4282463027),
      outline: Color(4284370767),
      outlineVariant: Color(4286212457),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281871918),
      inversePrimary: Color(4294947511),
      primaryFixed: Color(4288698462),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4286791751),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285228705),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283584135),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285886243),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4284241417),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292068291),
      surfaceBright: Color(4294965495),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963440),
      surfaceContainer: Color(4294370532),
      surfaceContainerHigh: Color(4293581273),
      surfaceContainerHighest: Color(4292857550),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4283504928),
      surfaceTint: Color(4287580752),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285871420),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280886619),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282860154),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281412864),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283452160),
      onTertiaryContainer: Color(4294967295),
      error: Color(4284481540),
      onError: Color(4294967295),
      errorContainer: Color(4288151562),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965495),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4278190080),
      outline: Color(4281739561),
      outlineVariant: Color(4283778374),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281871918),
      inversePrimary: Color(4294947511),
      primaryFixed: Color(4285871420),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4284030758),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282860154),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281346914),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283452160),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281873408),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4291147189),
      surfaceBright: Color(4294965495),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294962669),
      surfaceContainer: Color(4293975774),
      surfaceContainerHigh: Color(4293054672),
      surfaceContainerHighest: Color(4292068291),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294947511),
      surfaceTint: Color(4294947511),
      onPrimary: Color(4283833636),
      primaryContainer: Color(4285674297),
      onPrimaryContainer: Color(4294957787),
      secondary: Color(4291150079),
      onSecondary: Color(4281149792),
      secondaryContainer: Color(4282663032),
      onSecondaryContainer: Color(4293124095),
      tertiary: Color(4291938675),
      onTertiary: Color(4281676032),
      tertiaryContainer: Color(4283254784),
      onTertiaryContainer: Color(4293846412),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279898386),
      onSurface: Color(4293975774),
      onSurfaceVariant: Color(4292329922),
      outline: Color(4288646285),
      outlineVariant: Color(4283581252),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293975774),
      inversePrimary: Color(4287580752),
      primaryFixed: Color(4294957787),
      onPrimaryFixed: Color(4282058769),
      primaryFixedDim: Color(4294947511),
      onPrimaryFixedVariant: Color(4285674297),
      secondaryFixed: Color(4293124095),
      onSecondaryFixed: Color(4279767626),
      secondaryFixedDim: Color(4291150079),
      onSecondaryFixedVariant: Color(4282663032),
      tertiaryFixed: Color(4293846412),
      onTertiaryFixed: Color(4280228864),
      tertiaryFixedDim: Color(4291938675),
      onTertiaryFixedVariant: Color(4283254784),
      surfaceDim: Color(4279898386),
      surfaceBright: Color(4282464055),
      surfaceContainerLowest: Color(4279503885),
      surfaceContainerLow: Color(4280424730),
      surfaceContainer: Color(4280753438),
      surfaceContainerHigh: Color(4281411624),
      surfaceContainerHighest: Color(4282200627),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294955475),
      surfaceTint: Color(4294947511),
      onPrimary: Color(4282913306),
      primaryContainer: Color(4291459712),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4292729087),
      onSecondary: Color(4280426068),
      secondaryContainer: Color(4287597255),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293451654),
      onTertiary: Color(4280952320),
      tertiaryContainer: Color(4288320323),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294955724),
      onError: Color(4283695107),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279898386),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4293842903),
      outline: Color(4290948525),
      outlineVariant: Color(4288646284),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293975774),
      inversePrimary: Color(4285805626),
      primaryFixed: Color(4294957787),
      onPrimaryFixed: Color(4281073671),
      primaryFixedDim: Color(4294947511),
      onPrimaryFixedVariant: Color(4284359466),
      secondaryFixed: Color(4293124095),
      onSecondaryFixed: Color(4279043392),
      secondaryFixedDim: Color(4291150079),
      onSecondaryFixedVariant: Color(4281544550),
      tertiaryFixed: Color(4293846412),
      onTertiaryFixed: Color(4279439872),
      tertiaryFixedDim: Color(4291938675),
      onTertiaryFixedVariant: Color(4282070784),
      surfaceDim: Color(4279898386),
      surfaceBright: Color(4283253314),
      surfaceContainerLowest: Color(4279043590),
      surfaceContainerLow: Color(4280556316),
      surfaceContainer: Color(4281279782),
      surfaceContainerHigh: Color(4282003504),
      surfaceContainerHighest: Color(4282792763),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294962412),
      surfaceTint: Color(4294947511),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294946226),
      onPrimaryContainer: Color(4280352772),
      secondary: Color(4294110975),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290886908),
      onSecondaryContainer: Color(4278648889),
      tertiary: Color(4294767512),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4291675503),
      onTertiaryContainer: Color(4279045120),
      error: Color(4294962409),
      onError: Color(4278190080),
      errorContainer: Color(4294946468),
      onErrorContainer: Color(4280418305),
      surface: Color(4279898386),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294967295),
      outline: Color(4294962412),
      outlineVariant: Color(4292067006),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293975774),
      inversePrimary: Color(4285805626),
      primaryFixed: Color(4294957787),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294947511),
      onPrimaryFixedVariant: Color(4281073671),
      secondaryFixed: Color(4293124095),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291150079),
      onSecondaryFixedVariant: Color(4279043392),
      tertiaryFixed: Color(4293846412),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4291938675),
      onTertiaryFixedVariant: Color(4279439872),
      surfaceDim: Color(4279898386),
      surfaceBright: Color(4284042573),
      surfaceContainerLowest: Color(4278190080),
      surfaceContainerLow: Color(4280753438),
      surfaceContainer: Color(4281871918),
      surfaceContainerHigh: Color(4282661177),
      surfaceContainerHighest: Color(4283450436),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );

  /// Good
  static const good = ExtendedColor(
    seed: Color(4278228316),
    value: Color(4278228316),
    light: ColorFamily(
      color: Color(Color(alpha: 1.0000, red: 0.1608, green: 0.4157, blue: 0.2784, colorSpace: ColorSpace.sRGB)),
      onColor: Color(Color(alpha: 1.0000, red: 1.0000, green: 1.0000, blue: 1.0000, colorSpace: ColorSpace.sRGB)),
      colorContainer: Color(Color(alpha: 1.0000, red: 0.6824, green: 0.9490, blue: 0.7765, colorSpace: ColorSpace.sRGB)),
      onColorContainer: Color(Color(alpha: 1.0000, red: 0.0314, green: 0.3216, blue: 0.1922, colorSpace: ColorSpace.sRGB)),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(Color(alpha: 1.0000, red: 0.1608, green: 0.4157, blue: 0.2784, colorSpace: ColorSpace.sRGB)),
      onColor: Color(Color(alpha: 1.0000, red: 1.0000, green: 1.0000, blue: 1.0000, colorSpace: ColorSpace.sRGB)),
      colorContainer: Color(Color(alpha: 1.0000, red: 0.6824, green: 0.9490, blue: 0.7765, colorSpace: ColorSpace.sRGB)),
      onColorContainer: Color(Color(alpha: 1.0000, red: 0.0314, green: 0.3216, blue: 0.1922, colorSpace: ColorSpace.sRGB)),
    ),
    lightHighContrast: ColorFamily(
      color: Color(Color(alpha: 1.0000, red: 0.1608, green: 0.4157, blue: 0.2784, colorSpace: ColorSpace.sRGB)),
      onColor: Color(Color(alpha: 1.0000, red: 1.0000, green: 1.0000, blue: 1.0000, colorSpace: ColorSpace.sRGB)),
      colorContainer: Color(Color(alpha: 1.0000, red: 0.6824, green: 0.9490, blue: 0.7765, colorSpace: ColorSpace.sRGB)),
      onColorContainer: Color(Color(alpha: 1.0000, red: 0.0314, green: 0.3216, blue: 0.1922, colorSpace: ColorSpace.sRGB)),
    ),
    dark: ColorFamily(
      color: Color(Color(alpha: 1.0000, red: 0.5725, green: 0.8353, blue: 0.6706, colorSpace: ColorSpace.sRGB)),
      onColor: Color(Color(alpha: 1.0000, red: 0.0000, green: 0.2235, blue: 0.1255, colorSpace: ColorSpace.sRGB)),
      colorContainer: Color(Color(alpha: 1.0000, red: 0.0314, green: 0.3216, blue: 0.1922, colorSpace: ColorSpace.sRGB)),
      onColorContainer: Color(Color(alpha: 1.0000, red: 0.6824, green: 0.9490, blue: 0.7765, colorSpace: ColorSpace.sRGB)),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(Color(alpha: 1.0000, red: 0.5725, green: 0.8353, blue: 0.6706, colorSpace: ColorSpace.sRGB)),
      onColor: Color(Color(alpha: 1.0000, red: 0.0000, green: 0.2235, blue: 0.1255, colorSpace: ColorSpace.sRGB)),
      colorContainer: Color(Color(alpha: 1.0000, red: 0.0314, green: 0.3216, blue: 0.1922, colorSpace: ColorSpace.sRGB)),
      onColorContainer: Color(Color(alpha: 1.0000, red: 0.6824, green: 0.9490, blue: 0.7765, colorSpace: ColorSpace.sRGB)),
    ),
    darkHighContrast: ColorFamily(
      color: Color(Color(alpha: 1.0000, red: 0.5725, green: 0.8353, blue: 0.6706, colorSpace: ColorSpace.sRGB)),
      onColor: Color(Color(alpha: 1.0000, red: 0.0000, green: 0.2235, blue: 0.1255, colorSpace: ColorSpace.sRGB)),
      colorContainer: Color(Color(alpha: 1.0000, red: 0.0314, green: 0.3216, blue: 0.1922, colorSpace: ColorSpace.sRGB)),
      onColorContainer: Color(Color(alpha: 1.0000, red: 0.6824, green: 0.9490, blue: 0.7765, colorSpace: ColorSpace.sRGB)),
    ),
  );

  /// Warning
  static const warning = ExtendedColor(
    seed: Color(4293975063),
    value: Color(4293975063),
    light: ColorFamily(
      color: Color(Color(alpha: 1.0000, red: 0.4078, green: 0.3725, blue: 0.0706, colorSpace: ColorSpace.sRGB)),
      onColor: Color(Color(alpha: 1.0000, red: 1.0000, green: 1.0000, blue: 1.0000, colorSpace: ColorSpace.sRGB)),
      colorContainer: Color(Color(alpha: 1.0000, red: 0.9451, green: 0.8941, blue: 0.5412, colorSpace: ColorSpace.sRGB)),
      onColorContainer: Color(Color(alpha: 1.0000, red: 0.3098, green: 0.2824, blue: 0.0000, colorSpace: ColorSpace.sRGB)),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(Color(alpha: 1.0000, red: 0.4078, green: 0.3725, blue: 0.0706, colorSpace: ColorSpace.sRGB)),
      onColor: Color(Color(alpha: 1.0000, red: 1.0000, green: 1.0000, blue: 1.0000, colorSpace: ColorSpace.sRGB)),
      colorContainer: Color(Color(alpha: 1.0000, red: 0.9451, green: 0.8941, blue: 0.5412, colorSpace: ColorSpace.sRGB)),
      onColorContainer: Color(Color(alpha: 1.0000, red: 0.3098, green: 0.2824, blue: 0.0000, colorSpace: ColorSpace.sRGB)),
    ),
    lightHighContrast: ColorFamily(
      color: Color(Color(alpha: 1.0000, red: 0.4078, green: 0.3725, blue: 0.0706, colorSpace: ColorSpace.sRGB)),
      onColor: Color(Color(alpha: 1.0000, red: 1.0000, green: 1.0000, blue: 1.0000, colorSpace: ColorSpace.sRGB)),
      colorContainer: Color(Color(alpha: 1.0000, red: 0.9451, green: 0.8941, blue: 0.5412, colorSpace: ColorSpace.sRGB)),
      onColorContainer: Color(Color(alpha: 1.0000, red: 0.3098, green: 0.2824, blue: 0.0000, colorSpace: ColorSpace.sRGB)),
    ),
    dark: ColorFamily(
      color: Color(Color(alpha: 1.0000, red: 0.8314, green: 0.7843, blue: 0.4431, colorSpace: ColorSpace.sRGB)),
      onColor: Color(Color(alpha: 1.0000, red: 0.2118, green: 0.1922, blue: 0.0000, colorSpace: ColorSpace.sRGB)),
      colorContainer: Color(Color(alpha: 1.0000, red: 0.3098, green: 0.2824, blue: 0.0000, colorSpace: ColorSpace.sRGB)),
      onColorContainer: Color(Color(alpha: 1.0000, red: 0.9451, green: 0.8941, blue: 0.5412, colorSpace: ColorSpace.sRGB)),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(Color(alpha: 1.0000, red: 0.8314, green: 0.7843, blue: 0.4431, colorSpace: ColorSpace.sRGB)),
      onColor: Color(Color(alpha: 1.0000, red: 0.2118, green: 0.1922, blue: 0.0000, colorSpace: ColorSpace.sRGB)),
      colorContainer: Color(Color(alpha: 1.0000, red: 0.3098, green: 0.2824, blue: 0.0000, colorSpace: ColorSpace.sRGB)),
      onColorContainer: Color(Color(alpha: 1.0000, red: 0.9451, green: 0.8941, blue: 0.5412, colorSpace: ColorSpace.sRGB)),
    ),
    darkHighContrast: ColorFamily(
      color: Color(Color(alpha: 1.0000, red: 0.8314, green: 0.7843, blue: 0.4431, colorSpace: ColorSpace.sRGB)),
      onColor: Color(Color(alpha: 1.0000, red: 0.2118, green: 0.1922, blue: 0.0000, colorSpace: ColorSpace.sRGB)),
      colorContainer: Color(Color(alpha: 1.0000, red: 0.3098, green: 0.2824, blue: 0.0000, colorSpace: ColorSpace.sRGB)),
      onColorContainer: Color(Color(alpha: 1.0000, red: 0.9451, green: 0.8941, blue: 0.5412, colorSpace: ColorSpace.sRGB)),
    ),
  );


  List<ExtendedColor> get extendedColors => [
    good,
    warning,
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
