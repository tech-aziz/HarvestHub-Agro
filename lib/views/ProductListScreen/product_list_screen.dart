import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ProductDetailScreen/product_detail_screen.dart';

class ProductListScreen extends StatefulWidget {
  Map product;


  ProductListScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55.0), // here the desired height
          child: AppBar(
            backgroundColor: Colors.green,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                )),
            automaticallyImplyLeading: false,
            title: Text(
              widget.product['categoryName'],
              style: GoogleFonts.poppins(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.more_vert_rounded,
                  color: Colors.green,
                  size: 26,
                ),
              )
            ],
          )),
      body: ListView.builder(
        itemCount: widget.product['products'].length,
        itemBuilder: (context, index) {
          final data = widget.product['products'][index];
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  ProductDetailScreen(
                    products: data,
                  ),
                ));
              },
              child: Card(
                elevation: 12,
                child: ListTile(
                  title: Text(data['name']),
                  subtitle: Text(data['description'],
                  maxLines: 1, overflow: TextOverflow.ellipsis,),

                  trailing: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(data['img']),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
