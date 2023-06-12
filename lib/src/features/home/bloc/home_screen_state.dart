import 'package:equatable/equatable.dart';

import '../../../domain/entities/photo.dart';

sealed class HomeScreenState extends Equatable {}

final class HomeScreenInitialState extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

final class HomeScreenLoadingState extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

final class HomeScreenLoadedState extends HomeScreenState {
  final List<Photo>? photos;

  HomeScreenLoadedState({required this.photos});

  @override
  List<Object?> get props => [photos];
}

final class HomeScreenErrorState extends HomeScreenState {
  final String errorMessage;

  HomeScreenErrorState(this.errorMessage);

  @override
  List<Object?> get props => [];
}
