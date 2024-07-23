import 'package:flutter/material.dart';
import '../data.dart';

class NewProduct {
  String name;
  String image;
  String key;

  NewProduct({required this.name, required this.image, required this.key});
}

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String productName = '';
  String productImage = '';
  String productKey = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Form(
              key: formKey,
              child: Column(
                children: [
                  Text('Add Product'),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Product name is required.';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      setState(() {
                        productName = newValue!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Product Name',
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Product image is required.';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      setState(() {
                        productImage = newValue!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Product image',
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Product key is required.';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      setState(() {
                        productKey = newValue!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Product key',
                    ),
                  ),
                  ElevatedButton(
                    child: Text('Add Product'),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        print(productImage);
                        print(productName);
                        Map newProduct = {
                          productKey: {
                            'title': productName,
                            'image': productImage,
                          }
                        };
                        Data.products.addAll(newProduct);
                        print(Data.products);
                      } else {}
                      // Add product logic here
                      setState(() {});
                    },
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
