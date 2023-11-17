import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harvest_hub_agro/views/ProductListScreen/product_list_screen.dart';


class ProductCategoryScreen extends StatefulWidget {
  String name;
  List category;

  ProductCategoryScreen({
    super.key,
    required this.name,
    required this.category,
  });

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
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
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: Text(
              widget.name,
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
                  color: Colors.black,
                  size: 26,
                ),
              )
            ],
          )),
      body: ListView.builder(
        itemCount: widget.category.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductListScreen(
                    product: widget.category[index],
                  ),
                ));
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black.withOpacity(0.1)),
                height: 130,
                child: ListTile(
                  title: Text(
                    widget.category[index]['categoryName'],
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold,),
                  ),
                  subtitle: Text(widget.category[index]['title']),
                  trailing: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(widget.category[index]['img']),
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
