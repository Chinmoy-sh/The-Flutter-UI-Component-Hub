import 'package:flutter/material.dart';

/// A reusable custom text field widget.
/// It takes a controller and an onChanged callback for flexible use.
class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.hintText = '',
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(22)),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ), // Adjusted padding
      ),
    );
  }
}





// class DashBoardPage extends StatefulWidget {
//   const DashBoardPage({super.key});

//   @override
//   State<DashBoardPage> createState() => _DashBoardPageState();
// }

// class _DashBoardPageState extends State<DashBoardPage> {
//   late TextEditingController _searchController;
//   @override
//   void initState() {
//     super.initState();
//     _searchController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade200,
//         elevation: 7,
//         centerTitle: true,
//         title: const Text('School Base', style: TextStyle(fontSize: 26)),
//         leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
//         actions: <Widget>[
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.account_circle_rounded),
//           ),
//           IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
//           const SizedBox(width: 5),
//         ],
//       ),
//       body: Column(
//         children: <Widget>[
//           const SizedBox(height: 7),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 16.0,
//             ), // Added horizontal padding for better aesthetics
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   // Wrap CustomTextField with Expanded to prevent overflow in Row
//                   child: CustomTextField(
//                     labelText: 'Search',
//                     controller: _searchController,
//                     onChanged: (String value) {
//                       // Handle search text changes if needed
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }