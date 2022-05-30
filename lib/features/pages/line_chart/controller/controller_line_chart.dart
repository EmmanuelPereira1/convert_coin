import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/generic/resource.dart';
import '../../../../core/models/coin_history_model.dart';
part 'controller_line_chart.g.dart';

class ControllerLineChart = _ControllerLineChartBase with _$ControllerLineChart;

abstract class _ControllerLineChartBase with Store {
  @observable
  ObservableList coins = [].asObservable();

  @observable
  ObservableList coinHistory = [].asObservable();

  @observable
  String coinFrom = '';

  @observable
  Resource statusCoinHistory = Resource.loading();

  @action
  setCoinFrom(value) => coinFrom = value;

  @action
  Future<Resource<void, String>> getCoins() async {
    final url = 'https://economia.awesomeapi.com.br/json/all';
    try {
      final response = await Dio().get(url);
      coins = (response.data as Map).keys.toList().asObservable();
      setCoinFrom(coins[0]);
      return Resource.success();
    } on DioError catch (e) {
      return Resource.failed(error: e.message);
    }
  }

  @action
  Future<Resource<void, String>> getCoinHistory(String coin) async {
    final url = 'https://economia.awesomeapi.com.br/json/daily/$coin/25';
    statusCoinHistory = Resource.loading();
    try {
      final response = await Dio().get(url);
      coinHistory = (response.data as List)
          .map((el) => CoinHistory.fromJson(el))
          .toList()
          .asObservable();
      Future.delayed(Duration(seconds: 4));
      statusCoinHistory = Resource.success();
      return Resource.success();
    } on DioError catch (e) {
      statusCoinHistory = Resource.failed();
      return Resource.failed(error: e.message);
    }
  }
}
