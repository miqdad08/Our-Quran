import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SearchAyatBox extends StatefulWidget {
  final TextEditingController controller;
  final ItemScrollController itemScrollController;
  VoidCallback onCancel;

   SearchAyatBox(
      {Key? key,
      required this.controller,
      required this.onCancel, required this.itemScrollController})
      : super(key: key);

  @override
  State<SearchAyatBox> createState() => _SearchAyatBoxState();
}

class _SearchAyatBoxState extends State<SearchAyatBox> {
  @override
  Widget build(BuildContext context) {

    void searchAyat(indexAyat) {
      setState(() {
        widget.itemScrollController.scrollTo(
          index: int.parse(indexAyat),
          duration: const Duration(seconds: 2),
        );
      });
    }

    return AlertDialog(
      content: Container(
        height: 125,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Create New Task',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () => searchAyat(widget.controller.text),
                  child: const Text('Search'),
                ),
                const SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  onPressed: widget.onCancel,
                  child: const Text('Cancel'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
