import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowers_repository/flowers_repository.dart';

part 'all_flowers_event.dart';
part 'all_flowers_state.dart';

class AllFlowersBloc extends Bloc<AllFlowersEvent, AllFlowersState> {
  final FlowersRepo _flowersRepo;
  StreamSubscription? _allFlowersSubscription;
  AllFlowersBloc({required FlowersRepo flowersRepo})
      : _flowersRepo = flowersRepo,
        super(AllFlowersLoading()) {
    on<LoadFlowers>(_onLoadFlowers);
    on<AllFlowersUpdated>(_onAllFlowersUpdated);
  }

  void _onLoadFlowers(LoadFlowers event, Emitter<AllFlowersState> emit) {
    _allFlowersSubscription?.cancel();
    _flowersRepo.getFlowers().listen((flowers) {
      add(AllFlowersUpdated(flowers));
    });
  }

  void _onAllFlowersUpdated(AllFlowersUpdated event, Emitter<AllFlowersState> emit) {
    emit(AllFlowersLoaded(event.flowers));
  }

  @override
  Future<void> close() {
    _allFlowersSubscription?.cancel();
    return super.close();
  }
}
