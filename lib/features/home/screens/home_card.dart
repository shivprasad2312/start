import 'package:flutter/material.dart';
import 'package:start/constants/global_variable.dart';
import 'package:intl/intl.dart';
import 'package:start/features/search/screens/search_screen.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({super.key});

  @override
  State<HomeCard> createState() => _TicketViewState();
}

class _TicketViewState extends State<HomeCard> {

  final TextEditingController _dateController = TextEditingController();
  int? selectedPassengers;
  String? selectedFlightClass;
  String name="";

void navigateToSearchScreen(String query){
    Navigator.pushNamed(context, SearchScreen.routeName,arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width*0.85,
      // height: 400,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child:Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.95,
              height: 400,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 40, 103, 230),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(21),
                topRight: Radius.circular(21),
                bottomLeft: Radius.circular(21),
                bottomRight: Radius.circular(21),),
                
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                    children:<Widget> [
                      const Icon(Icons.arrow_back_ios_outlined),
                      const SizedBox(width: 5,),
                      Text('One Way',style: Styles.headLineStyle4,),
                      ],
                  ),

                  Row(
                    children:<Widget> [
                      const Icon(Icons.roundabout_right_outlined),
                      const SizedBox(width: 5,),
                      Text('Round Trip',style: Styles.headLineStyle4,),
                      ],
                  ),

                  Row(
                    children:<Widget> [
                      const Icon(Icons.arrow_back_ios,),
                      const SizedBox(width: 0,),
                      const SizedBox(width: 5,),
                      Text('MultiCity',style: Styles.headLineStyle4,),
                      ],
                  )

            
                    ],
                  ),

                  const SizedBox(height:20),

                  Container(
                    height: 45,
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey), // Customize the border color
    borderRadius: BorderRadius.circular(10), // Adjust the border radius
  ),
  child: TextFormField(
    onFieldSubmitted: navigateToSearchScreen,
    decoration: const InputDecoration(
      hintText: "From",
      // labelText: "Username", 
      labelStyle: TextStyle(color: Colors.grey), 
      border: InputBorder.none, 
      prefixIcon: Icon(Icons.person, color: Colors.grey), 
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return "Username can't be empty!";
      }
      return null;
    },
    onChanged: (value) {
      name = value;
      setState(() {});
    },
  ),
),

const SizedBox(height: 10,),



                Container(
                    height: 45,
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey), // Customize the border color
    borderRadius: BorderRadius.circular(10), // Adjust the border radius
  ),
  child: TextFormField(
    decoration: const InputDecoration(
      hintText: "To",
      // labelText: "Username", 
      labelStyle: TextStyle(color: Colors.grey), 
      border: InputBorder.none, 
      prefixIcon: Icon(Icons.person, color: Colors.grey), 
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return "Username can't be empty!";
      }
      return null;
    },
    onChanged: (value) {
      name = value;
      setState(() {});
    },
  ),
),
const SizedBox(height: 10,),


Container(
  height: 40,
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey), // Customize the border color
    borderRadius: BorderRadius.circular(10), // Adjust the border radius
  ),
  child: Row(
    children: [
      TextButton(
        onPressed: () {
          // Show the date picker when the button is pressed
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          ).then((selectedDate) {
            if (selectedDate != null) {
              // Format the selected date and update the TextEditingController
              final formattedDate = DateFormat('E, MMM d').format(selectedDate);
              _dateController.text = formattedDate;
            }
          });
        },
        child: const Icon(Icons.calendar_today, color: Colors.grey), // Customize the calendar icon and its color
      ),
      const SizedBox(width: 8), // Add some spacing between the calendar icon and the TextFormField
      Expanded(
        child: TextFormField(
          controller: _dateController, // Use the TextEditingController
          decoration: const InputDecoration(
            hintText: "From",
            labelStyle: TextStyle(color: Colors.grey), // Customize the label text color
            border: InputBorder.none, // Remove the default border
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Date can't be empty!";
            }
            return null;
          },
          onChanged: (value) {
            name = value;
            setState(() {});
          },
        ),
      ),
    ],
  ),
),
SizedBox(height: 10,),




Container(
  height: 45,
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey), // Customize the border color
    borderRadius: BorderRadius.circular(10), // Adjust the border radius
  ),
  child: DropdownButtonFormField<int>(
    decoration: const InputDecoration(
      hintText: "Number of Passengers",
      labelStyle: TextStyle(color: Colors.grey),
      border: InputBorder.none,
      prefixIcon: Icon(Icons.person, color: Colors.grey),
    ),
    value: selectedPassengers,
    onChanged: (newValue) {
      setState(() {
        selectedPassengers = newValue;
      });
    },
    validator: (value) {
      if (value == null) {
        return "Please select the number of passengers";
      }
      return null;
    },
    items: List.generate(10, (index) {
      return DropdownMenuItem<int>(
        value: index + 1,
        child: Text(
          (index + 1).toString(),
          style: const TextStyle(fontSize: 16, color: Colors.black), // Customize text style
        ),
      );
    }),
    style: const TextStyle(fontSize: 16, color: Colors.black), // Customize overall style
    icon: const Icon(Icons.arrow_drop_down, color: Colors.grey), // Customize the dropdown icon
    isExpanded: true, // Make the dropdown button expand to the full width
  ),
),
SizedBox(height: 10,),


Container(
  height: 45,
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey), // Customize the border color
    borderRadius: BorderRadius.circular(10), // Adjust the border radius
  ),
  child: Stack(
    children: [
      DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: "Flight Class",
          labelText: "", // Clear the labelText
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none, // Remove the default border
          ),
          prefixIcon: Icon(Icons.airplanemode_active, color: Colors.grey),
        ),
        value: selectedFlightClass,
        onChanged: (newValue) {
          setState(() {
            selectedFlightClass = newValue;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please select a flight class";
          }
          return null;
        },
        items: ["Economy", "Business", "First Class"].map((flightClass) {
          return DropdownMenuItem<String>(
            value: flightClass,
            child: Text(
              flightClass,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          );
        }).toList(),
        style: TextStyle(fontSize: 16, color: Colors.black),
        icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
        isExpanded: true,
      ),
      if (selectedFlightClass != null)
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              selectedFlightClass ?? "",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ),
    ],
  ),
),
SizedBox(height: 10,),


ElevatedButton(
  onPressed: () {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => FlightScreen()),
    // );
  },
  style: ElevatedButton.styleFrom(
    primary: Colors.orange,
    onPrimary: Colors.black,
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
  ),
  child: Row(
    children: <Widget>[
      const SizedBox(width: 10,),
      Text('Submit', style: Styles.headLineStyle4),
    ],
  ),
)



                ],
              ),
            ),
                ],

                
              ),
            ),

        
        );
  }
}