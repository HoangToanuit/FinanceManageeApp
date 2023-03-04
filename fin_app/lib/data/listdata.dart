import 'package:fin_app/data/1.dart';

List<Money> geter(){
  Money upwork = Money();
  upwork.name='Xăng xe';
  upwork.fee='65000';
  upwork.time='today';
  upwork.image='Công việc.png';
  upwork.buy=false;
  Money cafe = Money();
  cafe.name="Tiền mua nước";
  cafe.fee="30000";
  cafe.time="Hôm nay";
  cafe.image="Ăn.png";
  cafe.buy=false;
  Money education = Money(); 
  education.name="Tiền mua nước";
  education.fee="30000";
  education.time="Hôm nay";
  education.image="Uống.png";
  education.buy=false;
  Money weed =Money();
  weed.name="Ma túy";
  weed.fee="30000";
  weed.time="Hôm nay";
  weed.image="Giải trí.png";
  weed.buy=false;
  return [upwork,cafe,education,weed];
}