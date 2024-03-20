import 'package:flutter/material.dart';
import 'package:start/common/widgets/loader.dart';
import 'package:start/constants/global_variable.dart';
import 'package:start/features/admin/screens/add_product.dart';
import 'package:start/features/admin/services/admin_services.dart';
import 'package:start/features/auth/widgets/app_layout.dart';
import 'package:start/features/auth/widgets/thick_container.dart';
import 'package:start/models/product.dart';

class TicketView extends StatefulWidget {
  const TicketView({super.key});

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  final AdminServices adminServices = AdminServices();
  List<Product>? products;

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSized(context);
    String fromCity = "NYC"; // Default value

    if (products != null && products!.isNotEmpty) {
      // Check if products list is not empty
      fromCity = products![0].from; // Assuming 'city' is the property you want to use
    }

    return products == null
        ? Loader()
        : SizedBox(
            width: size.width * 0.9,
            height: 200,
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF526799),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(21),
                          topRight: Radius.circular(21)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "From",
                              style: Styles.headLineStyle1.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "To",
                              style: Styles.headLineStyle1.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              fromCity, // Replace "NYC" with the value from products
                              style: Styles.headLineStyle3.copyWith(
                                color: Colors.yellow,
                              ),
                            ),
                            const Spacer(),
                            const ThickContainer(),
                            const Spacer(),
                            Transform.rotate(
                              angle: 1.5,
                              child: const Icon(
                                Icons.local_airport_rounded,
                                color: Colors.orange,
                              ),
                            ),
                            const Spacer(),
                            const ThickContainer(),
                            const Spacer(),
                            Text(
                              "LON",
                              style: Styles.headLineStyle3.copyWith(
                                color: Colors.yellow,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "New-York",
                              style: Styles.headLineStyle4.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "2H 30M",
                              style: Styles.headLineStyle3.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "London",
                              style: Styles.headLineStyle4.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  Container(
              decoration: BoxDecoration(
                color: Styles.orangeColor,
                borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(21),bottomRight: Radius.circular(21))
              ),
              padding: const EdgeInsets.all(16),

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("1 MAY",style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                              Text("Date",style: Styles.headLineStyle4.copyWith(color: Colors.white),),
                            ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("08:00",style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                              Text("Departure  Time",style: Styles.headLineStyle4.copyWith(color: Colors.white),),
                            ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("23",style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                              Text("Number",style: Styles.headLineStyle4.copyWith(color: Colors.white),),
                            ],
                      )
                      
                    ],
                  )
                ],
              ),
            ),

            
          ],
        ),
      ),
    );

                  // ... (rest of your code)
                
  }
}
