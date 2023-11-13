import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flutter_bloc/bloc/cart_bloc.dart';
import 'package:flutter_flutter_bloc/bloc/cart_provider.dart';
import 'package:flutter_flutter_bloc/catalog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CartProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcom'),
      ),
      body: Center(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Catalog()),
            );
          },
          child: Text('Enter'),
        ),
      ),
    );
  }
}
