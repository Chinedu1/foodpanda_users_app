import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/assistantMethods/total_amount.dart';
import 'package:foodpanda_users_app/global/global.dart';
import 'package:foodpanda_users_app/payments/paystack_payment.dart';


class Payment extends StatelessWidget {







  const Payment({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context,  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Making Online Payment",

        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: (){

                

                MakePayment(ctx: context, email:sharedPreferences!
                    .getString("email") ,
                    price: 10000 )
                    .chargeCardAndMakePayment(context);
              },
              child: const Text(
                'Make Payment Online'
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                onPrimary: Colors.white,
                onSurface: Colors.grey,
              ),
            ),
            TextButton(
              onPressed: (){},
              child: const Text('Cross Check while processing'),
            ),
          ],
        ),
      ),
    );
  }
}


