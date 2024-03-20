import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start/common/widgets/top_categories.dart';
import 'package:start/constants/global_variable.dart';
import 'package:start/features/auth/screens/flight_screen.dart';
import 'package:start/features/home/screens/category_deals_screen.dart';
import 'package:start/features/home/screens/home_card.dart';
import 'package:start/providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='/home';  
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {


  void navigateToCatogeryPage(BuildContext context,String category){
    Navigator.pushNamed(context, CategoryDealsScreen.routeName,arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    final user =Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Stack(
        children:[
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70.0),
              bottomRight: Radius.circular(70.0),
            ),
            child: Image.asset(
              'assets/images/map_img.png', // Replace with your image path
              height: MediaQuery.of(context).size.height / 2,
              fit: BoxFit.cover,
               // You can adjust the fit to your preference
            ),
          ),
           ListView(
          padding: const EdgeInsets.only(left: 20,top: 50,right: 10),
          children: [
            Column(
              children: [
                Row(
                  children: [
                        Row(
                          children: [
                            Image.asset('assets/images/travel.png',width: 40,height: 40,),
                            const SizedBox(width: 10,),
                            Text("Travilo , ${user}",style: Styles.headLineStyle3,),
                          ],
                        ),
                        const SizedBox(width: 220,),
      
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset('assets/images/bell.png',width: 30,height: 30,)
                          ],
                        ),
                        
                      ],
                ),
                const SizedBox(height: 30,),
      
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FlightScreen()),
                        );
                    },
                    
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                    ),
                    child: Row(
                      children:<Widget> [
                        const Icon(Icons.bus_alert_outlined),
                        const SizedBox(width: 10,),
                        Text('Bus',style: Styles.headLineStyle4,),
                      
                      ],
                    )
                      
                  ),
                      
                  ElevatedButton(
                    onPressed: () {
                      // Define the action to be taken when the button is pressed.
                      // You can add your logic here.
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10)
                    ),
                    child: Row(
                      children:<Widget> [
                        const Icon(Icons.train_outlined),
                        const SizedBox(width: 10,),
                        Text('Metro',style: Styles.headLineStyle4,),
                      
                      ],
                    )
                  ),
                      
                    ],
                  ),
                ),

                

                
                
              ],

            ),
            
          //   const SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   padding: EdgeInsets.only(left: 20),
          //   child: Row(
          //     children: [
          //       TicketView(),
          //       TicketView(),
          //     ],
          //   ),
          // ),
          SizedBox(height:30),
          HomeCard(),

        //   SizedBox(height:30),
        //    Row(
        //   children: [
        //     TopCategories(),
        //   ],
        // )
          ],
        ),

        ],
      )
    );
  }
}