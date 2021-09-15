import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'OrderCard.dart';
import './model/OrderResponseModel.dart';
import './model/OrderSubmitModel.dart';
import 'ScriptRepo.dart';
import 'AddOrder.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<OrderResponse> productList = [];

  // submit order
  // void _submitOrder() {
  //   OrderSubmitModel orderModel = OrderSubmitModel(
  //       amount: 2,
  //       price: 550,
  //       productId: "prod0005",
  //       productName: "Stranger Things T-Shirt",
  //       customerContactNumber: 1234567890,
  //       customerEmail: "ssvekariya11@gmail.com",
  //       customerLocation: "Junagadh",
  //       orderStatus: "Pending",
  //       paymentStatus: "Success",
  //       productSize: 'M');

  //   ScriptRepo scriptController = ScriptRepo((String response) {
  //     if (response == ScriptRepo.STATUS_SUCCESS) {
  //       showToast("Order Submit Successfully!", Colors.green);
  //     } else {
  //       showToast("Error Occurred While Submitting!", Colors.red);
  //     }
  //   });
  //   showToast("Submitting Order", Colors.blueGrey);
  //   scriptController.submitOrder(orderModel);
  // }

  // delete order
  void _deleteOrder() {
    ScriptRepo scriptController = ScriptRepo((String response) {
      if (response == ScriptRepo.STATUS_SUCCESS) {
        showToast("Order Removed Successfully!", Colors.green);
      } else {
        showToast("Error Occurred While Deleting!", Colors.red);
      }
    });
    showToast("Deleting Order", Colors.blueGrey);
    scriptController.deleteOrder("prod0001");
  }

  // get all the products
  Future<List<OrderResponse>> _getProducts() async {
    productList.clear();
    setState(() {});
    ScriptRepo scriptController = ScriptRepo((String message) => {});
    var products = await scriptController.fetchProducts();
    print(products);
    await scriptController.fetchProducts().then((value) {
      print(value);
      if (value != null) {
        productList..addAll(value);
        showToast("Data Fetched Successfully", Colors.green);
      }
    });
    setState(() {});
    return productList;
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      init();
    });
  }

  // initially get data from Google Sheet
  init() async {
    await _getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("App Script Demo"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: productList == []
          ? Center(
              child: Text("No Data Found!"),
            )
          : productList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    OrderResponse product = productList[index];
                    return OrderCard(product: product);
                  },
                ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            heroTag: "Place",
            label: Text("Add"),
            backgroundColor: Colors.blueGrey,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => AddOrder(
                            title: "Add",
                          )));
            },
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton.extended(
            heroTag: "fetch",
            label: Text("Fetch"),
            backgroundColor: Colors.blueGrey,
            onPressed: _getProducts,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void showToast(message, Color color) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
    print(message);
  }
}
