import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: 'HOME'),
          NavigationDestination(icon: Icon(Icons.qr_code), label: 'QR'),
          NavigationDestination(icon: Icon(Icons.search), label: 'SEARCH'),
        ],
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              _selectedIndex = 0;
              context.push('/home');
              break;
            case 1:
              _selectedIndex = 1;
              context.push('/qr');
              break;
            case 2:
              _selectedIndex = 2;
              context.push('/search');
              break;
            default:
              _selectedIndex = 0;
              context.push('/home');
          }
          setState(() {});
        },
      ),
      body: widget.child,
    );
  }
}
