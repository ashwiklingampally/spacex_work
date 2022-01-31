part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class LaunchLoadInProgress extends HomeState {}

class LaunchLoadSuccess extends HomeState {
  LaunchLoadSuccess(this.launches);
  final List<Launch> launches;
}
class LaunchLoadDbSuccess extends HomeState {
  LaunchLoadDbSuccess(this.launches);
  final List<Launch> launches;
}
class LaunchLoadFailure extends HomeState {}
