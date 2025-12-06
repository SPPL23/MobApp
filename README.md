# MobApp
---
# E-waste Blog ♻️
---
> [!CAUTION]
> Following the requirements for our Final Output for Mobile App Development
> The group is required to create an APP that is either related to the previous Mid Terms Output or another SDG *Sustainable Development Goals*
> Make sure to run flutter pub get or flutter pub update in order for the imported modules to work with the code
---
> [!NOTES]
> Currently, the mobile app has 3 navigation buttons at the bottom.
> 1. The main page currently exists, but only contains Cards, and Strings of random facts/trivia about E-Waste
> 2. The game page is now fully functional and can store local data using the sharedPreference module
> 3. Blank page is still empty, trying to come up with ideas to display on Blank page
---
> [!IMPORTANT]
> Example:
>
> Enter Player Name: [                                                     ]
> 
> ![PlayerName](https://img.shields.io/badge/PLAYER%3A%20playername-blue?style=for-the-badge)
> 
> ![Score](https://img.shields.io/badge/SCORE%3A%203-blue?style=for-the-badge)
> 
> ![Attempts](https://img.shields.io/badge/ATTEMPTS%3A%203%2F3-blue?style=for-the-badge)
> 
> ![CurrentWord](https://img.shields.io/badge/Diaper-yellow?style=for-the-badge)
> 
> ![Dispose](https://img.shields.io/badge/Dispose-red?style=for-the-badge) ![Recycle](https://img.shields.io/badge/Recycle-green?style=for-the-badge)

> [!TIP]
> if Player chooses Dispose, the background color will flash green signifying that the answer was correct ✅
> 
> if Player chooses Recycle, the background color will flash red signifying that the answer was wrong ❌
---
> [!WARNING]
> The third button currently is a placeholder.
>
> No concept/idea has been come up yet.
---
## App Preview
---
![MobAppPreview](https://i.imgur.com/5AN4RpZ.png)
---
## Code Snippet
---
## Updated Game Page by adding a new callable class inside main class
## 12/6/2025
---
> ```
> import 'dart:convert';
> import 'dart:math';
> import 'package:flutter/material.dart';
> import 'package:shared_preferences/shared_preferences.dart';
> 
> void main() => runApp(const NavigationBarApp());
> 
> class NavigationBarApp extends StatelessWidget {
>   const NavigationBarApp({super.key});
> 
>   @override
>   Widget build(BuildContext context) {
>     return const MaterialApp(home: NavigationExample());
>   }
> }
> 
> class NavigationExample extends StatefulWidget {
>   const NavigationExample({super.key});
> 
>   @override
>   State<NavigationExample> createState() => _NavigationExampleState();
> }
> 
> class _NavigationExampleState extends State<NavigationExample> {
>   int currentPageIndex = 0;
> 
>   @override
>   Widget build(BuildContext context) {
>     final ThemeData theme = Theme.of(context);
>     return Scaffold(
>       bottomNavigationBar: NavigationBar(
>         onDestinationSelected: (int index) {
>           setState(() {
>             currentPageIndex = index;
>           });
>         },
>         indicatorColor: Colors.amber,
>         selectedIndex: currentPageIndex,
>         destinations: const <Widget>[
>           NavigationDestination(
>             selectedIcon: Icon(Icons.home),
>             icon: Icon(Icons.home_outlined),
>             label: 'Home',
>           ),
>           NavigationDestination(
>             icon: Icon(Icons.videogame_asset),
>             label: 'Game',
>           ),
>           NavigationDestination(icon: Icon(Icons.circle), label: 'Blank'),
>         ],
>       ),
>       body: <Widget>[
>         /// Home page
>         SingleChildScrollView(
>           child: Column(
>             children: <Widget>[
>               Card(
>                 child: ListTile(
>                   tileColor: Colors.amber.shade200,
>                   leading: const Icon(Icons.home),
>                   title: Text(
>                     'E-Waste Awareness Blog',
>                     textAlign: TextAlign.center,
>                     style: TextStyle(
>                       fontSize: 24,
>                       fontWeight: FontWeight.bold,
>                       color: Colors.grey.shade800,
>                     ),
>                   ),
>                 ),
>               ),
>               Card(
>                 color: Colors.orange.shade100,
>                 child: ListTile(
>                   leading: const Icon(Icons.info, color: Colors.blue),
>                   title: Text(
>                     'What is E-Waste?',
>                     textAlign: TextAlign.center,
>                     style: TextStyle(
>                       fontSize: 20,
>                       fontWeight: FontWeight.bold,
>                       color: Colors.grey.shade800,
>                     ),
>                   ),
>                 ),
>               ),
>               Card(
>                 color: Colors.blue.shade50,
>                 child: const ListTile(
>                   title: Text(
>                     'E-Waste, or electronic waste, refers to discarded electronic devices such as: '
>                     'computers, smartphones, televisions, and other gadgets. As technology rapidly advances, '
>                     'the turnover rate for these devices increases, leading to a significant amount of e-waste '
>                     'being generated globally.',
>                     textAlign: TextAlign.center,
>                   ),
>                 ),
>               ),
>               Card(
>                 color: Colors.orange.shade100,
>                 child: ListTile(
>                   leading: const Icon(Icons.warning, color: Colors.red),
>                   title: Text(
>                     'Hazards of E-Waste',
>                     textAlign: TextAlign.center,
>                     style: TextStyle(
>                       fontSize: 20,
>                       fontWeight: FontWeight.bold,
>                       color: Colors.grey.shade800,
>                     ),
>                   ),
>                 ),
>               ),
>               Card(
>                 color: Colors.red.shade50,
>                 child: const ListTile(
>                   title: Text(
>                     'E-Waste contains hazardous materials such as lead, mercury, cadmium, and brominated flame retardants. '
>                     'When improperly disposed of, these substances can leach into the soil and water, posing serious health risks '
>                     'to humans and wildlife. Exposure to these toxins can lead to respiratory problems, neurological damage, and other health issues.',
>                     textAlign: TextAlign.center,
>                   ),
>                 ),
>               ),
>               Card(
>                 color: Colors.orange.shade100,
>                 child: ListTile(
>                   leading: const Icon(Icons.recycling, color: Colors.green),
>                   title: Text(
>                     'Why is E-Waste Recycling Important?',
>                     textAlign: TextAlign.center,
>                     style: TextStyle(
>                       fontSize: 20,
>                       fontWeight: FontWeight.bold,
>                       color: Colors.grey.shade800,
>                     ),
>                   ),
>                 ),
>               ),
>               Card(
>                 color: Colors.green.shade50,
>                 child: const ListTile(
>                   title: Text(
>                     'Recycling e-waste helps recover valuable materials such as gold, silver, copper, and rare earth metals, '
>                     'reducing the need for mining and conserving natural resources. Proper recycling also prevents hazardous substances '
>                     'from polluting the environment, protecting human health and ecosystems. The economy also benefits from e-waste recycling '
>                     'through job creation, manufacturing of recycled materials, and reduced costs associated with environmental cleanup.',
>                     textAlign: TextAlign.center,
>                   ),
>                   subtitle: Text(
>                     'By recycling e-waste, we can contribute to a more sustainable future.',
>                     textAlign: TextAlign.center,
>                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
>                   ),
>                 ),
>               ),
>             ],
>           ),
>         ),
> 
>         /// Game page
>         GamePage(),
> 
>         /// Blank page
>         Scaffold(
>           body: Center(
>             child: Text(
>               'Blank Page Placeholder',
>               style: theme.textTheme.headlineMedium,
>             ),
>           ),
>         ),
>       ][currentPageIndex],
>     );
>   }
> }
> 
> /// Game Page with player name input
> class GamePage extends StatefulWidget {
>   @override
>   _GamePageState createState() => _GamePageState();
> }
> 
> class _GamePageState extends State<GamePage> {
>   final TextEditingController _controller = TextEditingController();
>   String? playerName;
> 
>   @override
>   Widget build(BuildContext context) {
>     return Center(
>       child: Column(
>         mainAxisAlignment: MainAxisAlignment.center,
>         children: [
>           if (playerName == null) ...[
>             TextField(
>               controller: _controller,
>               decoration: const InputDecoration(labelText: "Enter your name"),
>             ),
>             ElevatedButton(
>               onPressed: () {
>                 setState(() {
>                   playerName = _controller.text;
>                 });
>               },
>               child: const Text("Start Game"),
>             ),
>           ] else ...[
>             RecycleDisposeGame(playerName: playerName!),
>           ],
>         ],
>       ),
>     );
>   }
> }
> 
> /// Game Logic Class
> class RecycleDisposeGame extends StatefulWidget {
>   final String playerName;
> 
>   const RecycleDisposeGame({Key? key, required this.playerName})
>     : super(key: key);
> 
>   @override
>   _RecycleDisposeGameState createState() => _RecycleDisposeGameState();
> }
> 
> class _RecycleDisposeGameState extends State<RecycleDisposeGame> {
>   final List<Map<String, String>> words = [
>     {"word": "Computer", "type": "recycle"},
>     {"word": "Motherboard", "type": "recycle"},
>     {"word": "CRT Monitor", "type": "dispose"},
>     {"word": "Smartphone", "type": "recycle"},
>     {"word": "Printer Cartridge", "type": "dispose"},
>     {"word": "Laptop Battery", "type": "dispose"},
>     {"word": "Keyboard", "type": "recycle"},
>     {"word": "Power Supply Unit", "type": "recycle"},
>     {"word": "Broken Cables", "type": "dispose"},
>     {"word": "Hard Drive", "type": "recycle"},
>   ];
> 
>   late Map<String, String> currentWord;
>   int score = 0;
>   int attempts = 3;
>   bool gameOver = false;
> 
>   Color backgroundColor = Colors.white;
> 
>   List<Map<String, dynamic>> leaderboard = [];
> 
>   @override
>   void initState() {
>     super.initState();
>     _generateWord();
>     _loadLeaderboard();
>   }
> 
>   void _generateWord() {
>     final random = Random();
>     setState(() {
>       currentWord = words[random.nextInt(words.length)];
>       backgroundColor = Colors.white;
>     });
>   }
> 
>   void _checkAnswer(String answer) {
>     if (gameOver) return;
> 
>     setState(() {
>       if (answer == currentWord["type"]) {
>         score++;
>         backgroundColor = Colors.green.shade200;
>       } else {
>         attempts--;
>         backgroundColor = Colors.red.shade200;
>       }
> 
>       if (attempts <= 0) {
>         gameOver = true;
>       } else {
>         Future.delayed(const Duration(milliseconds: 500), () {
>           if (!gameOver) _generateWord();
>         });
>       }
>     });
>   }
> 
>   void _retryGame() {
>     setState(() {
>       score = 0;
>       attempts = 3;
>       gameOver = false;
>       backgroundColor = Colors.white;
>       _generateWord();
>     });
>   }
> 
>   Future<void> _saveScore() async {
>     final prefs = await SharedPreferences.getInstance();
>     leaderboard.add({"name": widget.playerName, "score": score});
> 
>     // Sort leaderboard by highest score
>     leaderboard.sort(
>       (a, b) => (b['score'] as int).compareTo(a['score'] as int),
>     );
> 
>     final encoded = leaderboard.map((e) => jsonEncode(e)).toList();
>     await prefs.setStringList('leaderboard', encoded);
> 
>     setState(() {});
>   }
> 
>   Future<void> _loadLeaderboard() async {
>     final prefs = await SharedPreferences.getInstance();
>     final stored = prefs.getStringList('leaderboard') ?? [];
>     leaderboard = stored
>         .map((e) => jsonDecode(e) as Map<String, dynamic>)
>         .toList();
> 
>     // Sort leaderboard by highest score
>     leaderboard.sort(
>       (a, b) => (b['score'] as int).compareTo(a['score'] as int),
>     );
> 
>     setState(() {});
>   }
> 
>   @override
>   Widget build(BuildContext context) {
>     return Container(
>       color: backgroundColor,
>       child: Column(
>         mainAxisAlignment: MainAxisAlignment.center,
>         children: [
>           if (!gameOver) ...[
>             Text(
>               currentWord["word"]!,
>               style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
>             ),
>             const SizedBox(height: 20),
>             Row(
>               mainAxisAlignment: MainAxisAlignment.center,
>               children: [
>                 ElevatedButton(
>                   onPressed: () => _checkAnswer("recycle"),
>                   child: const Text("Recycle"),
>                 ),
>                 const SizedBox(width: 20),
>                 ElevatedButton(
>                   onPressed: () => _checkAnswer("dispose"),
>                   child: const Text("Dispose"),
>                 ),
>               ],
>             ),
>             const SizedBox(height: 20),
>             Text("Score: $score"),
>             Text("Attempts left: $attempts"),
>           ] else ...[
>             Card(
>               color: Colors.blue.shade100,
>               margin: const EdgeInsets.all(16),
>               child: Padding(
>                 padding: const EdgeInsets.all(16),
>                 child: Text(
>                   "${widget.playerName}'s final score: $score",
>                   style: const TextStyle(
>                     fontSize: 22,
>                     fontWeight: FontWeight.bold,
>                   ),
>                 ),
>               ),
>             ),
>             ElevatedButton(onPressed: _retryGame, child: const Text("Retry")),
>             ElevatedButton(
>               onPressed: _saveScore,
>               child: const Text("Save Score"),
>             ),
>           ],
> 
>           if (leaderboard.isNotEmpty) ...[
>             const SizedBox(height: 30),
>             Card(
>               color: Colors.orange.shade100,
>               margin: const EdgeInsets.all(16),
>               child: Column(
>                 children: [
>                   const Padding(
>                     padding: EdgeInsets.all(8.0),
>                     child: Text(
>                       "Leaderboard",
>                       style: TextStyle(
>                         fontSize: 22,
>                         fontWeight: FontWeight.bold,
>                       ),
>                     ),
>                   ),
>                   for (var entry in leaderboard)
>                     ListTile(
>                       leading: const Icon(Icons.star, color: Colors.amber),
>                       title: Text("${entry['name']}"),
>                       trailing: Text("Score: ${entry['score']}"),
>                     ),
>                 ],
>               ),
>             ),
>           ],
>         ],
>       ),
>     );
>   }
> }
> ```
