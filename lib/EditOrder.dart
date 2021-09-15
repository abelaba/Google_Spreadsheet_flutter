import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import './ScriptRepo.dart';
import './model/OrderResponseModel.dart';
import './model/OrderSubmitModel.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class EditOrder extends StatefulWidget {
  EditOrder({Key? key, required this.title, required this.product})
      : super(key: key);

  final String title;
  final OrderResponse product;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<EditOrder> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // TextField Controllers
  late TextEditingController stateController =
      TextEditingController(text: widget.product.state);
  late TextEditingController categoryController =
      TextEditingController(text: widget.product.category);
  late TextEditingController arrivalDateController =
      TextEditingController(text: widget.product.arrivalDate);
  late TextEditingController fullNameController =
      TextEditingController(text: widget.product.fullName);
  late TextEditingController cinController =
      TextEditingController(text: widget.product.cin);
  late TextEditingController companyController =
      TextEditingController(text: widget.product.company);
  late TextEditingController registrationNumberController =
      TextEditingController(text: widget.product.registrationNumber);
  late TextEditingController badgeNumberController =
      TextEditingController(text: widget.product.badgeNumber);
  late TextEditingController personController =
      TextEditingController(text: widget.product.person);
  late TextEditingController authorizedByController =
      TextEditingController(text: widget.product.authorizedBy);
  late TextEditingController firePermitController =
      TextEditingController(text: widget.product.firePermit);
  late TextEditingController emailController =
      TextEditingController(text: widget.product.email);
  late TextEditingController releaseDateController =
      TextEditingController(text: widget.product.releaseDate);
  late TextEditingController entryDateController =
      TextEditingController(text: widget.product.entryDate);
  late TextEditingController senderEmailController =
      TextEditingController(text: widget.product.senderEmail);

  Future<void> _submitOrder() async {
    if (_formKey.currentState!.validate()) {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      OrderSubmitModel orderModel = OrderSubmitModel(
          Id: widget.product.id,
          State: stateController.text,
          Category: categoryController.text,
          ArrivalDate: arrivalDateController.text,
          FullName: fullNameController.text,
          Cin: cinController.text,
          Company: companyController.text,
          RegistrationNumber: registrationNumberController.text,
          BadgeNumber: badgeNumberController.text,
          Person: personController.text,
          AuthorizedBy: authorizedByController.text,
          FirePermit: firePermitController.text,
          Email: emailController.text,
          ReleaseDate: releaseDateController.text,
          EntryDate: entryDateController.text,
          SenderEmail: 'prefs.getString("email")');

      ScriptRepo scriptController = ScriptRepo((String response) {
        if (response == ScriptRepo.STATUS_SUCCESS) {
          showToast("Order Submit Successfully!", Colors.green);
        } else {
          showToast("Error Occurred While Submitting!", Colors.red);
        }
      });
      showToast("Submitting Order", Colors.blueGrey);
      print(orderModel.State);
      scriptController.updateOrder(orderModel.Id!, orderModel);
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState!.showSnackBar(snackBar);
  }

  void showToast(message, Color color) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: stateController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Valid State';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'State'),
                      ),
                      TextFormField(
                        controller: categoryController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Valid Category';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Category'),
                      ),
                      TextFormField(
                        controller: arrivalDateController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Valid Arrival Date';
                          }
                          return null;
                        },
                        // keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          labelText: 'Arrival Date',
                        ),
                      ),
                      TextFormField(
                        controller: companyController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Valid Company';
                          }
                          return null;
                        },
                        // keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          labelText: 'Company',
                        ),
                      ),
                      TextFormField(
                        controller: fullNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Full Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Full Name'),
                      ),
                      TextFormField(
                        controller: cinController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Cin';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Cin'),
                      ),
                      TextFormField(
                        controller: registrationNumberController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Registration Number';
                          }
                          return null;
                        },
                        decoration:
                            InputDecoration(labelText: 'Registration Number'),
                      ),
                      TextFormField(
                        controller: badgeNumberController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Badge Number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Badge Number'),
                      ),
                      TextFormField(
                        controller: personController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Person';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Person'),
                      ),
                      TextFormField(
                        controller: authorizedByController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Authorized By';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Authorized By'),
                      ),
                      TextFormField(
                        controller: firePermitController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Fire Permit';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Fire Permit'),
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Email'),
                      ),
                      TextFormField(
                        controller: releaseDateController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Release Date';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Release Date'),
                      ),
                      TextFormField(
                        controller: entryDateController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Entry Date';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Entry Date'),
                      ),
                    ],
                  ),
                )),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () async {
                await _submitOrder();
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
