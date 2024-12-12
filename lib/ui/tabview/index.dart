import 'package:flutter/material.dart';
import 'package:h_learning_mobile/ui/login/index.dart';

class AppShell extends StatefulWidget {
  @override
  _AppShellState createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0;

  // Danh sách route cho các màn hình chính
  static const List<String> _routes = [
    '/h',
    '/s',
    '/st',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: GlobalKey<NavigatorState>(),
        onGenerateRoute: (RouteSettings settings) {
          Widget page;
          switch (_routes[_selectedIndex]) {
            case '/h':
              page = Home();
              break;
            case '/s':
              page = Search();
              break;
            case '/st':
            default:
              page = Settings();
              break;
          }
          return MaterialPageRoute(builder: (context) => page);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Tabview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Screen',
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true)
                .pushNamed(LoginScreen.url);
          },
          child: Text(
            'Search Screen',
            style: TextStyle(color: Colors.red),
          )),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Settings Screen',
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
