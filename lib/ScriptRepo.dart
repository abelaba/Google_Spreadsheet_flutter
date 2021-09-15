import 'dart:convert' as convert;

import './model/OrderResponseModel.dart';
import 'package:http/http.dart' as http;

import './model/OrderSubmitModel.dart';

class ScriptRepo {
  final void Function(String) callback;
  static const URL =
      "https://script.google.com/macros/s/AKfycbzHBEEUszXzy-5qbDp1_FDaTK5yGNgZ_0KvJBNAtCtBUIm7WHq_aqR0vDtP-5QY6mfY/exec";
  // static const String ORDER_INSERT_URL =
  //     "https://script.google.com/macros/s/AKfycbyRIgJ-9DC9v-RJwxAneFyIh8DVGPIneciwor-Q2VZXy8X_S5U/exec";
  // static const String ORDER_DELETE_URL =
  //     "https://script.google.com/macros/s/AKfycbz4A6VU4ht5vR6WyZtXZBxZn9IEvhUtYxrUicl-iaoLXBnAw54/exec";
  // static const String ORDER_UPDATE_URL =
  //     "https://script.google.com/macros/s/AKfycbwpwBp2XN6HEzKHU8NB2WEoPOi56v2pXGcwc3Fj08CWOZ6a0Q_3/exec";
  // static const String ORDER_FETCH_URL =
  //     "https://script.google.com/macros/s/AKfycbzBU_zO7EWHY08unSehWRTBeCdXIRF2Vy4_MPiKxkUBqFanbs35/exec";

  static const STATUS_SUCCESS = "SUCCESS";
  static const STATUS_FAILURE = "FAILURE";

  ScriptRepo(this.callback);

  // submit order
  void submitOrder(OrderSubmitModel orderDetails) async {
    print(URL + orderDetails.toParams() + "&action=insert");
    try {
      await http
          .get(Uri.parse(URL + orderDetails.toParams() + "&action=insert"))
          .then((response) {
        print(response);
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      print(e);
      callback(STATUS_FAILURE);
    }
  }

  // delete order
  void deleteOrder(String id) async {
    try {
      await http
          .get(Uri.parse(URL + "?Id=$id" + "&action=delete"))
          .then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      callback(STATUS_FAILURE);
    }
  }

  // update order
  void updateOrder(String productId, OrderSubmitModel update) async {
    try {
      await http
          .get(Uri.parse(URL + update.toParams() + "&action=update"))
          .then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      callback(STATUS_FAILURE);
    }
  }

  // fetch products
  Future<List<OrderResponse>?> fetchProducts() async {
    OrderResponseModel myModels = new OrderResponseModel();
    try {
      await http.get(Uri.parse(URL + "?&action=read")).then((response) async {
        myModels =
            OrderResponseModel.fromJson(convert.jsonDecode(response.body));
      });
      return myModels.order;
    } catch (e) {
      return [];
    }
  }
}
