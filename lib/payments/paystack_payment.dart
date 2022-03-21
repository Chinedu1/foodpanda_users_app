

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:foodpanda_users_app/constant/key.dart';

class MakePayment{


  BuildContext? ctx;
  int? price;
  String? email;


  MakePayment({this.ctx, this.price, this.email});

  PaystackPlugin paystack = PaystackPlugin();

  //Reference

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  //GetUi
  PaymentCard _getCardUI() {
    return PaymentCard(number: "", cvc: "", expiryMonth: 0, expiryYear: 0);
  }

  Future initializePlugin() async {
    await paystack.initialize(publicKey: ConstantKey.PAYSTACK_KEY);

  }

  //Method Charging card

  chargeCardAndMakePayment() async {
    initializePlugin().then((_) async {
      Charge charge = Charge()
        ..amount = price!
        ..email = email
        ..reference = _getReference()
        ..card = _getCardUI();
      CheckoutResponse response = await paystack.checkout(
        ctx!,
        charge: charge,
        method: CheckoutMethod.card,
        fullscreen: false,
        logo: FlutterLogo(
          size: 24,
        ),
      );
      print("Response $response");

      if (response.status == true)
      {
        print("Transaction successful");
        
      }
      
      else{
        print("Transaction failed");
      }

    });
  }





}