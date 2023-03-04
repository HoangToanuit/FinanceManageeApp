import 'package:fin_app/data/listdata.dart';
import 'package:fin_app/data/models/add_data.dart';
import 'package:fin_app/utils/app_color.dart';
import 'package:fin_app/widget/big_text.dart';
import 'package:fin_app/widget/small_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../data/models/utity.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var history;
  final List<String> day = [
    'Monday',
    "Tuesday",
    "Wednesday",
    "Thursday",
    'friday',
    'saturday',
    'sunday'
  ];
  final box = Hive.box<Add_data>('data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable:box.listenable(),
          builder:(context,value,child){
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child:SizedBox(height: 370, child:_head(),)
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:const EdgeInsets.symmetric(vertical:15, horizontal:15),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(text: "Lịch sử giao dịch",color: Colors.black,fontWeight:FontWeight.bold),
                    BigText(text: "Xem tất cả",color: Colors.grey,fontWeight:FontWeight.bold,size: 12),
                  ],
                )
                )
              ),
            SliverList(delegate: SliverChildBuilderDelegate((context, index){
              history =box.values.toList()[index];
              return getList(history, index);
            },
            childCount: box.length,
            ))
            ],
          );
          } 
        )
      ));
    }

  Widget _head(){
    return Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 280,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 121, 119, 119),
                        offset:Offset(0,6),
                        blurRadius: 12,
                        spreadRadius: 6
                      )
                    ],
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )
                  ),
                  child:Stack(
                    children: [
                      Positioned(
                      left: 340,
                      top:35,
                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child:Container(
                          height:40,
                          width:40,
                          color: const Color.fromRGBO(250, 250,250, 0.1),
                          child:const Icon(
                            Icons.notification_add_outlined,
                            size:30,
                            color:Colors.white,
                          )
                        )
                      )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:20,top:30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallText(text: "Chào buổi sáng",color:Colors.white),
                            const SizedBox(height:5),
                            BigText(text: FirebaseAuth.instance.currentUser!.displayName!,color:Colors.white,fontWeight:FontWeight.bold),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 180,
              left: 37,
              child:Container(
                height:180,
                width:329,
                decoration: BoxDecoration(
                  boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 65, 64, 64),
                        offset:Offset(0,3),
                        blurRadius: 10,
                        spreadRadius: 1,
                      )
                    ],
                  color: const Color.fromARGB(255, 50, 49, 49),
                  borderRadius:BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:15),
                       child:
                          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(text: "Số dư",size:18),
                            const Icon(Icons.more_horiz_outlined,color:Colors.white)
                            ]
                            )
                          
                        ),
                    const SizedBox(height:7) , 
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal:15),
                        child: Row(
                          children: [
                            BigText(text:"${total()}" " VNĐ",size:25,fontWeight: FontWeight.bold,),
                          ],
                        )
                      ),
                    const SizedBox(height:10) , 
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal:15),
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [ 
                                const CircleAvatar(
                              radius: 13,
                              backgroundColor:Color.fromARGB(255, 22, 22, 22),
                              child: Icon(
                                Icons.arrow_downward_outlined,
                                color: Color.fromARGB(255, 208, 206, 206),
                              ),
                            ),
                            const SizedBox(width:7),
                            SmallText(text: "Thu vào"),
                          ]
                        ),
                         Row(
                              children: [ 
                                const CircleAvatar(
                              radius: 13,
                              backgroundColor:Color.fromARGB(255, 22, 22, 22),
                              child: Icon(
                                Icons.arrow_upward_outlined,
                                color: Color.fromARGB(255, 208, 206, 206),
                              ),
                            ),
                            const SizedBox(width:7),
                            SmallText(text: "Chi ra"),
                          ]
                        ), 
                      ],    
                    ),
                  ),
                const SizedBox(height:10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(text:"${income()} VND",fontWeight:FontWeight.bold),
                      SmallText(text:"${expen()} VND",fontWeight:FontWeight.bold)
                    ],
                  ),
                )
                ]
              )
              ,
            )
          )
        ]
    );
  }
Widget getList(Add_data history, int index){
  return Dismissible(key: UniqueKey(),
  onDismissed: (direction){
    history.delete();
  },
   child: get(index,history)
   );
}

ListTile get(int index, Add_data history) {
      return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset('images/${geter()[index].image!}',fit:BoxFit.cover,height:40, width:40),
      ),
      title: SmallText(text: history.name,fontWeight:FontWeight.bold,color:Colors.black,),
      subtitle: SmallText(text: '${day[history.datetime.weekday-1]} ${history.datetime.year}-${history.datetime.month}',color: Colors.black,size: 10,),
      trailing: BigText(text: "${history.amount} VNĐ",fontWeight:FontWeight.bold,color:history.IN =='Chi ra' ?Colors.red:Colors.green,size:13),
    );
}
}

