import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/generic/resource.dart';
part 'historic_controller.g.dart';

class HistoricController = _HistoricControllerBase with _$HistoricController;

abstract class _HistoricControllerBase with Store {
  @observable
  late ObservableList history = [].asObservable();

  @action
  Future<Resource<void, String>> fetchHistoric() async {
    final response = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (response.exists) {
      final data = response.data();
      history = (data!['history'] as List).asObservable();
      return Resource.success();
    }
    return Resource.failed(error: 'Error fetching history!');
  }
}
/*
coinFrom: {
            coinTo: {valueFrom: valueTo}
 */