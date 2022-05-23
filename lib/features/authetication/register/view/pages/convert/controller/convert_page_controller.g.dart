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
  String toString() {
    return '''
valueFrom: ${valueFrom},
valueTo: ${valueTo},
coinFrom: ${coinFrom},
coinTo: ${coinTo}
    ''';
  }
}
