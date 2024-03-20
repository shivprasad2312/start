import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:start/constants/global_variable.dart';
import 'package:start/features/admin/screens/add_product.dart';
import 'package:start/features/admin/services/admin_services.dart';
import 'package:start/features/auth/screens/seat_screen.dart';
import 'package:start/features/auth/widgets/app_layout.dart';
import 'package:start/features/auth/widgets/thick_container.dart';
import 'package:start/models/product.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        setState(() {
          products!.removeAt(index);
        });
      },
    );
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProduct.routeName);
  }

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

  String fromCity = "NYC"; // Default value
  String dropdownvalue = 'Price';

  var items = ['Price', 'Time'];

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSized(context);

    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
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
                  ),
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
                    topLeft: Radius.circular(21),
                    topRight: Radius.circular(21),
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
                        Text(
                          "12 flights are available from New York to London",
                          style: Styles.headLineStyle4.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to the seating screen when the ticket is clicked.
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SeatScreen()));
                      },
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            if (products != null)
                              for (int index = 0; index < products!.length; index++)
                                SizedBox(
                                  width: size.width * 0.9,
                                  height: 260,
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 16),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF526799),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(21),
                                              topRight: Radius.circular(21),
                                            ),
                                          ),
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            children: [
                                              IconButton(
                                                onPressed: () => deleteProduct(products![index], index),
                                                icon: const Icon(
                                                  Icons.delete_outlined,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "From",
                                                    style: Styles.headLineStyle2.copyWith(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    "To",
                                                    style: Styles.headLineStyle2.copyWith(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    products![index].from,
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
                                                  ),
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
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(21),
                                              bottomRight: Radius.circular(21),
                                            ),
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
                                                      Text(
                                                        "1 MAY",
                                                        style: Styles.headLineStyle3.copyWith(color: Colors.white),
                                                      ),
                                                      Text(
                                                        "Date",
                                                        style: Styles.headLineStyle4.copyWith(color: Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "08:00",
                                                        style: Styles.headLineStyle3.copyWith(color: Colors.white),
                                                      ),
                                                      Text(
                                                        "Departure Time",
                                                        style: Styles.headLineStyle4.copyWith(color: Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        "23",
                                                        style: Styles.headLineStyle3.copyWith(color: Colors.white),
                                                      ),
                                                      Text(
                                                        "Number",
                                                        style: Styles.headLineStyle4.copyWith(color: Colors.white),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: navigateToAddProduct,
        tooltip: 'Add a Product',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
