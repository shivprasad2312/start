import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:start/constants/global_variable.dart';
import 'package:start/features/auth/screens/seat_screen.dart';
import 'package:start/features/auth/screens/ticket_view.dart';



class SelectTicket extends StatefulWidget {
  const SelectTicket({Key? key}) : super(key: key);

  @override
  _SelectTicketState createState() => _SelectTicketState();
}

class _SelectTicketState extends State<SelectTicket> {


    String dropdownvalue = 'Price';

  var items = ['Price', 'Time'];

  void _showBottomSheet() {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(21),
              topRight: Radius.circular(21),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Container( // Wrap the SingleChildScrollView with a Container
        height: MediaQuery.of(context).size.height, // Set a maximum height
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  const Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black),
                  Text(
                    "Flights",
                    style: Styles.headLineStyle1.copyWith(color: Colors.black),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                child: DatePicker(
                  DateTime.now(),
                  height: 100,
                  width: 60,
                  initialSelectedDate: DateTime.now(),
                  selectedTextColor: Colors.white,
                  selectionColor: Colors.blue,
                  dateTextStyle: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(left: 15, top: 20),
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(51),
                    topRight: Radius.circular(51),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text("Sort by:", style: Styles.headLineStyle4.copyWith(color: Colors.white)),
                        const SizedBox(width: 10),
                        Container(
                          height: 33,
                          width: 80,
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(10),
                            padding: const EdgeInsets.only(bottom: 2, left: 5),
                            value: dropdownvalue,
                            icon: Container(
                              padding: const EdgeInsets.only(bottom: 2, left: 2, top: 2),
                              child: const Icon(Icons.filter_list_rounded, color: Colors.white),
                            ),
                            iconSize: 20,
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(height: 60),
                        Text("12 flights are available from New York to London",
                            style: Styles.headLineStyle4.copyWith(color: Colors.white)),
                      ],
                    ),

                    GestureDetector(
  onTap: () {
    // Navigate to the seating screen when the ticket is clicked.
    Navigator.push(context, MaterialPageRoute(builder: (context) => SeatScreen()));
  },
  child: const SingleChildScrollView( // Keep the SingleChildScrollView here
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          TicketView(),
                          // TicketView(),
                          // TicketView(),
                          // TicketView(),
                          
                          // Add more TicketView widgets if needed
                        ],
                      ),
                    ),
)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
