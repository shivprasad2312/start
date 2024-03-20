import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start/constants/global_variable.dart';
import 'package:start/features/admin/screens/admin_screen.dart';
import 'package:start/features/auth/screens/auth_screen.dart';
import 'package:start/features/auth/services/auth_service.dart';
import 'package:start/features/auth/widgets/bottom_bar.dart';
import 'package:start/features/home/screens/home_screen.dart';
import 'package:start/providers/user_provider.dart';
import 'package:start/router.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: ((context) => UserProvider())
      )
  ],
    child: const MyApp()));

  // runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState()
  {
    super.initState();
    authService.getUserData(context);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary:GlobalVariables.secondaryColor ),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      // home:Provider.of<UserProvider>(context).user.token.isNotEmpty 
      //     ? Provider.of<UserProvider>(context).user.type=="user"
      //         ? const BottomBar()
      //         : AdminScreen()
      // :const AuthScreen(),
      home:HomeScreen(),
      // home:Scaffold(
      //   body: AuthScreen(),
      // ),
    );
  }


  
} 
