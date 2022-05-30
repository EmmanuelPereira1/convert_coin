// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_line_chart.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerLineChart on _ControllerLineChartBase, Store {
  late final _$coinsAtom =
      Atom(name: '_ControllerLineChartBase.coins', context: context);

  @override
  ObservableList<dynamic> get coins {
    _$coinsAtom.reportRead();
    return super.coins;
  }

  @override
  set coins(ObservableList<dynamic> value) {
    _$coinsAtom.reportWrite(value, super.coins, () {
      super.coins = value;
    });
  }

  late final _$coinHistoryAtom =
      Atom(name: '_ControllerLineChartBase.coinHistory', context: context);

  @override
  ObservableList<dynamic> get coinHistory {
    _$coinHistoryAtom.reportRead();
    return super.coinHistory;
  }

  @override
  set coinHistory(ObservableList<dynamic> value) {
    _$coinHistoryAtom.reportWrite(value, super.coinHistory, () {
      super.coinHistory = value;
    });
  }

  late final _$coinFromAtom =
      Atom(name: '_ControllerLineChartBase.coinFrom', context: context);

  @override
  String get coinFrom {
    _$coinFromAtom.reportRead();
    return super.coinFrom;
  }

  @override
  set coinFrom(String value) {
    _$coinFromAtom.reportWrite(value, super.coinFrom, () {
      super.coinFrom = value;
    });
  }

  late final _$getCoinsAsyncAction =
      AsyncAction('_ControllerLineChartBase.getCoins', context: context);

  @override
  Future<Resource<void, String>> getCoins() {
    return _$getCoinsAsyncAction.run(() => super.getCoins());
  }

  late final _$getCoinHistoryAsyncAction =
      AsyncAction('_ControllerLineChartBase.getCoinHistory', context: context);

  @override
  Future<Resource<void, String>> getCoinHistory(String coin) {
    return _$getCoinHistoryAsyncAction.run(() => super.getCoinHistory(coin));
  }

  late final _$_ControllerLineChartBaseActionController =
      ActionController(name: '_ControllerLineChartBase', context: context);

  @override
  dynamic setCoinFrom(dynamic value) {
    final _$actionInfo = _$_ControllerLineChartBaseActionController.startAction(
        name: '_ControllerLineChartBase.setCoinFrom');
    try {
      return super.setCoinFrom(value);
    } finally {
      _$_ControllerLineChartBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
coins: ${coins},
coinHistory: ${coinHistory},
coinFrom: ${coinFrom}
    ''';
  }
}
