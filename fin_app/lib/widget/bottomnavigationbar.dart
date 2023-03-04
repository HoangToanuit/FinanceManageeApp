import 'package:fin_app/screen/add.dart';
import 'package:fin_app/screen/home.dart';
import 'package:fin_app/screen/account.dart';
import 'package:fin_app/screen/statistics.dart';
import 'package:fin_app/utils/app_color.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int index_color = 0;
  List Screen = [const Home(),const Statistics(),const Home(),HomePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[index_color],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddScreen()));
        },backgroundColor:AppColors.mainColor ,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(left:20,top: 20,right:20),
          child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      index_color=0;
                    });
                  },
                  child: 
                  Icon(Icons.home,size:30,color:index_color==0? AppColors.mainColor:Colors.grey)),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      index_color=1;
                    });
                  },
                  child: 
                  Icon(Icons.bar_chart,size:30,color:index_color==1? AppColors.mainColor:Colors.grey)),
                const SizedBox(width:20),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      index_color=2;
                    });
                  },
                  child: 
                  Icon(Icons.account_balance_outlined,size:30,color:index_color==2? AppColors.mainColor:Colors.grey)),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      index_color=3;
                    });
                  },
                  child: 
                  Icon(Icons.person_outlined,size:30,color:index_color==3? AppColors.mainColor:Colors.grey)),
              ],
            ),
        )
      ),
    );
  }
}