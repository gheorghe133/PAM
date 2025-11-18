import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

// Presentation Layer
import 'presentation/bloc/bloc.dart';
import 'presentation/screens/home_screen_new.dart';

// Data Layer
import 'data/datasources/remote_data_source.dart';
import 'data/repositories/feed_repository_impl.dart';

// Domain Layer
import 'domain/repositories/feed_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final httpClient = http.Client();
    final remoteDataSource = RemoteDataSource(client: httpClient);

    final FeedRepository feedRepository = FeedRepositoryImpl(
      remoteDataSource: remoteDataSource,
    );

    return BlocProvider(
      create: (context) =>
          FeedBloc(repository: feedRepository)..add(const LoadFeed()),
      child: MaterialApp(
        title: 'Street Clothes',
        theme: ThemeData(
          fontFamily: 'Metropolis',
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const HomeScreenNew(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
