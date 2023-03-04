import 'package:fin_app/data/1.dart';
import 'package:fin_app/data/models/add_data.dart';
import 'package:fin_app/utils/app_color.dart';
import 'package:fin_app/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';


import '../widget/big_text.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController expalin_C =TextEditingController();
  final TextEditingController amount =TextEditingController();
  String? selectedItem;
  String? selectedItemi;
  FocusNode ex = FocusNode();
  FocusNode amo = FocusNode();
  DateTime date = DateTime.now();
  final box = Hive.box<Add_data>('data');
  final List<String> _item=[
    'Công việc',
    'Ăn',
    'Uống',
    //'Giải trí',
    'Giáo dục',
    'Nhà ở',
    'Tiết kiệm',
  ];

  final List<String> _itemi=[
    'Chi ra',
    'Thu vào'
  ];
  @override
  void initState(){
    super.initState();
    ex.addListener(() {setState(() {
      
    });});
    super.initState();
    amo.addListener(() {setState(() {
      
    });});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            background_screen(context),
            Positioned(
              top:120,
              child:
              main_container(),
          )
        ],
      )
    ),
  );
}

Container main_container() {
    return Container(
                height: 550,
                width: 340,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white
                ),
                child: Column(
                  children: [
                  const SizedBox(height:30 ,),
                  name(),
                  const SizedBox(height:30 ,),
                  _ex(),
                  const SizedBox(height:30 ,),
                  _amount(),
                  const SizedBox(height:30 ,),
                  _how(),
                  const SizedBox(height:30),
                  date_time(),
                  const Spacer(),
                  save(),
                  const SizedBox(height:20)
            ]
          )
        );
      }
Widget date_time()  {
  return Container(
            alignment: Alignment.bottomLeft,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2,color: const Color(0xffc5c5c5c5))
            ),
            child: TextButton(
              onPressed: () async {
                DateTime? newDate = await showDatePicker(
                  context: context, 
                  initialDate: date, 
                  firstDate:DateTime(2021), 
                  lastDate: DateTime(2100));
                if(newDate == Null) return;
                setState(() {
                  date=newDate!;
                });
              },
              child: Text('Ngày thực hiện: ${date.year}/${date.month}/${date.day}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor
                      )
          )
        )
      );
}
Padding _how(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: const Color(0xffC5C5C5),
        ),
      ),
      child: DropdownButton<String>(
        value: selectedItemi,
        onChanged: ((value) {
          setState(() {
            selectedItemi = value!;
          });
        }),
        items: _itemi 
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 40,
                          child: Image.asset('images/$e.png'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          e,
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ))
            .toList(),
        selectedItemBuilder: (BuildContext context) => _itemi
            .map((e) => Row(
                  children: [
                    SizedBox(
                      width: 42,
                      child: Image.asset('images/$e.png'),
                    ),
                    const SizedBox(width: 5),
                    Text(e, style: const TextStyle(
                      fontSize: 18,
                    ))
                  ],
                ))
            .toList(),
        hint: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            'Phương thức',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        dropdownColor: Colors.white,
        isExpanded: true,
        underline: Container(),
      ),
    ),
  );
}
Padding _ex(){
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child:
        TextField(
          focusNode: ex,
          controller: expalin_C,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical:15),
            labelText: 'Ghi chú',
            labelStyle: TextStyle(color: Colors.grey.shade500,fontSize:16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 2,color: Colors.grey.shade500)
            ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2,color: Color(0xffc5c5c5))
            ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2,color:AppColors.mainColor)
            )
          ),
        ),
    );
}
Padding _amount(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
      child:
        TextField(
          keyboardType: TextInputType.number,
          focusNode: amo,
          controller: amount,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical:15),
            labelText: 'Số tiền',
            labelStyle: TextStyle(color: Colors.grey.shade500,fontSize:16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 2,color: Colors.grey.shade500)
            ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2,color: Color(0xffc5c5c5))
            ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2,color:AppColors.mainColor)
            )
          ),
        ),
  );
}
    
Padding name() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: const Color(0xffC5C5C5),
        ),
      ),
      child: DropdownButton<String>(
        value: selectedItem,
        onChanged: ((value) {
          setState(() {
            selectedItem = value!;
          });
        }),
        items: _item
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 40,
                          child: Image.asset('images/$e.png'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          e,
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ))
            .toList(),
        selectedItemBuilder: (BuildContext context) => _item
            .map((e) => Row(
                  children: [
                    SizedBox(
                      width: 42,
                      child: Image.asset('images/$e.png'),
                    ),
                    const SizedBox(width: 5),
                    Text(e)
                  ],
                ))
            .toList(),
        hint: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            'Tên',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        dropdownColor: Colors.white,
        isExpanded: true,
        underline: Container(),
      ),
    ),
  );
}


 GestureDetector save (){
    return GestureDetector(
      onTap: () {
         var add = Add_data(
            selectedItem!, expalin_C.text, amount.text,selectedItemi!,date);
         box.add(add);
        Navigator.of(context).pop();
      },
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor
        ),
        child: const Text( "Lưu", style: TextStyle( 
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold
          )
        )
      ),
    );
 }

Column background_screen(BuildContext context) {
    return Column(
      children: [
        Container(
          height:300,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)
            )
          ),
        child: Column(
          children: [
           const SizedBox(height: 40,),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
             child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,)),
                  BigText(text: "Thêm giao dịch",color: Colors.white,fontWeight: FontWeight.bold,size:25),
                  const Icon(Icons.attach_file_outlined,color: Colors.white,),
              ],
            ),
           )
          ],
        ),
      ),
    ],
  );
}
}


