part of 'intro_cubit.dart';

  class IntroState {
  bool isLoading;
  bool isDone;

  IntroState({required this.isLoading, required this.isDone});

  factory IntroState.initial() =>
      IntroState(isLoading: true, isDone: false);

  IntroState copyWith({
    bool? isLoading,
    bool? isDone,
  }) =>
      IntroState(
        isLoading: isLoading ?? this.isLoading,
        isDone:  isDone ?? this.isDone,
      );
}

