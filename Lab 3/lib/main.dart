import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home_screen.dart';
import 'bloc/bloc.dart';
import 'data/product_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductBloc(repository: ProductRepository())
            ..add(const LoadProducts()),
      child: MaterialApp(
        title: 'Street Clothes',
        theme: ThemeData(
          fontFamily: 'Metropolis',
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
