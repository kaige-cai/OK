import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../data/constant.dart';

class FunCarouseSlider extends StatefulWidget {
  const FunCarouseSlider({super.key});

  @override
  State<FunCarouseSlider> createState() => _FunCarouseSliderState();
}

class _FunCarouseSliderState extends State<FunCarouseSlider> {
  RewardedAd? _rewardedAd;

  final String _rewardAdUnitId =
      Platform.isAndroid ? 'ca-app-pub-9275143816186195/3111888542' : '';

  RewardedInterstitialAd? _rewardedInterstitialAd;

  final String _rewardIntersAdUnitId =
      Platform.isAndroid ? 'ca-app-pub-9275143816186195/3371116484' : '';

  @override
  void initState() {
    _loadRewardAd();
    _loadRewardIntersAd();
    super.initState();
  }

  void _loadRewardAd() {
    RewardedAd.load(
        adUnitId: _rewardAdUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
              // Called when the ad showed the full screen content.
              onAdShowedFullScreenContent: (ad) {},
              // Called when an impression occurs on the ad.
              onAdImpression: (ad) {},
              // Called when the ad failed to show full screen content.
              onAdFailedToShowFullScreenContent: (ad, err) {
                ad.dispose();
              },
              // Called when the ad dismissed full screen content.
              onAdDismissedFullScreenContent: (ad) {
                ad.dispose();
              },
              // Called when a click is recorded for an ad.
              onAdClicked: (ad) {});

          // Keep a reference to the ad so you can show it later.
          _rewardedAd = ad;
        }, onAdFailedToLoad: (LoadAdError error) {
          // ignore: avoid_print
          print('RewardedAd failed to load: $error');
        }));
  }

  void _loadRewardIntersAd() {
    RewardedInterstitialAd.load(
        adUnitId: _rewardIntersAdUnitId,
        request: const AdRequest(),
        rewardedInterstitialAdLoadCallback:
            RewardedInterstitialAdLoadCallback(onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
              // Called when the ad showed the full screen content.
              onAdShowedFullScreenContent: (ad) {},
              // Called when an impression occurs on the ad.
              onAdImpression: (ad) {},
              // Called when the ad failed to show full screen content.
              onAdFailedToShowFullScreenContent: (ad, err) {
                ad.dispose();
              },
              // Called when the ad dismissed full screen content.
              onAdDismissedFullScreenContent: (ad) {
                ad.dispose();
              },
              // Called when a click is recorded for an ad.
              onAdClicked: (ad) {});

          // Keep a reference to the ad so you can show it later.
          _rewardedInterstitialAd = ad;
        }, onAdFailedToLoad: (LoadAdError error) {
          // ignore: avoid_print
          print('RewardedInterstitialAd failed to load: $error');
        }));
  }

  @override
  void dispose() {
    _rewardedAd?.dispose();
    _rewardedInterstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageUrls.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return GestureDetector(
          onTap: () {
            switch (index) {
              case 0:
                _rewardedInterstitialAd?.show(
                    onUserEarnedReward:
                        (AdWithoutView view, RewardItem rewardItem) {});
                break;
              case 1:
                _rewardedAd?.show(
                  onUserEarnedReward:
                      (AdWithoutView ad, RewardItem rewardItem) {},
                );
                break;
              case 2:
                _rewardedAd?.show(
                  onUserEarnedReward:
                      (AdWithoutView ad, RewardItem rewardItem) {},
                );
                break;
              case 3:
                _rewardedAd?.show(
                  onUserEarnedReward:
                      (AdWithoutView ad, RewardItem rewardItem) {},
                );
                break;
              case 4:
                _rewardedAd?.show(
                  onUserEarnedReward:
                      (AdWithoutView ad, RewardItem rewardItem) {},
                );
                break;
              default:
                break;
            }
          },
          child: CachedNetworkImage(
            imageUrl: imageUrls[index],
            alignment: Alignment.center,
            fadeInCurve: Curves.easeIn,
            fadeOutCurve: Curves.easeOut,
            placeholder: (context, url) => const AspectRatio(
              aspectRatio: 1.0,
              child: CupertinoActivityIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        );
      },
      options: CarouselOptions(
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(milliseconds: 1400),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.ease,
        enlargeCenterPage: true,
      ),
    );
  }
}
