import 'package:flutter/material.dart';
import 'package:nineti/domain/repository/consumption_repository_impl.dart';
import 'package:nineti/presentation/consumption_view_model.dart';
import 'package:provider/provider.dart';
import 'domain/repository/consumptionUseCaseImpl.dart';
import 'presentation/consumption_page.dart';

void main() {
  final repository = ConsumptionRepositoryImpl();
  final useCase = ConsumptionUseCaseImpl(repository);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ConsumptionViewModel(useCase: useCase),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nineti',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ConsumptionPage(),
    );
  }
}
