# MobApp
---
# E-waste Blog ♻️
---
> [!CAUTION]
> Following the requirements for our Final Output for Mobile App Development
> The group is required to create an APP that is either related to the previous Mid Terms Output or another SDG *Sustainable Development Goals*
---
> [!NOTES]
> Currently, the mobile app has 3 navigation buttons at the bottom.
> 1. The main page currently exists, but only contains Cards, and Strings of random facts/trivia about E-Waste
> 2. The other two buttons are currently used as a placeholder.
>  - Initially, the second button was supposed to be a simple Recycle or Dispose game
>  - Random words related to E-waste will appear and the user will either press Dispose or Recycle
>  - The supposed utilization was to use the userPreferences Module for the score saving.
>  - However, the code did not run as expected and have decided to leave second button as a placeholder for the time being.
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
> ```
> import 'package:flutter/material.dart';
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
>                   shape: ShapeBorder.lerp(
>                     RoundedRectangleBorder(
>                       borderRadius: BorderRadius.circular(12.0),
>                     ),
>                     RoundedRectangleBorder(
>                       borderRadius: BorderRadius.circular(12.0),
>                     ),
>                     0,
>                   ),
>                   leading: Icon(Icons.home),
>                   title: Text(
>                     textAlign: TextAlign.center,
>                     style: TextStyle(
>                       fontSize: 24,
>                       fontWeight: FontWeight.bold,
>                       color: Colors.grey.shade800,
>                     ),
>                     'E-Waste Awareness Blog',
>                   ),
>                 ),
>               ),
>               Card(
>                 color: Colors.orange.shade100,
>                 child: ListTile(
>                   leading: Icon(Icons.info, color: Colors.blue),
>                   title: Text(
>                     textAlign: TextAlign.center,
>                     style: TextStyle(
>                       fontSize: 20,
>                       fontWeight: FontWeight.bold,
>                       color: Colors.grey.shade800,
>                     ),
>                     'What is E-Waste?',
>                   ),
>                 ),
>               ),
>               Card(
>                 color: Colors.blue.shade50,
>                 child: ListTile(
>                   title: Text(
>                     textAlign: TextAlign.center,
>                     'E-Waste, or electronic waste,'
>                     ' refers to discarded electronic devices such as:'
>                     ' computers, smartphones, televisions, and other gadgets.'
>                     ' As technology rapidly advances,'
>                     ' the turnover rate for these devices increases,'
>                     ' leading to a significant amount of e-waste being generated globally.',
>                   ),
>                 ),
>               ),
>               Card(
>                 color: Colors.orange.shade100,
>                 child: ListTile(
>                   leading: Icon(Icons.warning, color: Colors.red),
>                   title: Text(
>                     textAlign: TextAlign.center,
>                     style: TextStyle(
>                       fontSize: 20,
>                       fontWeight: FontWeight.bold,
>                       color: Colors.grey.shade800,
>                     ),
>                     'Hazards of E-Waste',
>                   ),
>                 ),
>               ),
>               Card(
>                 color: Colors.red.shade50,
>                 child: ListTile(
>                   title: Text(
>                     textAlign: TextAlign.center,
>                     'E-Waste contains hazardous materials such as lead,'
>                     ' mercury, cadmium, and brominated flame retardants.'
>                     ' When improperly disposed of, these substances can leach into the soil and water,'
>                     ' posing serious health risks to humans and wildlife.'
>                     ' Exposure to these toxins can lead to respiratory problems,'
>                     ' neurological damage, and other health issues.',
>                   ),
>                 ),
>               ),
>               Card(
>                 color: Colors.orange.shade100,
>                 child: ListTile(
>                   leading: Icon(Icons.recycling, color: Colors.green),
>                   title: Text(
>                     textAlign: TextAlign.center,
>                     style: TextStyle(
>                       fontSize: 20,
>                       fontWeight: FontWeight.bold,
>                       color: Colors.grey.shade800,
>                     ),
>                     'Why is E-Waste Recycling Important?',
>                   ),
>                 ),
>               ),
>               Card(
>                 color: Colors.green.shade50,
>                 child: ListTile(
>                   title: Text(
>                     textAlign: TextAlign.center,
>                     'Recycling e-waste helps recover valuable materials such as gold,'
>                     ' silver, copper, and rare earth metals, reducing the need for'
>                     ' mining and conserving natural resources.'
>                     ' Proper recycling also prevents hazardous substances from'
>                     ' polluting the environment, protecting human health and ecosystems.'
>                     ' The economy also benefits from e-waste recycling through job creation,'
>                     ' manufacturing of recycled materials, and reduced costs associated with'
>                     ' environmental cleanup.',
>                   ),
>                   subtitle: Text(
>                     textAlign: TextAlign.center,
>                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
>                     ' By recycling e-waste, we can contribute to a more sustainable future.',
>                   ),
>                 ),
>               ),
>             ],
>           ),
>         ),
> 
>         /// Game page
>         Column(
>           children: [
>             Center(
>               child: Text(
>                 'Game Page Placeholder',
>                 style: theme.textTheme.headlineMedium,
>               ),
>             ),
>           ],
>         ),
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
> ```
