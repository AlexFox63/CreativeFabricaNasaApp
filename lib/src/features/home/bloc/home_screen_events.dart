import 'package:equatable/equatable.dart';

sealed class HomeScreenEvent extends Equatable {}

final class HomeScreenFetchPhotosEvent extends HomeScreenEvent {
  @override
  List<Object?> get props => [];
}
