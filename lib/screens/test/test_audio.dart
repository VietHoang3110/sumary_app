// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_sliders/sliders.dart';
//
// import 'package:syncfusion_flutter_core/theme.dart';
//
// /// This widget will be the root of application.
//
// /// This widget is the home page of the application.
// class MyHomePage extends StatefulWidget {
//   /// Initialize the instance of the [MyHomePage] class.
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   double _value = 6.0;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             body: Center(
//                 child: SfSliderTheme(
//                   data: SfSliderThemeData(
//                       thumbStrokeWidth: 3,
//                       thumbStrokeColor: Colors.red
//                   ),
//                   child: SfSlider(
//                     min: 2.0,
//                     max: 10.0,
//                     value: _value,
//                     onChanged: (dynamic newValue){
//                       setState(() {
//                         _value = newValue;
//                       });
//                     },
//                   ),
//                 )
//             )
//         )
//     );
//   }
// }
//
// /// Storing the spline series data points.
// class Data {
//   /// Initialize the instance of the [Data] class.
//   Data({required this.x, required this.y});
//
//   /// Spline series x points.
//   final DateTime x;
//
//   /// Spline series y points.
//   final double y;
// }