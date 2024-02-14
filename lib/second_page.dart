import 'package:flutter/material.dart';
import 'package:laza_project/Model/products.dart';
import 'package:laza_project/Widgets/backbutton.dart';
import 'package:laza_project/Widgets/brand_widget.dart';
import 'package:laza_project/Widgets/product_widget.dart';
import 'package:laza_project/product_info.dart';
import 'services/product_service.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  Map brands = {
    'Adidas': 'assets/images/logo/adidas.png',
    'Nike': 'assets/images/logo/vector.png',
    'Fila': 'assets/images/logo/fila.png',
    'puma': 'assets/images/logo/puma.png'
  };

  // List<Products> product_list = [
  //   Products(
  //       image: 'assets/images/logo/retardone.png',
  //       name: 'Nike Sportswear Club Fleece',
  //       price: '99\$'),
  //   Products(
  //       image: 'assets/images/logo/rerardtwo.png',
  //       name: 'Trail Running Jacket Nike Windrunner',
  //       price: '99\$'),
  //   Products(
  //       image: 'assets/images/logo/retardthree.png',
  //       name: 'Trail Running Jacket Nike Windrunner',
  //       price: '99\$'),
  //   Products(
  //       image: 'assets/images/logo/retardfour.png',
  //       name: 'Trail Running Jacket Nike Windrunner',
  //       price: '99\$')
  // ];

  @override
  Widget build(BuildContext context) {
    // print(product_list[0].price);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 45, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBackButton(icon: const Icon(size: 50, Icons.arrow_back)),
                // CustomBackButton(icon: const Icon(size: 50, Icons.menu_open)),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Hello',
              style: TextStyle(
                color: Color(0xFF1D1E20),
                fontSize: 28,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0.04,
                letterSpacing: -0.21,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              'Welcome to Laza.',
              style: TextStyle(
                color: Color(0xFF8F959E),
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0.07,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                SizedBox(
                    width: 275,
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          label: const Text('Search...'),
                          fillColor: const Color(0xffF5F6FA),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10))),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: MaterialButton(
                    minWidth: 65,
                    height: 55,
                    color: const Color(0xff9775FA),
                    onPressed: () {},
                    shape: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff9775FA)),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Icon(Icons.mic),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose Brand',
                  style: TextStyle(
                    color: Color(0xFF1D1E20),
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0.06,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    color: Color(0xFF8F959E),
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.08,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brands.length,
                itemBuilder: (context, index) => CustomBrandWidget(
                    image: brands.values.elementAt(index),
                    name: brands.keys.elementAt(index)),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'New Arraival',
                  style: TextStyle(
                    color: Color(0xFF1D1E20),
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0.06,
                  ),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                    color: Color(0xFF8F959E),
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.08,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 450,
            child: FutureBuilder(
                future: ProductServiceGet().getallproducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Products> results = snapshot.data as List<Products>;
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 3 / 4),
                      itemCount: results.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductInfo(id: results[index].id),
                              ));
                        },
                        child: ProductWidget(
                            image: results[index].thumbnail,
                            title: results[index].brand,
                            subtitle: results[index].price.toString()),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ],
      ),
    );
  }
}
