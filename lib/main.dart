import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/weather/presentation/screens/search_screen/search_screen.dart';
import 'package:weather_app/internal/dependecies/get_it.dart';
import 'package:weather_app/internal/helpers/utils.dart';

void main() {

   WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SearchScreen(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int timestamp = 1679119726;
  late var date;

  @override
  void initState() {
    date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var d24 = DateFormat("HH:mm").format(date);
    print("d24 ============== ${date}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(convertDate(timestamp)),
      ),
    );
  }
}