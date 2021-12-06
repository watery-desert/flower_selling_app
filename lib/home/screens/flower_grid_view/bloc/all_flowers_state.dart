part of 'all_flowers_bloc.dart';

abstract class AllFlowersState extends Equatable {
  const AllFlowersState();

  @override
  List<Object> get props => [];
}

class AllFlowersLoading extends AllFlowersState {}

class AllFlowersLoaded extends AllFlowersState {
  final List<Flower> flowers;
  const AllFlowersLoaded(this.flowers);

    @override
  List<Object> get props => [flowers];
}
