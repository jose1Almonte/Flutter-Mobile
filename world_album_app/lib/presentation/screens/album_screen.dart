import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_album_app/domain/entities/pages.dart';
import 'package:world_album_app/helpers/get_pages.dart';
import 'package:world_album_app/presentation/providers/album_provider.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

// class _AlbumScreenState extends State<AlbumScreen> {
//   final List<String> items = ["option1", "option2","option3"];
//   // String? selectedValue;

//   @override
//   Widget build(BuildContext context) {
//     final albumprovider = context.watch<AlbumProvider>();
//     final getPages = GetPages();
//     List<Pages> myPages = getPages.getAllPages();
    
//     return Column(
//       children: [
//         DropdownButton(
//           value: albumprovider.selectedItem,
//           hint: const Text('Select an item'),
//           items: myPages.map((Pages page) {
//             return DropdownMenuItem<String>(
//               value: page,
//               child: Text(page.country));
//             }).toList(),
//           onChanged: (value) {
//             albumprovider.changeItem(value,);
//         },),
//         Text((albumprovider.pageNumber != null)? albumprovider.pageNumber:'');
//       ],
//     );
//   }
// }

class _AlbumScreenState extends State<AlbumScreen> {

  @override
  Widget build(BuildContext context) {
    final albumprovider = context.watch<AlbumProvider>();
    final getPages = GetPages();
    List<Pages> myPages = getPages.getAllPages();
    
    return Column(
      children: [
        DropdownButton<Pages>(
          value: myPages.any((p) => p.country == albumprovider.selectedItem)
              ? myPages.firstWhere((p) => p.country == albumprovider.selectedItem)
              : null,
          hint: const Text('Select an item'),
          items: myPages.map((Pages page) {
            return DropdownMenuItem<Pages>(
              value: page, 
              child: Text(page.country),
            );
          }).toList(),
          onChanged: (Pages? value) {
            if (value != null) {
              albumprovider.changeItem(value.country, value.page);
            }
          },
        ),
        Text((albumprovider.pageNumber != null) ? albumprovider.pageNumber.toString() : ''),
      ],
    );
  }
}