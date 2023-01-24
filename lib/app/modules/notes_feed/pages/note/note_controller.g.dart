// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteController on _NoteControllerBase, Store {
  late final _$titleControllerAtom =
      Atom(name: '_NoteControllerBase.titleController', context: context);

  @override
  TextEditingController get titleController {
    _$titleControllerAtom.reportRead();
    return super.titleController;
  }

  @override
  set titleController(TextEditingController value) {
    _$titleControllerAtom.reportWrite(value, super.titleController, () {
      super.titleController = value;
    });
  }

  late final _$descriptionControllerAtom =
      Atom(name: '_NoteControllerBase.descriptionController', context: context);

  @override
  TextEditingController get descriptionController {
    _$descriptionControllerAtom.reportRead();
    return super.descriptionController;
  }

  @override
  set descriptionController(TextEditingController value) {
    _$descriptionControllerAtom.reportWrite(value, super.descriptionController,
        () {
      super.descriptionController = value;
    });
  }

  late final _$saveObservableAtom =
      Atom(name: '_NoteControllerBase.saveObservable', context: context);

  @override
  ObservableFuture<Either<NotesFeedFailure, NoteModel>?>? get saveObservable {
    _$saveObservableAtom.reportRead();
    return super.saveObservable;
  }

  @override
  set saveObservable(
      ObservableFuture<Either<NotesFeedFailure, NoteModel>?>? value) {
    _$saveObservableAtom.reportWrite(value, super.saveObservable, () {
      super.saveObservable = value;
    });
  }

  late final _$deleteObservableAtom =
      Atom(name: '_NoteControllerBase.deleteObservable', context: context);

  @override
  ObservableFuture<Either<NotesFeedFailure, int>?>? get deleteObservable {
    _$deleteObservableAtom.reportRead();
    return super.deleteObservable;
  }

  @override
  set deleteObservable(
      ObservableFuture<Either<NotesFeedFailure, int>?>? value) {
    _$deleteObservableAtom.reportWrite(value, super.deleteObservable, () {
      super.deleteObservable = value;
    });
  }

  @override
  String toString() {
    return '''
titleController: ${titleController},
descriptionController: ${descriptionController},
saveObservable: ${saveObservable},
deleteObservable: ${deleteObservable}
    ''';
  }
}
