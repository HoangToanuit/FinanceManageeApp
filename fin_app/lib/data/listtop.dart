import 'package:fin_app/data/1.dart';

List<Money>geter_top(){
  Money weed =Money();
  weed.image='Giải trí.png';
  weed.fee="-100000 VNĐ";
  weed.buy=true;
  weed.name="Giải Trí";
  weed.time="Hôm nay";
  // Money cf =Money();
  // cf.image='drink.png';
  // cf.fee="-100000 VNĐ";
  // cf.buy=true;
  // cf.name="Nước uống";
  // cf.time="Hôm nay";

  return[weed,];
}