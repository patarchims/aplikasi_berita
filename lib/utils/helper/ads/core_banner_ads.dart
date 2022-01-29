import 'package:flutter/foundation.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

String get nativeAdUnitId {
  /// Always test with test ads
  if (kDebugMode) {
    return MobileAds.nativeAdTestUnitId;
  } else {
    return 'your-native-ad-unit-id';
  }
}

String get bannerAdUnitId {
  /// Always test with test ads
  if (kDebugMode) {
    return MobileAds.bannerAdTestUnitId;
  } else {
    return 'ca-app-pub-1108707655570935/6682146274';
  }
}

String get interstitialAdUnitId {
  /// Always test with test ads
  if (kDebugMode) {
    return MobileAds.interstitialAdTestUnitId;
  } else {
    return 'ca-app-pub-1108707655570935/2511545906';
  }
}

String get rewardedAdUnitId {
  /// Always test with test ads
  if (kDebugMode) {
    return MobileAds.rewardedAdTestUnitId;
  } else {
    return 'ca-app-pub-1108707655570935/5035629283';
  }
}

String get appOpenAdUnitId {
  /// Always test with test ads
  if (kDebugMode) {
    return MobileAds.appOpenAdTestUnitId;
  } else {
    return 'you-app-open-ad-unit-id';
  }
}

String get rewardedInterstitialAdUnitId {
  /// Always test with test ads
  if (kDebugMode) {
    return MobileAds.rewardedInterstitialAdTestUnitId;
  } else {
    return 'you-interstitial-ad-unit-id';
  }
}
