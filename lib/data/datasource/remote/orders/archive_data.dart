import 'package:breakfastcanteen/core/class/crud.dart';
import 'package:breakfastcanteen/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.ordersarchive, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }
}
