import 'package:get/get.dart';

import '../../models/expert_model.dart';
import '../../models/signs_model.dart';
import '../../models/zodiac_live_model.dart';

class HomeController extends GetxController {
  List<SignModel> sign = [
    SignModel(name: 'Match Making', image: 'assets/signs/match.svg'),
    SignModel(name: 'Subh Muhurth', image: 'assets/signs/subh.svg'),
    SignModel(name: 'Horoscope', image: 'assets/signs/horoscope.svg'),
    SignModel(name: 'Kundali', image: 'assets/signs/kundali.svg'),
    SignModel(name: 'Match Making', image: 'assets/signs/match.svg'),
    SignModel(name: 'Subh Muhurth', image: 'assets/signs/subh.svg'),
    SignModel(name: 'Horoscope', image: 'assets/signs/horoscope.svg'),
  ];

  // Dummy Data for LiveZodiacCard
  List<LiveZodiacCardModel> liveZodiacData = [
    LiveZodiacCardModel(
      title: 'Explore your zodiac and cosmic insights live!',
      userName: 'Rakesh Kaushik',
      userImagePath: 'assets/signs/match.svg',
      isNetworkImage: false,
      viewsCount: '13k',
    ),
    LiveZodiacCardModel(
      title: 'Explore your zodiac and cosmic insights live!',
      userName: 'Rakesh Kaushik',
      userImagePath: 'assets/signs/subh.svg',
      isNetworkImage: false,
      viewsCount: '12k',
    ),
    // Add more dummy data as needed
  ];

  List<ExpertCardModel> expertCardData = [
    ExpertCardModel(
      name: 'Rakesh Kaushik',
      rating: 4.7,
      experienceYears: 10,
      pricePerMin: 10,
      originalPrice: 20,
      isOnline: true,
    ),
    ExpertCardModel(
      name: 'Anita Sharma',
      rating: 4.9,
      experienceYears: 12,
      pricePerMin: 15,
      originalPrice: 25,
      isOnline: false,
    ),
    ExpertCardModel(
      name: 'Sunil Verma',
      rating: 4.6,
      experienceYears: 8,
      pricePerMin: 12,
      isOnline: true,
    ),
    ExpertCardModel(
      name: 'Rakesh Kaushik',
      rating: 4.7,
      experienceYears: 10,
      pricePerMin: 10,
      originalPrice: 20,
      isOnline: true,
    ),
    ExpertCardModel(
      name: 'Anita Sharma',
      rating: 4.9,
      experienceYears: 12,
      pricePerMin: 15,
      originalPrice: 25,
      isOnline: false,
    ),
    ExpertCardModel(
      name: 'Sunil Verma',
      rating: 4.6,
      experienceYears: 8,
      pricePerMin: 12,
      isOnline: true,
    ),
  ];

  @override
  void onReady() {
    super.onReady();
  }
}
