import 'package:flutter/material.dart';

class WidgetScreen extends StatefulWidget {
  const WidgetScreen({super.key});

  @override
  State<WidgetScreen> createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  final List<String> itemsGuardats = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
  ];
  final List<String> itemsDescartats = [];
  final List<String> itemsRealitzats = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Widget Screen")),
      body: Column(
        children: [
          const SizedBox(height: 5),
          Text("Llista de items"),
          Expanded(
            child: ListView.builder(
              itemCount: itemsGuardats.length,
              itemBuilder: (context, index) {
                final item = itemsGuardats[index];

                return Dismissible(
                  key: Key(item), // Clave única por elemento
                  background: Container(
                    color: Colors.green,
                    child: const Icon(Icons.check),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    child: const Icon(Icons.cancel),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      itemsGuardats.removeAt(index);
                      if (direction == DismissDirection.endToStart) {
                        itemsDescartats.add(item);
                      } else {
                        itemsRealitzats.add(item);
                      }
                    });
                  },
                  child: ListTile(title: Text(item)),
                );
              },
            ),
          ),

          const Divider(thickness: 3),
          const Text(
            "Elements realitzats",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itemsRealitzats.length,
              itemBuilder: (context, index) {
                final item = itemsRealitzats[index];

                return ListTile(
                  leading: const Icon(Icons.check_circle, color: Colors.green),
                  title: Text(item),
                  trailing: IconButton(
                    icon: const Icon(Icons.restore),
                    onPressed: () {
                      setState(() {
                        final itemRecuperat = itemsRealitzats.removeAt(index);
                        itemsGuardats.add(itemRecuperat);
                      });
                    },
                  ),
                );
              },
            ),
          ),

          const Divider(thickness: 3),
          const Text(
            "Elements descartats",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itemsDescartats.length,
              itemBuilder: (context, index) {
                final item = itemsDescartats[index];

                return ListTile(
                  leading: const Icon(Icons.cancel, color: Colors.red),
                  title: Text(
                    item,
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.restore),
                    onPressed: () {
                      setState(() {
                        final itemRecuperat = itemsDescartats.removeAt(index);
                        itemsGuardats.add(itemRecuperat);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          const Divider(thickness: 3),
const SizedBox(height: 5),
const Text("Llista ordenable"),
Expanded(
  child: ReorderableListView(
    buildDefaultDragHandles: false,
    header: const Text("Capçalera de la llista"),
    onReorder: (oldIndex, newIndex) {
      setState(() {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final item = itemsGuardats.removeAt(oldIndex);
        itemsGuardats.insert(newIndex, item);
      });
    },
    children: [

      for (int i = 0; i < itemsGuardats.length; i++)
        ListTile(
          key: ValueKey(itemsGuardats[i]),
          title: Text("Item: ${itemsGuardats[i]}"),
          trailing: ReorderableDragStartListener(
            index: i,
            child: const Icon(
              Icons.open_with,
              color: Color.fromARGB(255, 4, 146, 134),
            ),
          ),
        ),
    ],
  ),
),
        ],
      ),
    );
  }
}
