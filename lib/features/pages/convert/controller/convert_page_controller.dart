import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convert_coin/core/generic/resource.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../../core/models/coin_model.dart';
part 'convert_page_controller.g.dart';

class ConvertPageController = _ConvertPageControllerBase
    with _$ConvertPageController;

abstract class _ConvertPageControllerBase with Store {
  @observable
  String valueFrom = '';

  @observable
  String valueTo = '';

  @observable
  String coinFrom = '';

  @observable
  String coinTo = '';

  @observable
  Coin? coin;

  @observable
  ObservableList coins = [''].asObservable();

  @observable
  Resource<void, String> statusButton = Resource.success();

  @action
  setValueFrom(value) => valueFrom = value;

  @action
  setValueTo(value) => valueTo = value;

  @action
  setCoinFrom(value) => coinFrom = value;

  @action
  setCoinTo(value) => coinTo = value;

  @action
  Future<void> convertTo() async {
    statusButton = Resource.loading();
    setValueTo('');
    await Future.delayed(Duration(seconds: 2));
    if (coin != null && valueFrom.isNotEmpty) {
      setValueTo(
          '${(double.parse(coin!.low!) * double.parse(valueFrom)).toStringAsFixed(2)}');
    } else {
      setValueTo('You need to select another coin!');
    }

    statusButton = Resource.success();
  }

  @action
  void addFirebase() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "history": FieldValue.arrayUnion([
        {
          coinFrom: {
            coinTo: {valueFrom: valueTo}
          }
        }
      ])
    });
  }

  @action
  Future<Resource<void, String>> getCoin() async {
    final url = 'https://economia.awesomeapi.com.br/last/${coinFrom}-${coinTo}';
    try {
      final response = await Dio().get(url);
      coin = Coin.fromJson(response.data[coinFrom + coinTo]);
      return Resource.success();
    } on DioError catch (e) {
      coin = null;
      return Resource.failed(error: e.message);
    }
  }

  @action
  Future<Resource<void, String>> getCoins() async {
    final url = 'https://economia.awesomeapi.com.br/json/all';
    try {
      final response = await Dio().get(url);
      coins = (response.data as Map).keys.toList().asObservable();
      coinFrom = coins[0];
      coinTo = coins[1];
      return Resource.success();
    } on DioError catch (e) {
      return Resource.failed(error: e.message);
    }
  }
}
