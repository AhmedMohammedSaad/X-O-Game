// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List ListBlyer = ["", "", "", "", "", "", "", "", ""];
//   List winar = [
//     0,
//     0,
//     0,
//     0,
//     0,
//     0,
//     0,
//     0,
//   ];
//   bool iswinar = false;

//   String blyer = "X";
//   String lastblayer = "";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text(
//           "Xo",
//           style: TextStyle(fontSize: 35, color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Text(
//             "the blye is $blyer",
//             style: const TextStyle(fontSize: 35, color: Colors.white),
//           ),
//           const SizedBox(
//             height: 30,
//           ),
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//                 crossAxisCount: 3,
//               ),
//               itemCount: 9,
//               itemBuilder: (BuildContext context, index) {
//                 return GestureDetector(
//                   onTap: iswinar
//                       ? null
//                       : () {
//                           setState(() {
//                             iswinar = getwenar(index);
//                             if (ListBlyer[index] == "") {
//                               if (blyer == "X") {
//                                 ListBlyer[index] = "X";
//                                 blyer = "O";
//                                 lastblayer = "X";
//                               } else {
//                                 ListBlyer[index] = "O";
//                                 blyer = "X";
//                                 lastblayer = "O";
//                               }
//                             }
//                           });
//                         },
//                   child: Container(
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         gradient: const LinearGradient(colors: [
//                           Color.fromARGB(255, 20, 167, 71),
//                           Color.fromARGB(255, 0, 0, 0),
//                           Color.fromARGB(255, 170, 3, 3),
//                         ])),
//                     width: 10,
//                     height: 10,
//                     child: Text(
//                       ListBlyer[index],
//                       style: TextStyle(fontSize: 50, color: Colors.white),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Text(
//             "the winar is: ${iswinar ? lastblayer : ""}",
//             style: TextStyle(fontSize: 50, color: Colors.white),
//           ),
//           ElevatedButton.icon(
//             onPressed: () {
//               setState(() {
//                 blyer = "X";
//                 ListBlyer = ["", "", "", "", "", "", "", "", ""];
//                 lastblayer = "";
//                 winar = [0, 0, 0, 0, 0, 0, 0, 0];
//                 iswinar = false;
//               });
//             },
//             icon: Icon(Icons.refresh),
//             label: Text("Reset"),
//           ),
//           SizedBox(
//             height: 60,
//           ),
//         ],
//       ),
//     );
//   }

//   getwenar(int i) {
//     int sum = blyer == "X" ? 1 : -1;

//     int row = i ~/ 3;
//     int col = i % 3;
//     winar[row] += sum;
//     winar[col + 3] += sum;
//     if (row == col) {
//       winar[6] += sum;
//     } else {
//       winar[7] += sum;
//     }
//     if (winar.contains(3) || winar.contains(-3)) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
