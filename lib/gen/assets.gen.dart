/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/arrow-left.png
  AssetGenImage get arrowLeft =>
      const AssetGenImage('assets/images/arrow-left.png');

  /// File path: assets/images/calendar.png
  AssetGenImage get calendar =>
      const AssetGenImage('assets/images/calendar.png');

  /// File path: assets/images/circular_question_mark.png
  AssetGenImage get circularQuestionMark =>
      const AssetGenImage('assets/images/circular_question_mark.png');

  /// File path: assets/images/courses.png
  AssetGenImage get courses => const AssetGenImage('assets/images/courses.png');

  /// File path: assets/images/dismiss.png
  AssetGenImage get dismiss => const AssetGenImage('assets/images/dismiss.png');

  /// File path: assets/images/down-arrow.png
  AssetGenImage get downArrow =>
      const AssetGenImage('assets/images/down-arrow.png');

  /// File path: assets/images/drawer.png
  AssetGenImage get drawer => const AssetGenImage('assets/images/drawer.png');

  /// File path: assets/images/error_mark.png
  AssetGenImage get errorMark =>
      const AssetGenImage('assets/images/error_mark.png');

  /// File path: assets/images/filter.png
  AssetGenImage get filter => const AssetGenImage('assets/images/filter.png');

  /// File path: assets/images/home.png
  AssetGenImage get home => const AssetGenImage('assets/images/home.png');

  /// File path: assets/images/indian_rupee.png
  AssetGenImage get indianRupee =>
      const AssetGenImage('assets/images/indian_rupee.png');

  /// File path: assets/images/internshala_splash_screen.jpg
  AssetGenImage get internshalaSplashScreen =>
      const AssetGenImage('assets/images/internshala_splash_screen.jpg');

  /// File path: assets/images/internship.png
  AssetGenImage get internship =>
      const AssetGenImage('assets/images/internship.png');

  /// File path: assets/images/job.png
  AssetGenImage get job => const AssetGenImage('assets/images/job.png');

  /// File path: assets/images/location.png
  AssetGenImage get location =>
      const AssetGenImage('assets/images/location.png');

  /// File path: assets/images/money.png
  AssetGenImage get money => const AssetGenImage('assets/images/money.png');

  /// File path: assets/images/no_data.png
  AssetGenImage get noData => const AssetGenImage('assets/images/no_data.png');

  /// File path: assets/images/start.png
  AssetGenImage get start => const AssetGenImage('assets/images/start.png');

  /// File path: assets/images/upward_sign.png
  AssetGenImage get upwardSign =>
      const AssetGenImage('assets/images/upward_sign.png');

  /// File path: assets/images/watch.png
  AssetGenImage get watch => const AssetGenImage('assets/images/watch.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        arrowLeft,
        calendar,
        circularQuestionMark,
        courses,
        dismiss,
        downArrow,
        drawer,
        errorMark,
        filter,
        home,
        indianRupee,
        internshalaSplashScreen,
        internship,
        job,
        location,
        money,
        noData,
        start,
        upwardSign,
        watch
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
