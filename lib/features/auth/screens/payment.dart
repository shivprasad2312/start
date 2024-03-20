import 'package:flutter/material.dart';
import 'package:start/constants/global_variable.dart';
import 'package:start/features/auth/screens/payment_done.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key});

  @override
  State<Payment> createState() => PaymentState();
}

class PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(41),
                  topRight: Radius.circular(41),
                ),
                color: Colors.amber,
              ),
              height: 680, // Match the height to your design
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 40),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.arrow_back_ios_new, color: Colors.black),
                    Text("Checkout", style: Styles.headLineStyle1),
                  ],
                ),
                Transform.translate(
                  offset: Offset(0, 100), // Move the container 100 down
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(11),
                        topRight: Radius.circular(11),
                        bottomLeft: Radius.circular(11),
                        bottomRight: Radius.circular(11),
                      ),
                      color: Colors.white,
                    ),
                    height: 80, // Set the desired height
                  ),
                ),

                Transform.translate(
                  offset: Offset(0, 120), // Move the container and the TextFormField 70 units down
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: "To",
                              labelText: "Cardholder Name",
                              labelStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.person, color: Colors.grey),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Name can't be empty!";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: "To",
                              labelText: "Card Number",
                              labelStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.credit_card, color: Colors.grey),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Card Number can't be empty!";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: "MM/YY",
                                    labelText: "Expiration Date",
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.calendar_today, color: Colors.grey),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Expiration Date can't be empty!";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: "CVV",
                                    labelText: "CVV Number",
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.lock, color: Colors.grey),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "CVV Number can't be empty!";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Transform.translate(
                  offset: Offset(0, 130), // Move the container and its content 90 units down
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Ticket Price", style: Styles.headLineStyle3),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("INR 123000", style: Styles.headLineStyle3),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Fare Tax", style: Styles.headLineStyle3),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("INR 23000", style: Styles.headLineStyle3),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Total", style: Styles.headLineStyle3),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("INR 146000", style: Styles.headLineStyle3),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 20, // Adjust this value to control the vertical position
                  left: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=>PaymentDone()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 10),
                    ),
                    child: Row(
                      children: <Widget>[
                        const SizedBox(width: 10),
                        Text('Pay', style: Styles.headLineStyle4),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
