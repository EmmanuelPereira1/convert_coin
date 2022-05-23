import 'package:convert_coin/core/models/coin_model.dart';
import 'package:dio/dio.dart';

Future<Coin> getCoin(String convertFrom, convertTo) async {
  final url =
      'https://economia.awesomeapi.com.br/last/${convertFrom}-${convertTo}';
  final response = await Dio().get(url);
  if (response.statusCode == 200) {
    return Coin.fromJson(response.data[convertFrom + convertTo]);
  }
  return Future.error('API error');
}
