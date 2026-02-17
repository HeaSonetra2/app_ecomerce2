
abstract class HomeEvent {}

class LoadHomeDataEvent extends HomeEvent {}

class LoadFeedDetailEvent extends HomeEvent {
  final int Id;

  LoadFeedDetailEvent({required this.Id});
}
