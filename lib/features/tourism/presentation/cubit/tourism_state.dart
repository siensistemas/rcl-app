import 'package:equatable/equatable.dart';

abstract class TourismState extends Equatable {
  const TourismState();

  @override
  List<Object?> get props => [];
}

class TourismInitial extends TourismState {
  const TourismInitial();
}

class TourismLoading extends TourismState {
  const TourismLoading();
}

class TourismLoaded extends TourismState {
  final List<dynamic> attractions;

  const TourismLoaded(this.attractions);

  @override
  List<Object?> get props => [attractions];
}

class TourismError extends TourismState {
  final String message;

  const TourismError(this.message);

  @override
  List<Object?> get props => [message];
}
