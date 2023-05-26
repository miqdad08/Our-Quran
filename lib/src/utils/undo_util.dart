import 'package:flutter/material.dart';

class UndoUtil{

  void undoList(int index, VoidCallback onEvent, BuildContext context,) {
    final snackBar = SnackBar(
      content: Text('Hapus Koordinat ${index + 1}'),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Batalkan',
        onPressed: (){},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
