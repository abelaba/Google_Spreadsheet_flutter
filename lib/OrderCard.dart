import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './EditOrder.dart';
import './HomeScreen.dart';

import './model/OrderResponseModel.dart';
import 'ScriptRepo.dart';

// Reusable card widget
class OrderCard extends StatefulWidget {
  final OrderResponse product;

  OrderCard({required this.product});

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Delete property.'),
                Text('Would you like to delete this?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                ScriptRepo scriptController = ScriptRepo((String response) {});
                scriptController.deleteOrder(widget.product.id);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) =>
                    EditOrder(title: "Edit", product: this.widget.product)));
        // .then((value) => setState(() {}));
      },
      onLongPress: () {
        _showMyDialog(context);
      },
      child: Card(
        child: ListView(
          padding: EdgeInsets.all(20),
          shrinkWrap: true,
          primary: false,
          children: [
            Text(
              "Id: ${widget.product.id}",
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "State: " + widget.product.state,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Category: " + widget.product.category,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "ArrivalDate: " + widget.product.arrivalDate,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "FullName: " + widget.product.fullName.toString(),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Cin: " + widget.product.cin.toString(),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Company: " + widget.product.company.toString(),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "RegistrationNumber: " +
                  widget.product.registrationNumber.toString(),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "BadgeNumber: " + widget.product.badgeNumber.toString(),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Person: " + widget.product.person.toString(),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "AuthorizedBy: " + widget.product.authorizedBy.toString(),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "FirePermit: " + widget.product.firePermit.toString(),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Email: " + widget.product.email.toString(),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "ReleaseDate: " + widget.product.releaseDate.toString(),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "EntryDate: " + widget.product.entryDate.toString(),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "SenderEmail: " + widget.product.senderEmail.toString(),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
