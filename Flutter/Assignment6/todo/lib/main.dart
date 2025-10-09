import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const ChecklistApp());
}

class ChecklistApp extends StatelessWidget {
  const ChecklistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checklist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFF8F5F2)),
      home: const ListSelectionPage(),
    );
  }
}

class ListSelectionPage extends StatefulWidget {
  const ListSelectionPage({super.key});

  @override
  State<ListSelectionPage> createState() => _ListSelectionPageState();
}

class _ListSelectionPageState extends State<ListSelectionPage> {
  List<Map<String, dynamic>> lists = [];

  @override
  void initState() {
    super.initState();
    _loadLists();
  }

  Future<File> _getLocalFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/checklist_data.json');
  }

  Future<void> _saveLists() async {
    final file = await _getLocalFile();
    await file.writeAsString(jsonEncode(lists));
  }

  Future<void> _loadLists() async {
    try {
      final file = await _getLocalFile();
      if (await file.exists()) {
        final data = await file.readAsString();
        setState(() {
          lists = List<Map<String, dynamic>>.from(jsonDecode(data));
        });
      } else {
        lists = [
          {
            'name': 'Personal',
            'tasks': [
              {'title': 'Drink 8 glasses of water', 'completed': false},
              {'title': 'Meditate for 10 minutes', 'completed': false},
              {'title': 'Read a chapter of a book', 'completed': false},
              {'title': 'Go for a 30-minute walk', 'completed': false},
              {'title': 'Write in a gratitude journal', 'completed': false},
            ],
          },
        ];
        await _saveLists();
      }
    } catch (e) {
      debugPrint('Error loading lists: $e');
    }
  }

  void _addList(String name) {
    if (name.trim().isEmpty) return;
    setState(() {
      lists.add({'name': name, 'tasks': []});
    });
    _saveLists();
  }

  void _showAddListDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("New List"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "Enter list name"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              _addList(controller.text);
              Navigator.pop(context);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteList(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete List"),
        content: Text(
          "Are you sure you want to delete '${lists[index]['name']}'?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                lists.removeAt(index);
              });
              _saveLists();
              Navigator.pop(context);
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _openChecklist(Map<String, dynamic> list) async {
    final updatedList = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChecklistPage(
          title: list['name'],
          initialTasks: List<Map<String, dynamic>>.from(list['tasks']),
        ),
      ),
    );
    if (updatedList != null) {
      setState(() {
        list['tasks'] = updatedList;
      });
      await _saveLists();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Lists'),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddListDialog,
        backgroundColor: Colors.black87,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.builder(
          itemCount: lists.length,
          itemBuilder: (context, index) {
            final list = lists[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                title: Text(list['name'], style: const TextStyle(fontSize: 18)),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _confirmDeleteList(index),
                ),
                onTap: () => _openChecklist(list),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ChecklistPage extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> initialTasks;
  final ValueChanged<List<Map<String, dynamic>>>? onChanged;

  const ChecklistPage({
    super.key,
    required this.title,
    required this.initialTasks,
    this.onChanged,
  });

  @override
  State<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  late List<Map<String, dynamic>> tasks;

  @override
  void initState() {
    super.initState();
    tasks = widget.initialTasks;
  }

  void _addTask(String title) {
    if (title.trim().isEmpty) return;
    setState(() {
      tasks.insert(0, {'title': title, 'completed': false});
    });
  }

  void _showAddTaskDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("New Task"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "Enter task name"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              _addTask(controller.text);
              Navigator.pop(context);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteTask(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Task"),
        content: Text("Are you sure you want to delete this task?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                tasks.removeAt(index);
              });
              widget.onChanged?.call(tasks);
              Navigator.pop(context);
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final activeTasks = tasks.where((t) => !t['completed']).toList();
    final completedTasks = tasks.where((t) => t['completed']).toList();

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, tasks);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.black87,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showAddTaskDialog,
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Active tasks
              ...List.generate(
                activeTasks.length,
                (index) => _buildTaskTile(activeTasks[index], index),
              ),

              if (completedTasks.isNotEmpty) ...[
                const SizedBox(height: 20),
                const Text(
                  'COMPLETED',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 6),
                ...List.generate(
                  completedTasks.length,
                  (index) => _buildTaskTile(
                    completedTasks[index],
                    activeTasks.length + index,
                  ),
                ),
              ],
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskTile(Map<String, dynamic> task, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: CheckboxListTile(
          title: Text(
            task['title'],
            style: TextStyle(
              fontSize: 16,
              color: task['completed'] ? Colors.grey : Colors.black,
              decoration: task['completed']
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          value: task['completed'],
          onChanged: (value) {
            setState(() {
              task['completed'] = value!;
            });
            widget.onChanged?.call(tasks);
          },
          secondary: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => _confirmDeleteTask(index),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.black87,
        ),
      ),
    );
  }
}
