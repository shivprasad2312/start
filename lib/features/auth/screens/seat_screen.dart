import 'package:flutter/material.dart';
import 'package:start/constants/global_variable.dart';
import 'package:start/features/auth/screens/payment.dart';

class SeatScreen extends StatefulWidget {
  const SeatScreen({Key? key}) : super(key: key);

  @override
  State<SeatScreen> createState() => _SeatScreenState();
}

class _SeatScreenState extends State<SeatScreen> {
  String _selectedClass = 'Premium Class';
  List<List<bool>> seatTapped = List.generate(8, (index) => List.filled(8, false));


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
              height: 650,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView(
              children: const [
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.arrow_back_ios),
                        Text(
                          "Flight details",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          Positioned(
            top: 190,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bharat",style: Styles.headLineStyle2,),
                Text("(BHR)",style: Styles.headLineStyle4,),
                SizedBox(height: 20,),
          
                Icon(Icons.airplanemode_active_outlined,color: Colors.black,),
                SizedBox(height: 20,),
          
                Text("London",style: Styles.headLineStyle2,),
                Text("(LON)",style: Styles.headLineStyle4,),
                SizedBox(height: 20,),
          
                Text("Depart",style: Styles.headLineStyle4,),
                Text("8:30 AM",style: Styles.headLineStyle2,),
                SizedBox(height: 20,),
          
                Text("Flight No",style: Styles.headLineStyle4,),
                Text("EX9739",style: Styles.headLineStyle2,),
                SizedBox(height: 20,),
          
                Text("Traveller",style: Styles.headLineStyle4,),
                Text("01",style: Styles.headLineStyle2,),
                SizedBox(height: 20,),
          
                Text("Seat No",style: Styles.headLineStyle4,),
                Text("17",style: Styles.headLineStyle2,),
                SizedBox(height: 20,),
          
                Text("Ticket Price",style: Styles.headLineStyle4,),
                Text("INR 123000",style: Styles.headLineStyle2,),
          
              ],
            ),
          ),

          Positioned(
            right: 120,
            top: 160,
            child: Image.asset(
              'assets/images/bell.png',
              width: 30,
              height: 30,
            ),
          ),
          Positioned(
            top: 200,
            left: 150,
            child: Container(
              width: 200,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21),
                color: const Color.fromARGB(255, 87, 74, 29),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Positioned(
                    top: 10,
                    left: 10,
                    child: Text(
                      "Select Seat",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 20,
                    child: DropdownButton<String>(
                      value: _selectedClass,
                      items: [
                        'Premium Class',
                        'Economy Class',
                        'First Class',
                      ].map((String classType) {
                        return DropdownMenuItem<String>(
                          value: classType,
                          child: Text(classType),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedClass = newValue!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: List.generate(
                          8,
                          (rowIndex) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              2, // Display 4 columns
                              (colIndex) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      seatTapped[rowIndex][colIndex] = !seatTapped[rowIndex][colIndex];
                                    });
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.amber,
                                        width: 1,
                                      ),
                                      color: seatTapped[rowIndex][colIndex]
                                          ? Colors.yellow
                                          : const Color.fromARGB(255, 87, 74, 29),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    margin: const EdgeInsets.all(4),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: List.generate(
                          8,
                          (rowIndex) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              2, // Display 4 columns
                              (colIndex) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      seatTapped[rowIndex][colIndex + 4] = !seatTapped[rowIndex][colIndex + 4];
                                    });
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.amber,
                                        width: 1,
                                      ),
                                      color: seatTapped[rowIndex][colIndex + 4]
                                          ? Colors.yellow
                                          : const Color.fromARGB(255, 87, 74, 29),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    margin: const EdgeInsets.all(4),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            left:40,
            child: Row(
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=>Payment()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 10),
                ), 
                child:Row(
                  children: <Widget>[
                  const SizedBox(width: 10,),
                  Text('Submit', style: Styles.headLineStyle4),
                 ],
                ),
               )
              ],
            ),
          )
        ],
      ),
    );
  }
}
