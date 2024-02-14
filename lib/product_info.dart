import 'package:flutter/material.dart';
import 'package:laza_project/Model/products.dart';
import 'package:laza_project/services/product_service.dart';

import 'Widgets/backbutton.dart';

class ProductInfo extends StatelessWidget {
  ProductInfo({super.key, required this.id});

  num id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: ProductServiceGet().getoneproduct(id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var temp = snapshot.data as Products;
                return Column(


                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height*0.40
                        ,
                        decoration: BoxDecoration(
                            image: DecorationImage(fit: BoxFit.fill,
                              image: NetworkImage(temp.thumbnail),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: BackButton(
                                color: Colors.green,
                              )),
                        ),
                      ),
                    ]);
              } else
                return Center(child: CircularProgressIndicator());
            }));
  }
}
