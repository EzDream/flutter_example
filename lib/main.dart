import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/Routes/routes.dart';
import 'package:flutter_example/components/buttonPage.dart';
import 'package:flutter_example/components/imagePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Example',
      theme: ThemeData(useMaterial3: true),
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => const Home(),
        Routes.buttonPage: (context) => const ButtonPage(),
        Routes.imagePage: (context) => const ImagePage()
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (selected) {
            setState(() {
              _selectedIndex = selected;
            });
          },
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.layers), label: 'Layout')
          ],
        ),
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.home),
                text: 'Animation',
              )
            ],
          ),
          backgroundColor: colorScheme.background,
          centerTitle: true,
          leading: IconButton(onPressed: () => {}, icon: Icon(Icons.settings)),
          actions: [
            IconButton(
                onPressed: () => {buildShowModalBottomSheet(context)},
                icon: Icon(Icons.more_horiz))
          ],
          title: Text(
            'List View',
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              subtitle: const Text(
                'More Button Styles',
              ),
              title: const Text('Buttons',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pushNamed(context, Routes.buttonPage);
              },
            ),
            ListTile(
              title: const Text('Image',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Local and Network Image'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, Routes.imagePage);
              },
            ),
            ListTile(
              title: const Text('Radius',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Radius Widgets'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                if (kDebugMode) {
                  print('Local and Network Image');
                }
              },
            ),
            ListTile(
              title: const Text(
                'Navigator',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Pass data to next page and get back'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                if (kDebugMode) {
                  print('Pass data to next page and get back');
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                title: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Divider(
                height: 0.5,
                thickness: 0.1,
              ),
              ListTile(
                title: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Delete',
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.error),
                  ),
                ),
              ),
            ]),
          );
        });
  }
}

// import 'package:flutter/material.dart';
//
// /// Flutter code sample for [ListTile] selection in a [ListView] or [GridView].
//
// void main() => runApp(const ListViewExampleApp());
//
// class ListViewExampleApp extends StatelessWidget {
//   const ListViewExampleApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: ListTileSelectExample(),
//     );
//   }
// }
//
// class ListTileSelectExample extends StatefulWidget {
//   const ListTileSelectExample({super.key});
//
//   @override
//   ListTileSelectExampleState createState() => ListTileSelectExampleState();
// }
//
// class ListTileSelectExampleState extends State<ListTileSelectExample> {
//   bool isSelectionMode = false;
//   final int listLength = 30;
//   late List<bool> _selected;
//   bool _selectAll = false;
//   bool _isGridMode = false;
//
//   @override
//   void initState() {
//     super.initState();
//     initializeSelection();
//   }
//
//   void initializeSelection() {
//     _selected = List<bool>.generate(listLength, (_) => false);
//   }
//
//   @override
//   void dispose() {
//     _selected.clear();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'ListTile selection',
//           ),
//           leading: isSelectionMode
//               ? IconButton(
//             icon: const Icon(Icons.close),
//             onPressed: () {
//               setState(() {
//                 isSelectionMode = false;
//               });
//               initializeSelection();
//             },
//           )
//               : const SizedBox(),
//           actions: <Widget>[
//             if (_isGridMode)
//               IconButton(
//                 icon: const Icon(Icons.grid_on),
//                 onPressed: () {
//                   setState(() {
//                     _isGridMode = false;
//                   });
//                 },
//               )
//             else
//               IconButton(
//                 icon: const Icon(Icons.list),
//                 onPressed: () {
//                   setState(() {
//                     _isGridMode = true;
//                   });
//                 },
//               ),
//             if (isSelectionMode)
//               TextButton(
//                   child: !_selectAll
//                       ? const Text(
//                     'select all',
//                     style: TextStyle(color: Colors.white),
//                   )
//                       : const Text(
//                     'unselect all',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onPressed: () {
//                     _selectAll = !_selectAll;
//                     setState(() {
//                       _selected =
//                       List<bool>.generate(listLength, (_) => _selectAll);
//                     });
//                   }),
//           ],
//         ),
//         body: _isGridMode
//             ? GridBuilder(
//           isSelectionMode: isSelectionMode,
//           selectedList: _selected,
//           onSelectionChange: (bool x) {
//             setState(() {
//               isSelectionMode = x;
//             });
//           },
//         )
//             : ListBuilder(
//           isSelectionMode: isSelectionMode,
//           selectedList: _selected,
//           onSelectionChange: (bool x) {
//             setState(() {
//               isSelectionMode = x;
//             });
//           },
//         ));
//   }
// }
//
// class GridBuilder extends StatefulWidget {
//   const GridBuilder({
//     super.key,
//     required this.selectedList,
//     required this.isSelectionMode,
//     required this.onSelectionChange,
//   });
//
//   final bool isSelectionMode;
//   final ValueChanged<bool>? onSelectionChange;
//   final List<bool> selectedList;
//
//   @override
//   GridBuilderState createState() => GridBuilderState();
// }
//
// class GridBuilderState extends State<GridBuilder> {
//   void _toggle(int index) {
//     if (widget.isSelectionMode) {
//       setState(() {
//         widget.selectedList[index] = !widget.selectedList[index];
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         itemCount: widget.selectedList.length,
//         gridDelegate:
//         const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemBuilder: (_, int index) {
//           return InkWell(
//             onTap: () => _toggle(index),
//             onLongPress: () {
//               if (!widget.isSelectionMode) {
//                 setState(() {
//                   widget.selectedList[index] = true;
//                 });
//                 widget.onSelectionChange!(true);
//               }
//             },
//             child: GridTile(
//                 child: Container(
//                   child: widget.isSelectionMode
//                       ? Checkbox(
//                       onChanged: (bool? x) => _toggle(index),
//                       value: widget.selectedList[index])
//                       : const Icon(Icons.image),
//                 )),
//           );
//         });
//   }
// }
//
// class ListBuilder extends StatefulWidget {
//   const ListBuilder({
//     super.key,
//     required this.selectedList,
//     required this.isSelectionMode,
//     required this.onSelectionChange,
//   });
//
//   final bool isSelectionMode;
//   final List<bool> selectedList;
//   final ValueChanged<bool>? onSelectionChange;
//
//   @override
//   State<ListBuilder> createState() => _ListBuilderState();
// }
//
// class _ListBuilderState extends State<ListBuilder> {
//   void _toggle(int index) {
//     if (widget.isSelectionMode) {
//       setState(() {
//         widget.selectedList[index] = !widget.selectedList[index];
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: widget.selectedList.length,
//         itemBuilder: (_, int index) {
//           return ListTile(
//               onTap: () => _toggle(index),
//               onLongPress: () {
//                 if (!widget.isSelectionMode) {
//                   setState(() {
//                     widget.selectedList[index] = true;
//                   });
//                   widget.onSelectionChange!(true);
//                 }
//               },
//               trailing: widget.isSelectionMode
//                   ? Checkbox(
//                 value: widget.selectedList[index],
//                 onChanged: (bool? x) => _toggle(index),
//               )
//                   : const SizedBox.shrink(),
//               title: Text('item $index'));
//         });
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo1',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
