// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'convert_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConvertPageController on _ConvertPageControllerBase, Store {
  late final _$valueFromAtom =
      Atom(name: '_ConvertPageControllerBase.valueFrom', context: context);

  @override
  String get valueFrom {
    _$valueFromAtom.reportRead();
    return super.valueFrom;
  }

  @override
  set valueFrom(String value) {
    _$valueFromAtom.reportWrite(value, super.valueFrom, () {
      super.valueFrom = value;
    });
  }

  late final _$valueToAtom =
      Atom(name: '_ConvertPageControllerBase.valueTo', context: context);

  @override
  String get valueTo {
    _$valueToAtom.reportRead();
    return super.valueTo;
  }

  @override
  set valueTo(String value) {
    _$valueToAtom.reportWrite(value, super.valueTo, () {
      super.valueTo = value;
    });
  }

  late final _$coinFromAtom =
      Atom(name: '_ConvertPageControllerBase.coinFrom', context: context);

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

  late final _$coinToAtom =
      Atom(name: '_ConvertPageControllerBase.coinTo', context: context);

  @override
  String get coinTo {
    _$coinToAtom.reportRead();
    return super.coinTo;
  }

  @override
  set coinTo(String value) {
    _$coinToAtom.reportWrite(value, super.coinTo, () {
      super.coinTo = value;
    });
  }

  late final _$coinAtom =
      Atom(name: '_ConvertPageControllerBase.coin', context: context);

  @override
  Coin? get coin {
    _$coinAtom.reportRead();
    return super.coin;
  }

  @override
  set coin(Coin? value) {
    _$coinAtom.reportWrite(value, super.coin, () {
      super.coin = value;
    });
  }

  late final _$coinsAtom =
      Atom(name: '_ConvertPageControllerBase.coins', context: context);

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

  late final _$statusButtonAtom =
      Atom(name: '_ConvertPageControllerBase.statusButton', context: context);

  @override
  Resource<void, String> get statusButton {
    _$statusButtonAtom.reportRead();
    return super.statusButton;
  }

  @override
  set statusButton(Resource<void, String> value) {
    _$statusButtonAtom.reportWrite(value, super.statusButton, () {
      super.statusButton = value;
    });
  }

  late final _$convertToAsyncAction =
      AsyncAction('_ConvertPageControllerBase.convertTo', context: context);

  @override
  Future<void> convertTo() {
    return _$convertToAsyncAction.run(() => super.convertTo());
  }

  late final _$getCoinAsyncAction =
      AsyncAction('_ConvertPageControllerBase.getCoin', context: context);

  @override
  Future<Resource<void, String>> getCoin() {
    return _$getCoinAsyncAction.run(() => super.getCoin());
  }

  late final _$getCoinsAsyncAction =
      AsyncAction('_ConvertPageControllerBase.getCoins', context: context);

  @override
  Future<Resource<void, String>> getCoins() {
    return _$getCoinsAsyncAction.run(() => super.getCoins());
  }

  late final _$_ConvertPageControllerBaseActionController =
      ActionController(name: '_ConvertPageControllerBase', context: context);

  @override
  dynamic setValueFrom(dynamic value) {
    final _$actionInfo = _$_ConvertPageControllerBaseActionController
        .startAction(name: '_ConvertPageControllerBase.setValueFrom');
    try {
      return super.setValueFrom(value);
    } finally {
      _$_ConvertPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValueTo(dynamic value) {
    final _$actionInfo = _$_ConvertPageControllerBaseActionController
        .startAction(name: '_ConvertPageControllerBase.setValueTo');
    try {
      return super.setValueTo(value);
    } finally {
      _$_ConvertPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCoinFrom(dynamic value) {
    final _$actionInfo = _$_ConvertPageControllerBaseActionController
        .startAction(name: '_ConvertPageControllerBase.setCoinFrom');
    try {
      return super.setCoinFrom(value);
    } finally {
      _$_ConvertPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCoinTo(dynamic value) {
    final _$actionInfo = _$_ConvertPageControllerBaseActionController
        .startAction(name: '_ConvertPageControllerBase.setCoinTo');
    try {
      return super.setCoinTo(value);
    } finally {
      _$_ConvertPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFirebase() {
    final _$actionInfo = _$_ConvertPageControllerBaseActionController
        .startAction(name: '_ConvertPageControllerBase.addFirebase');
    try {
      return super.addFirebase();
    } finally {
      _$_ConvertPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valueFrom: ${valueFrom},
valueTo: ${valueTo},
coinFrom: ${coinFrom},
coinTo: ${coinTo},
coin: ${coin},
coins: ${coins},
statusButton: ${statusButton}
    ''';
  }
}
