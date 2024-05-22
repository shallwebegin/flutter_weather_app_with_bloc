// ignore_for_file: unnecessary_type_check

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'tema_event.dart';
part 'tema_state.dart';

class TemaBloc extends Bloc<TemaEvent, TemaState> {
  TemaBloc()
      : super(UygulamaTemasi(theme: ThemeData.light(), renk: Colors.blue)) {
    on<TemaDegistirEvent>((event, emit) {
      UygulamaTemasi uygulamaTemasi;
      if (event is TemaDegistirEvent) {
        switch (event.havaDurumuKisaltmasi) {
          case 'Snow':
          case 'Clouds':
            uygulamaTemasi = UygulamaTemasi(
                theme: ThemeData(
                    primarySwatch: Colors.blueGrey, useMaterial3: false),
                renk: Colors.grey);
            break;
          case 'Rain':
            uygulamaTemasi = UygulamaTemasi(
                theme: ThemeData(
                    primarySwatch: Colors.indigo, useMaterial3: false),
                renk: Colors.indigo);
            break;
          case 'Clear':
            uygulamaTemasi = UygulamaTemasi(
                theme:
                    ThemeData(primarySwatch: Colors.amber, useMaterial3: false),
                renk: Colors.yellow);
            break;
          default:
            uygulamaTemasi =
                UygulamaTemasi(theme: ThemeData.light(), renk: Colors.blue);
            break;
        }

        emit(uygulamaTemasi);
      }
    });
  }
}
