part of 'all_flowers_bloc.dart';

abstract class AllFlowersEvent extends Equatable {
  const AllFlowersEvent();

  @override
  List<Object> get props => [];
}

class LoadFlowers extends AllFlowersEvent {}

class AllFlowersUpdated extends AllFlowersEvent {
  final List<Flower> flowers;
  const AllFlowersUpdated(this.flowers);
  @override
  List<Object> get props => [flowers];
}


