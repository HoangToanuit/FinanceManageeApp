import 'package:fin_app/utils/app_color.dart';
import 'package:fin_app/widget/big_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controllers/authcontroller.dart';
import '../data/models/utity.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //String? user = FirebaseAuth.instance.currentUser!.email ?? FirebaseAuth.instance.currentUser!.displayName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 100,
              backgroundColor: AppColors.mainColor,
              child: Icon(Icons.person,size: 100,color: Colors.white,)
            ),
            SizedBox(height: 30,),
            Text(
              FirebaseAuth.instance.currentUser!.displayName!,
              style: const TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              FirebaseAuth.instance.currentUser!.email!,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 30),
            Icon(Icons.account_balance_wallet_outlined, size: 80,color: AppColors.mainColor),
            BigText(text: "${total()}"+"VNĐ",color: Colors.green,fontWeight: FontWeight.bold,),
            const SizedBox(
              height: 100,
            ),
            MaterialButton(
              padding: const EdgeInsets.all(10),
              color: AppColors.mainColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              child: const Text(
                'Đăng xuất',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onPressed: () {
                AuthService().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}