import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const FlamesApp());
}

class FlamesApp extends StatelessWidget {
  const FlamesApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Finals Activity 4 - Group 5';
    return MaterialApp(title: appTitle, home: const FlamesFormWidget());
  }
}

class FlamesFormWidget extends StatefulWidget {
  const FlamesFormWidget({super.key});

  @override
  State<FlamesFormWidget> createState() => _FlamesFormWidgetState();
}

class _FlamesFormWidgetState extends State<FlamesFormWidget> {
  final _firstNameController = TextEditingController();
  final _secondNameController = TextEditingController();

  String _displayText = '';
  String _relationshipStatus = '';
  List<String> _savedResults = [];

  @override
  void dispose() {
    _firstNameController.dispose();
    _secondNameController.dispose();
    super.dispose();
  }

  void _showNamesDialog() {
    final first = _firstNameController.text.trim();
    final second = _secondNameController.text.trim();
    final rel = computeFlames(first, second);

    setState(() {
      _relationshipStatus = rel;
      _displayText =
          'Name 1: $first\nName 2: $second\nRelationship: $_relationshipStatus';
    });

    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Entered names'),
        content: Text(
          _displayText.isEmpty ? 'No input provided.' : _displayText,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> _saveResult() async {
    final first = _firstNameController.text.trim();
    final second = _secondNameController.text.trim();
    final rel = computeFlames(first, second);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('first', first);
    await prefs.setString('second', second);

    final entry = 'Name 1: $first\nName 2: $second\nRelationship: $rel';

    final existing = prefs.getStringList('results') ?? <String>[];
    existing.add(entry);
    await prefs.setStringList('results', existing);

    setState(() {
      _relationshipStatus = rel;
      _displayText = entry;
      _savedResults = existing;
    });
  }

  Future<void> _clearResults() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('first');
    await prefs.remove('second');
    await prefs.remove('results');

    setState(() {
      _firstNameController.clear();
      _secondNameController.clear();
      _relationshipStatus = '';
      _displayText = '';
      _savedResults.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Finals Activity 4 - Group 5';

    return Scaffold(
      backgroundColor: _scaffoldColor(),
      appBar: AppBar(
        title: const Text(appTitle, style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 2, 45, 121),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'FLAMES',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter name 1',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _secondNameController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter name 2',
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    key: const Key('saveBtn'),
                    onPressed: _saveResult,
                    child: const Text('Save'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    key: const Key('clearBtn'),
                    onPressed: _clearResults,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 188, 188),
                    ),
                    child: const Text('Clear'),
                  ),
                ],
              ),
              if (_displayText.isNotEmpty)
                Card(
                  key: const Key('resCard'),
                  color: _resColor(),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      _displayText,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              if (_savedResults.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 8),
                    const Text(
                      'Saved results:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ..._savedResults.map(
                      (r) => Card(
                        color: _resColorForTxt(r),
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(r, style: const TextStyle(fontSize: 16)),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('fab'),
        onPressed: _showNamesDialog,
        tooltip: 'Show names',
        child: const Icon(Icons.send),
      ),
    );
  }

  Color _resColor() {
    switch (_relationshipStatus) {
      case 'Friends':
        return Colors.green.shade100;
      case 'Lovers':
        return Colors.pink.shade100;
      case 'Affection':
        return Colors.purple.shade100;
      case 'Marriage':
        return Colors.blue.shade100;
      case 'Enemies':
        return Colors.red.shade100;
      case 'Siblings':
        return Colors.orange.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  Color _resColorForTxt(String e) {
    if (e.contains('Friends')) return Colors.green.shade100;
    if (e.contains('Lovers')) return Colors.pink.shade100;
    if (e.contains('Affection')) return Colors.purple.shade100;
    if (e.contains('Marriage')) return Colors.blue.shade100;
    if (e.contains('Enemies')) return Colors.red.shade100;
    if (e.contains('Siblings')) return Colors.orange.shade100;
    return Colors.grey.shade100;
  }

  Color _scaffoldColor() {
    switch (_relationshipStatus) {
      case 'Friends':
        return Colors.green.shade50;
      case 'Lovers':
        return Colors.pink.shade50;
      case 'Affection':
        return Colors.purple.shade50;
      case 'Marriage':
        return Colors.blue.shade50;
      case 'Enemies':
        return Colors.red.shade50;
      case 'Siblings':
        return Colors.orange.shade50;
      default:
        return Colors.white;
    }
  }

  @override
  void initState() {
    super.initState();
    _loadPreviousResults();
  }

  Future<void> _loadPreviousResults() async {
    final prefs = await SharedPreferences.getInstance();
    final s1 = prefs.getString('first') ?? '';
    final s2 = prefs.getString('second') ?? '';
    final sRes = prefs.getStringList('results') ?? <String>[];
    if (sRes.isNotEmpty) {
      final last = sRes.last;
      String rel = '';
      final idx = last.indexOf('Relationship: ');
      if (idx != -1) {
        rel = last.substring(idx + 'Relationship: '.length).trim();
      }
      setState(() {
        _savedResults = sRes;
        _relationshipStatus = rel;
        _displayText = last;
      });
    }
    if (s1.isNotEmpty || s2.isNotEmpty) {
      _firstNameController.text = s1;
      _secondNameController.text = s2;
      final comp = computeFlames(s1, s2);
      setState(() {
        _relationshipStatus = comp;
        _displayText =
            'Name 1: $s1\nName 2: $s2\nRelationship: $_relationshipStatus';
      });
    }
  }
}

String computeFlames(String a, String b) {
  final s1 = a.replaceAll(' ', '').toLowerCase();
  final s2 = b.replaceAll(' ', '').toLowerCase();

  final f1 = <String, int>{};
  final f2 = <String, int>{};

  for (final ch in s1.split('')) {
    f1[ch] = (f1[ch] ?? 0) + 1;
  }
  for (final ch in s2.split('')) {
    f2[ch] = (f2[ch] ?? 0) + 1;
  }

  int count = 0;
  final keys = {...f1.keys, ...f2.keys};
  for (final k in keys) {
    count += ((f1[k] ?? 0) - (f2[k] ?? 0)).abs();
  }

  if (count == 0) return 'Siblings';

  final items = ['F', 'L', 'A', 'M', 'E', 'S'];
  var idx = 0;
  while (items.length > 1) {
    idx = (idx + count - 1) % items.length;
    items.removeAt(idx);
  }

  switch (items.single) {
    case 'F':
      return 'Friends';
    case 'L':
      return 'Lovers';
    case 'A':
      return 'Affection';
    case 'M':
      return 'Marriage';
    case 'E':
      return 'Enemies';
    case 'S':
      return 'Siblings';
    default:
      return 'Unknown';
  }
}
