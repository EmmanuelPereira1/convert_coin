import 'package:mobx/mobx.dart';
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

  @action
  setValueFrom(value) => valueFrom = value;

  @action
  setValueTo(value) => valueTo = value;

  @action
  setCoinFrom(value) => coinFrom = value;

  @action
  setCoinTo(value) => coinTo = value;
}
