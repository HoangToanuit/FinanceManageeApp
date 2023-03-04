
import 'package:fin_app/data/models/add_data.dart';
import 'package:fin_app/data/models/utity.dart';
import 'package:fin_app/widget/chart.dart';
import 'package:fin_app/widget/big_text.dart';
import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../widget/small_text.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List day=["Ngày","Tuần","Tháng","Năm",];
  int index_color=0;
  List char = [today(),week(),month(),year()];
  List<Add_data> a =[];
  ValueNotifier vl1 = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: ValueListenableBuilder(
          valueListenable: vl1,
          builder: (context, dynamic value, Widget? child){
            a=char[value];
            return custom();
          } ,
        )
      )
    );
  }
    CustomScrollView custom(){
    return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height:20),
                  BigText(text: "Thống kê chi tiêu", color: Colors.black, fontWeight: FontWeight.bold,),
                  const SizedBox(height:20),
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(4, (index) {
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                index_color=index;
                                vl1.value=index;
                              });
                            },
                            child: Container(
                                              height:50,
                                              width:70,
                                               decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: index_color==index?AppColors.mainColor:Colors.white,
                                              ),
                                              alignment: Alignment.center,
                                              child: SmallText(text: day[index],size:16,color:index_color==index?Colors.white:Colors.black,fontWeight:FontWeight.bold)
                                            ),
                          );
                        })
                      ]
                    ),
                  ),
                  const SizedBox(height:20),
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal:15),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.end,
                      children: [
                          Container(
                          width:110,
                          height:40,
                          decoration:BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:BorderRadius.circular(15)
                          ),
                          child: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                          children: [
                            SmallText(text: "Chi tiêu",color: Colors.grey,),
                            const SizedBox(width: 7),
                            const Icon(Icons.arrow_downward_outlined,color:Colors.grey)
                          ],
                          )
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height:20),
                  Chart(indexx: index_color),
                  const SizedBox(height:20),
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        BigText(text: "Chi tiêu nhiều nhất",color: Colors.black,fontWeight: FontWeight.bold,size:15),
                        const Icon(Icons.swap_vert, color:Colors.grey,),
                      ]
                    ),
                  ),
                ],
              ),
            ),
             SliverList(delegate: SliverChildBuilderDelegate((context, index){
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset('images/${a[index].name}.png',fit:BoxFit.cover,height:40, width:40),
                        ),
                        title: SmallText(text: a[index].name,fontWeight:FontWeight.bold,color:Colors.black,),
                        subtitle: SmallText(text: '${a[index].datetime.weekday-1}-${a[index].datetime.year}-${a[index].datetime.month}',color: Colors.black,size: 10,),
                        trailing: BigText(text: "${a[index].amount} VNĐ",fontWeight:FontWeight.bold,color:a[index].IN =='Chi ra' ?Colors.red:Colors.green,size:13),
              );
            },      childCount: a.length
          )
        )
      ],
    );
  }
}
