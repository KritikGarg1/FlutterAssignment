import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'mobx.g.dart';
class Mobx= _MobX with _$Mobx;
abstract class _MobX with Store {
  @observable
  String date;

  _MobX(){
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('   kk:mm:ss \n EEE d MMM').format(now);
    date=formattedDate;}

  @action
  void initialize(){
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('   kk:mm:ss \n EEE d MMM').format(now);
    date=formattedDate;
  }

  @action
  void update(dt)
  {
    date=dt;
  }
}