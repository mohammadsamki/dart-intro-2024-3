import 'package:flutter/material.dart';
import './screens/addProduct.dart';
import './screens/drawerScreen.dart';
import './data.dart';
//  run function >  main fun
//  main wg > class  stateless widget > material app > : home , routes , scaffold : widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override // method main class

  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/addProduct': (context) => AddProduct(),
        '/drawerScreen': (context) => DrawerScreen(),
        '/': (context) => HomePage(),
      },
      initialRoute: '/drawerScreen',
      // home: HomePage(),
    );
  }
}

void printHi() {
  print('hi');
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchValue = 'your search will appear here';
  String prodImage = '';
  List foundedReasult = [];
  Map products = Data.products;
  //  key for the form
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String updatedTitle = '';
  String updatedImage = '';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leadingWidth: 100,
        leading: Container(
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          width: 100,
          margin: EdgeInsets.only(left: 20),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://w7.pngwing.com/pngs/595/79/png-transparent-dart-programming-language-flutter-object-oriented-programming-flutter-logo-class-fauna-bird.png'),
            // child: Image.network(
            //     'https://w7.pngwing.com/pngs/595/79/png-transparent-dart-programming-language-flutter-object-oriented-programming-flutter-logo-class-fauna-bird.png'),
          ),
        ),
        // title: Text('home page'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 30),
            child: ElevatedButton(
                onPressed: () => {Navigator.pushNamed(context, '/addProduct')},
                child: Text(
                  'Add Product ',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                )),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: 400,
            height: 200,
            color: Colors.red,
            child: Image.network(
                'https://www.gardenia.net/wp-content/uploads/2023/05/types-of-flowers.webp',
                width: 100,
                height: 100,
                fit: BoxFit.fill),
          ),
          TextField(
            onChanged: (x) {
              List productList = products.keys.toList();
              List reasult = [];
              // print(productList);
              bool found = false;
              for (var i = 0; i < productList.length; i++) {
                if (productList[i].contains(x)) {
                  // print(products[productList[i]]);
                  reasult.add(products[productList[i]]);
                  found = true;
                }
              }
              if (found == false) {
                reasult = [];
                print('not found');
              }
              // print(reasult);

              setState(() {
                foundedReasult = reasult;
                print(foundedReasult);
                print(foundedReasult.isEmpty);
              });
            },
            decoration: InputDecoration(
                label: Text('search'),
                hintText: 'search for item',
                icon: Icon(Icons.search)),
          ),
          SizedBox(
            height: 20,
          ),
          !foundedReasult.isEmpty
              ? Container(
                  width: 400,
                  height: 400,
                  child: ListView.builder(
                      itemCount: foundedReasult.length,
                      itemBuilder: (context, index) {
                        // return ListTile(
                        //   leading: Image.network(foundedReasult[index]['image']),
                        //   title: Text(foundedReasult[index]['title']),
                        // );
                        return Column(
                          children: [
                            Text(foundedReasult[index]['title']),
                            Image.network(foundedReasult[index]['image']),
                            //  delete button
                            ElevatedButton(
                              onPressed: () {
                                String? keyToRemove;
                                products.forEach((key, value) {
                                  if (value == foundedReasult[index]) {
                                    keyToRemove = key;
                                    print(keyToRemove);
                                  }
                                });
                                setState(() {
                                  foundedReasult.removeAt(index);
                                  products.remove(keyToRemove);
                                });
                              },
                              child: Text('X'),
                            ),
                            //  update button
                            ElevatedButton(
                                onPressed: () {
                                  String? keyToRemove;
                                  products.forEach((key, value) {
                                    if (value == foundedReasult[index]) {
                                      keyToRemove = key;
                                      print(keyToRemove);
                                    }
                                  });
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: Text(
                                          'You want to Update ${keyToRemove} '),
                                      content: Form(
                                          key: _formKey,
                                          child: Container(
                                            height: 300,
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  onSaved: (newValue) {
                                                    setState(() {
                                                      updatedTitle = newValue!;
                                                    });
                                                  },
                                                  initialValue:
                                                      foundedReasult[index]
                                                          ['title'],
                                                  decoration: InputDecoration(
                                                    labelText: 'Product Title',
                                                  ),
                                                ),
                                                TextFormField(
                                                  onSaved: (newValue) {
                                                    updatedImage = newValue!;
                                                  },
                                                  initialValue:
                                                      foundedReasult[index]
                                                          ['image'],
                                                  decoration: InputDecoration(
                                                    labelText: 'Product Image',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context, 'Cancel')
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _formKey.currentState!.save();
                                              print(
                                                  'Title: $updatedTitle, Image: $updatedImage');
                                              String? keyToRemove;
                                              products.forEach((key, value) {
                                                if (value ==
                                                    foundedReasult[index]) {
                                                  keyToRemove = key;
                                                  print(keyToRemove);
                                                }
                                              });
                                              products[keyToRemove] = {
                                                'title': updatedTitle,
                                                'image': updatedImage
                                              };
                                            }
                                            ;
                                            Navigator.pop(context, 'Update');
                                          },
                                          child: const Text('Update'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Text('Update'))
                          ],
                        );
                      }),
                )
              : Text('no image found'),
        ],
      ),
    );
  }
}
