import 'package:flutter/material.dart';

class WidgetScreen extends StatefulWidget {
  const WidgetScreen({super.key});

  @override
  State<WidgetScreen> createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  final List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget Screen"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Dismissible(
            key: Key(item), // Clave única por elemento
            background: Container(
              color: Colors.green,
              alignment: Alignment.centerLeft,
              child: const Icon(Icons.check, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(Icons.cancel, color: Colors.white),
            ),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
              if (direction == DismissDirection.endToStart) {
                debugPrint("$item descartat cap a la esquerra");
              } else {
                debugPrint("$item descartat cap a la dreta");
              }
            },
            child: ListTile(
              title: Text(item),
              tileColor: Colors.black26,
            ),
          );
        },
      ),
    );
  }
}