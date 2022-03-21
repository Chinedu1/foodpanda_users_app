import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/models/items.dart';

class CartItemDesign extends StatefulWidget
{
  final Items? model;
  BuildContext? context;
  final int? quanNumber;

  CartItemDesign({
    this.model,
    this.context,
    this.quanNumber,
  });


  @override
  _CartItemDesignState createState() => _CartItemDesignState();
}

class _CartItemDesignState extends State<CartItemDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.cyan,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [

              //image
              Image.network(widget.model!.thumbnailUrl!, width: 140, height: 120,),
              const SizedBox(width: 6,),


              //title
              //quantity number
              //price
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [

                  //title
                  Text(
                    widget.model!.title!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Kiwi",
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),

                  //quantity number
                  Row(  //x 7
                    children: [
                      const Text( // 7
                        "x ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: "Acme",
                        ),
                      ),

                      Text( // 7
                        widget.quanNumber.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: "Acme",
                        ),
                      ),
                    ],
                  ),
                  //price

                  Row(  //x 7
                    children: [
                      const Text( // 7
                        "Price:",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),

                      const Text( // 7
                        "₦",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),



                      Text( // 7
                        widget.model!.price.toString(),
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
