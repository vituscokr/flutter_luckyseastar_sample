import 'package:flutter/material.dart';
import 'package:flutter_luckyseastar_sample/enum/main_page_menu.dart';
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
                icon: const Icon(Icons.menu_book)),
          ),
          title: Text(title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: MainPageMenus.values.length - 1,
          itemBuilder: (BuildContext context, int index) {
          final widget = MainPageMenus.values[index].widget;
          final name =  MainPageMenus.values[index].name;
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => widget ?? Container())
                );
              },
              behavior: HitTestBehavior.opaque,
              child: Container(
                height: 50,
                color: Colors.white,
                child: Center(child: Text('Entry ${name}'))
              ),
            );
      }),
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
