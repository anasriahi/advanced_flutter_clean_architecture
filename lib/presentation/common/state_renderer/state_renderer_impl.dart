import 'package:advanced_flutter_clean_architecture/app/constants.dart';
import 'package:advanced_flutter_clean_architecture/presentation/common/state_renderer/state_renderer.dart';
import 'package:advanced_flutter_clean_architecture/presentation/resources/strings_manager.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();

  String getMessage();
}

// Loading State (POPUP, FULL SCREEN)
class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String? message;

  LoadingState({required this.stateRendererType, String message = AppStrings.loading});

  @override
  String getMessage() => message ?? AppStrings.loading;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// Error State (POPUP, FULL SCREEN)
class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// Content State
class ContentState extends FlowState {

  ContentState();

  @override
  String getMessage() => Constants.empty;

  @override
  StateRendererType getStateRendererType() => StateRendererType.contentState;
}

// Empty State
class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => StateRendererType.fullScreenEmptyState;
}