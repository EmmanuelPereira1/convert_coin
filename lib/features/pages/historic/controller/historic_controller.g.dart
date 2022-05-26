// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historic_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoricController on _HistoricControllerBase, Store {
  late final _$historyAtom =
      Atom(name: '_HistoricControllerBase.history', context: context);

  @override
  ObservableList<dynamic> get history {
    _$historyAtom.reportRead();
    return super.history;
  }

  @override
  set history(ObservableList<dynamic> value) {
    _$historyAtom.reportWrite(value, super.history, () {
      super.history = value;
    });
  }

  late final _$loadingPageAtom =
      Atom(name: '_HistoricControllerBase.loadingPage', context: context);

  @override
  Resource<dynamic, dynamic> get loadingPage {
    _$loadingPageAtom.reportRead();
    return super.loadingPage;
  }

  @override
  set loadingPage(Resource<dynamic, dynamic> value) {
    _$loadingPageAtom.reportWrite(value, super.loadingPage, () {
      super.loadingPage = value;
    });
  }

  late final _$fetchHistoricAsyncAction =
      AsyncAction('_HistoricControllerBase.fetchHistoric', context: context);

  @override
  Future<Resource<void, String>> fetchHistoric() {
    return _$fetchHistoricAsyncAction.run(() => super.fetchHistoric());
  }

  @override
  String toString() {
    return '''
history: ${history},
loadingPage: ${loadingPage}
    ''';
  }
}
