
abstract class HomeEvent {}

class LoadHomeDataEvent extends HomeEvent {}

class LoadFeedDetailEvent extends HomeEvent {
  final String Id;

  LoadFeedDetailEvent({required this.Id});
}
