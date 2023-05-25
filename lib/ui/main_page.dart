import 'package:flutter/material.dart';
import 'package:flutter_luckyseastar_sample/ui/search_page.dart';
import 'package:flutter_luckyseastar_sample/util/noamimation_material_page_route.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(Icons.menu_book)),
          ),
          title: Text(title),
      ),
      body: const Text('hello'),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
                child: Text("List")),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                openSample(context);
              }
            ),
            ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                }
            ),
            ListTile(
                title: const Text('Item 3'),
                onTap: () {
                  Navigator.pop(context);
                }
            ),
            ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                }
            ),
            ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                }
            ),
            ListTile(
                title: const Text('Item 3'),
                onTap: () {
                  Navigator.pop(context);
                }
            ),
            ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                }
            ),
            ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                }
            ),
            ListTile(
                title: const Text('Item 3'),
                onTap: () {
                  Navigator.pop(context);
                }
            ),
            ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  Navigator.pop(context);
                }
            ),
            ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                }
            ),
            ListTile(
                title: const Text('Item 3'),
                onTap: () {
                  Navigator.pop(context);
                }
            ),
          ],
        ),
      ),
    );
  }

  void openSample(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.push(
        context,
        NoAnimationMaterialPageRoute(builder: (context) => const SearchPage())
    );
  }
}
