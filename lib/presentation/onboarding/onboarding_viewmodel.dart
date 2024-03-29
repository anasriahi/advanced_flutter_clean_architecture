import 'dart:async';

import 'package:advanced_flutter_clean_architecture/domain/model/models.dart';
import 'package:advanced_flutter_clean_architecture/presentation/base/baseviewmodel.dart';

import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream controller outputs
  final StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  // OnBoarding ViewModel inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    // view model start your job
    _list = _getSliderObject();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // onboarding private functions
  void _postDataToView() {
    inputSliderViewObject.add(SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }

  List<SliderObject> _getSliderObject() => [
    SliderObject(AppStrings.onBoardingSubTitle1,
        AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
    SliderObject(AppStrings.onBoardingSubTitle2,
        AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
    SliderObject(AppStrings.onBoardingSubTitle3,
        AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
    SliderObject(AppStrings.onBoardingSubTitle4,
        AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4)
  ];
}

// inputs mean that "Orders" that our view model will receive from view
abstract mixin class OnBoardingViewModelInputs {
  int goNext(); // when user clicks on right arrow or swipe left
  int goPrevious(); // when user clicks on left arrow or swipe right
  void onPageChanged(int index);

  // Strem controller input
  Sink get inputSliderViewObject;
}

abstract mixin class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}