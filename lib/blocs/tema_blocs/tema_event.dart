part of 'tema_bloc.dart';

sealed class TemaEvent extends Equatable {
  const TemaEvent();

  @override
  List<Object> get props => [];
}

class TemaDegistirEvent extends TemaEvent {
  const TemaDegistirEvent({required this.havaDurumuKisaltmasi});
  final String havaDurumuKisaltmasi;

  @override
  List<Object> get props => [havaDurumuKisaltmasi];
}
