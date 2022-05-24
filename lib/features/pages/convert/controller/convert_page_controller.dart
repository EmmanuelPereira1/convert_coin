import 'package:convert_coin/core/generic/resource.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../../core/models/coin_model.dart';
part 'convert_page_controller.g.dart';

class ConvertPageController = _ConvertPageControllerBase
    with _$ConvertPageController;

abstract class _ConvertPageControllerBase with Store {
  @observable
  String valueFrom = '';

  @observable
  String coinFrom = '';

  @observable
  String coinTo = '';

  @observable
  Coin? coin;

  @observable
  ObservableList coins = [''].asObservable();

  @computed
  double get valueTo => coin != null && valueFrom.isNotEmpty
      ? double.parse(valueFrom) * double.parse(coin!.low!)
      : 0.0;

  @action
  setValueFrom(value) => valueFrom = value;

  @action
  setCoinFrom(value) => coinFrom = value;

  @action
  setCoinTo(value) => coinTo = value;

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
