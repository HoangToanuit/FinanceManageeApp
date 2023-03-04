import 'package:fin_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({super.key, required int indexx});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        width:double.infinity,
        height: 300,
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <SplineSeries<SaleData,String>>[
            SplineSeries<SaleData,String>(
              color: AppColors.mainColor,
              width: 3,
              dataSource: <SaleData>[
              SaleData(100,'Mon'),
              SaleData(20,'Tue'),
              SaleData(30,'Wed'),
              SaleData(50,'Fri'),
              SaleData(50,'Sun'),
            ],
            xValueMapper: (SaleData sales,_)=>sales.year,
            yValueMapper: (SaleData sales,_)=>sales.sales,
          )
          ],
        )
      )
      
    ;
  }
}
class SaleData {
  SaleData(this.sales, this.year);
  final int sales;
  final String year;

}