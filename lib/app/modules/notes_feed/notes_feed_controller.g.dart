// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_feed_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotesFeedController on _NotesFeedControllerBase, Store {
  late final _$selectedAtom =
      Atom(name: '_NotesFeedControllerBase.selected', context: context);

  @override
  DateTime get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(DateTime value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  late final _$myNotesObservableAtom = Atom(
      name: '_NotesFeedControllerBase.myNotesObservable', context: context);

  @override
  ObservableFuture<Either<NotesFeedFailure, MyNotesModel>>?
      get myNotesObservable {
    _$myNotesObservableAtom.reportRead();
    return super.myNotesObservable;
  }

  @override
  set myNotesObservable(
      ObservableFuture<Either<NotesFeedFailure, MyNotesModel>>? value) {
    _$myNotesObservableAtom.reportWrite(value, super.myNotesObservable, () {
      super.myNotesObservable = value;
    });
  }

  late final _$myNotesModelAtom =
      Atom(name: '_NotesFeedControllerBase.myNotesModel', context: context);

  @override
  MyNotesModel get myNotesModel {
    _$myNotesModelAtom.reportRead();
    return super.myNotesModel;
  }

  @override
  set myNotesModel(MyNotesModel value) {
    _$myNotesModelAtom.reportWrite(value, super.myNotesModel, () {
      super.myNotesModel = value;
    });
  }

  @override
  String toString() {
    return '''
selected: ${selected},
myNotesObservable: ${myNotesObservable},
myNotesModel: ${myNotesModel}
    ''';
  }
}
