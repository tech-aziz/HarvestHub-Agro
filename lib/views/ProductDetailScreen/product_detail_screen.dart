import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map products;

  const ProductDetailScreen({super.key, required this.products});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.products);
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.green,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          )),
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Icon(
            Icons.share,
            color: Colors.black,
            size: 26,
          ),
        )
      ],
    ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                            AssetImage(widget.products['img']))),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fruits',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 20),
                      ),
                      Text(widget.products['name'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '\$4.5',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)
                            ),
                          )
                        ],
                      ),
                      Text(widget.products['description'],
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
