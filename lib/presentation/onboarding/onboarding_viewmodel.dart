import 'dart:async';

import 'package:advanced_flutter_clean_architecture/domain/models.dart';
import 'package:advanced_flutter_clean_architecture/presentation/base/baseviewmodel.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream controller outputs
  StreamController streamController = StreamController<SliderViewObject>();

  // OnBoarding ViewModel inputs
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => throw UnimplementedError();

  @override
  // TODO: implement outputSliderViewObject
  Stream get outputSliderViewObject => throw UnimplementedError();
}

// inputs mean that "Orders" that our view model will receive from view
abstract class OnBoardingViewModelInputs {
  void goNext(); // when user clicks on right arrow or swipe left
  void goPrevious(); // when user clicks on left arrow or swipe right
  void onPageChanged(int index);

  // Strem controller input
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream get outputSliderViewObject;
}