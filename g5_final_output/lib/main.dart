import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.videogame_asset),
            label: 'Game',
          ),
          NavigationDestination(
            icon: Badge(label: Text(''), child: Icon(Icons.messenger_sharp)),
            label: 'Messages',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  tileColor: Colors.amber.shade200,
                  shape: ShapeBorder.lerp(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    0,
                  ),
                  leading: Icon(Icons.home),
                  title: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                    'E-Waste Awareness Blog',
                  ),
                ),
              ),
              Card(
                color: Colors.orange.shade100,
                child: ListTile(
                  leading: Icon(Icons.info, color: Colors.blue),
                  title: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                    'What is E-Waste?',
                  ),
                ),
              ),
              Card(
                color: Colors.blue.shade50,
                child: ListTile(
                  title: Text(
                    textAlign: TextAlign.center,
                    'E-Waste, or electronic waste,'
                    ' refers to discarded electronic devices such as:'
                    ' computers, smartphones, televisions, and other gadgets.'
                    ' As technology rapidly advances,'
                    ' the turnover rate for these devices increases,'
                    ' leading to a significant amount of e-waste being generated globally.',
                  ),
                ),
              ),
              Card(
                color: Colors.orange.shade100,
                child: ListTile(
                  leading: Icon(Icons.warning, color: Colors.red),
                  title: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                    'Hazards of E-Waste',
                  ),
                ),
              ),
              Card(
                color: Colors.red.shade50,
                child: ListTile(
                  title: Text(
                    textAlign: TextAlign.center,
                    'E-Waste contains hazardous materials such as lead,'
                    ' mercury, cadmium, and brominated flame retardants.'
                    ' When improperly disposed of, these substances can leach into the soil and water,'
                    ' posing serious health risks to humans and wildlife.'
                    ' Exposure to these toxins can lead to respiratory problems,'
                    ' neurological damage, and other health issues.',
                  ),
                ),
              ),
              Card(
                color: Colors.orange.shade100,
                child: ListTile(
                  leading: Icon(Icons.recycling, color: Colors.green),
                  title: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                    'Why is E-Waste Recycling Important?',
                  ),
                ),
              ),
              Card(
                color: Colors.green.shade50,
                child: ListTile(
                  title: Text(
                    textAlign: TextAlign.center,
                    'Recycling e-waste helps recover valuable materials such as gold,'
                    ' silver, copper, and rare earth metals, reducing the need for'
                    ' mining and conserving natural resources.'
                    ' Proper recycling also prevents hazardous substances from'
                    ' polluting the environment, protecting human health and ecosystems.'
                    ' The economy also benefits from e-waste recycling through job creation,'
                    ' manufacturing of recycled materials, and reduced costs associated with'
                    ' environmental cleanup.',
                  ),
                  subtitle: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ' By recycling e-waste, we can contribute to a more sustainable future.',
                  ),
                ),
              ),
            ],
          ),
        ),

        /// Notifications page
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 1'),
                  subtitle: Text('This is a notification'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 2'),
                  subtitle: Text('This is a notification'),
                ),
              ),
            ],
          ),
        ),

        /// Messages page
        ListView.builder(
          reverse: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade600,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hello',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              );
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.yellow.shade600,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Hi!',
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            );
          },
        ),
      ][currentPageIndex],
    );
  }
}
