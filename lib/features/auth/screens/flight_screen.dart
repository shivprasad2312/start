import 'package:flutter/material.dart';
// import 'package:start/common/widgets/single_product.dart';
import 'package:start/constants/global_variable.dart';
import 'package:intl/intl.dart';
import 'package:start/features/admin/screens/posts_screen.dart';


class FlightScreen extends StatefulWidget {
  const FlightScreen({super.key});

  @override
  State<FlightScreen> createState() => _FlightScreenState();
}

class _FlightScreenState extends State<FlightScreen> {
  bool isRoundTrip = true;
  int selectedAdults = 1; // Initialize the number of adults
  int selectedKids = 0; // Initialize the number of kids
  int selectedLuggage = 0; // Initialize the luggage weight
  bool isEconomySelected = true; // Add this state variable for Economy class
  bool isBusinessSelected = false; // A
  bool isEliteSelected = false;
  bool isNonstopSelected = false;

  Future<void> pickDepartureDate() async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(DateTime.now().year + 1),
  );

  if (pickedDate != null && pickedDate != DateTime.now()) {
    setState(() {
      departureDate = pickedDate;
    });
  }
}

Future<void> pickReturnDate() async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(DateTime.now().year + 1),
  );

  if (pickedDate != null && pickedDate != DateTime.now()) {
    setState(() {
      returnDate = pickedDate;
    });
  }
}



  DateTime? departureDate; // Variable to store the selected departure date
  DateTime? returnDate; // Variable to store the selected return date

  void selectClass(String className) {
    setState(() {
      isEconomySelected = className == 'Economy';
      isBusinessSelected = className == 'Business';
      isEliteSelected = className == 'Elite';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(41),
                  topRight: Radius.circular(41),
                ),
                color: Colors.amber,
              ),
              height: 550,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(width: 20),
                            Text("Book Your", style: Styles.headLineStyle1),
                            Text("Flight", style: Styles.headLineStyle1),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isRoundTrip = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: isRoundTrip ? Colors.orange : Colors.grey,
                              onPrimary: Colors.black,
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            ),
                            child: Text('Round Trip', style: TextStyle(fontSize: 12, color: isRoundTrip ? Colors.black : Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isRoundTrip = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              primary: isRoundTrip ? Colors.grey : Colors.orange,
                              onPrimary: Colors.black,
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            ),
                            child: Text('One Way', style: TextStyle(fontSize: 12, color: isRoundTrip ? Colors.white : Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 100),


                  //  Row(
                  //     children: [
                  //       Text("From", style: TextStyle(fontSize: 16)),
                  //     ],
                  //   ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Expanded(
                        //   flex: 2,
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text("From", style: TextStyle(fontSize: 16)),
                        //     ],
                        //   ),
                        // ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 40,
                            margin: EdgeInsets.all(5),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "From",
                                hintText: "Enter your departure location",
                                prefixIcon: Icon(Icons.location_on),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),

// Row(
//                       children: [
//                         Text("From", style: TextStyle(fontSize: 16)),
//                       ],
//                     ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Expanded(
                        //   flex: 2,
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text("From", style: TextStyle(fontSize: 16)),
                        //     ],
                        //   ),
                        // ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 40,
                            margin: EdgeInsets.all(5),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "To",
                                hintText: "Enter your arrival location",
                                prefixIcon: Icon(Icons.location_on),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),



                      ],
                    ),

                    SizedBox(height: 20,),
                    Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Depart", style: Styles.headLineStyle4),
        InkWell(
          onTap: () {
            pickDepartureDate(); // Call the function to pick the departure date
          },
          child: Row(
            children: [
              Icon(Icons.calendar_today_outlined),
              SizedBox(width: 5), // Spacing
              if (departureDate != null)
                Text(
                  DateFormat('MM/dd/yyyy').format(departureDate!),
                  style: TextStyle(fontSize: 16),
                )
              else
                Text('Select Date', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("Return", style: Styles.headLineStyle4),
        InkWell(
          onTap: () {
            pickReturnDate(); // Call the function to pick the return date
          },
          child: Row(
            children: [
              Icon(Icons.calendar_today_outlined),
              SizedBox(width: 5), // Spacing
              if (returnDate != null)
                Text(
                  DateFormat('MM/dd/yyyy').format(returnDate!),
                  style: TextStyle(fontSize: 16),
                )
              else
                Text('Select Date', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ],
    ),
  ],
),

                    SizedBox(height: 30),
                    Row(
                      children: [
                        Text("Passenger and Luggage", style: Styles.headLineStyle4),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.people_alt_outlined),
                        DropdownButton<int>(
                          value: selectedAdults,
                          items: List.generate(10, (index) => index + 1)
                              .map((value) => DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          ))
                              .toList(),
                          onChanged: (int? newValue) {
                            if (newValue != null) {
                              setState(() {
                                selectedAdults = newValue;
                              });
                            }
                          },
                        ),
                        SizedBox(width: 5,),
                        Icon(Icons.child_care_outlined),
                        DropdownButton<int>(
                          value: selectedKids,
                          items: List.generate(6, (index) => index)
                              .map((value) => DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          ))
                              .toList(),
                          onChanged: (int? newValue) {
                            if (newValue != null) {
                              setState(() {
                                selectedKids = newValue;
                              });
                            }
                          },
                        ),
                        SizedBox(width: 5,),
                        Icon(Icons.luggage_outlined),
                        DropdownButton<int>(
                          value: selectedLuggage,
                          items: List.generate(6, (index) => index * 5)
                              .map((value) => DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString() + " kg"),
                          ))
                              .toList(),
                          onChanged: (int? newValue) {
                            if (newValue != null) {
                              setState(() {
                                selectedLuggage = newValue;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),

                    Column(
                      children:[
                        Row(children: [
                          Text("Class",style: Styles.headLineStyle4,),
                        ],),
                        SizedBox(height: 10,) ,
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              selectClass('Economy');
                            },
                            child: Row(
                              children: [
                                Icon(Icons.account_balance_wallet_outlined),
                                SizedBox(width: 5),
                                Text('Economy', style: TextStyle(color: isEconomySelected ? Colors.black : Colors.white)),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              selectClass('Business');
                            },
                            child: Row(
                              children: [
                                Icon(Icons.business_outlined),
                                SizedBox(width: 5),
                                Text('Business', style: TextStyle(color: isBusinessSelected ? Colors.black : Colors.white)),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              selectClass('Elite');
                            },
                            child: Row(
                              children: [
                                Icon(Icons.star_border_outlined),
                                SizedBox(width: 5),
                                Text('Elite', style: TextStyle(color: isEliteSelected ? Colors.black : Colors.white)),
                              ],
                            ),
                          ),
                        ],
                      )
                      ],
                    ),

                    SizedBox(
                      height: 30,
                    ),

                  Row(
  children: [
    Text("Nonstop flights first"),
    Transform.scale(
      scale: 0.6, // Adjust the scale factor as needed
      child: Switch(
        value: isNonstopSelected,
        onChanged: (bool newValue) {
          setState(() {
            isNonstopSelected = newValue;
          });
        },
      ),
    ),
  ],
)
,                   SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PostsScreen()),
                        );
                      },  
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        onPrimary: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(width: 10),
                          Text('Search Flights', style: Styles.headLineStyle4),
                        ],
                      ),
                    ),
                  ],
            )
         )  
          ],
            ),
        
      );
  }
}

void main() {
  runApp(MaterialApp(
    home: FlightScreen(),
  ));
}
