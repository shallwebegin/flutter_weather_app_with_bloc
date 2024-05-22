part of 'tema_bloc.dart';

sealed class TemaState extends Equatable {
  const TemaState();

  @override
  List<Object> get props => [];
}

final class UygulamaTemasi extends TemaState {
  const UygulamaTemasi({required this.theme, required this.renk});
  final ThemeData theme;
  final MaterialColor renk;
  @override
  List<Object> get props => [theme, renk];
}
