import 'package:equatable/equatable.dart';

abstract class ClassifiedState extends Equatable {
  const ClassifiedState();

  @override
  List<Object?> get props => [];
}

class ClassifiedInitial extends ClassifiedState {
  const ClassifiedInitial();
}

class ClassifiedLoading extends ClassifiedState {
  const ClassifiedLoading();
}

class ClassifiedLoaded extends ClassifiedState {
  final List<dynamic> classifieds;

  const ClassifiedLoaded(this.classifieds);

  @override
  List<Object?> get props => [classifieds];
}

class ClassifiedError extends ClassifiedState {
  final String message;

  const ClassifiedError(this.message);

  @override
  List<Object?> get props => [message];
}
