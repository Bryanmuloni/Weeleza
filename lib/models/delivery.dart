import 'package:hive/hive.dart';
import 'package:weeleza/models/category.dart';

part 'delivery.g.dart';

@HiveType(typeId: 0)
class Delivery extends HiveObject {
  @HiveField(0)
  String itemName;
  @HiveField(1)
  String itemDescription;
  @HiveField(2)
  ItemCategory itemCategory;
  @HiveField(3)
  String itemSize;
  @HiveField(4)
  String departureTime;
  @HiveField(5)
  String arrivalTime;
  @HiveField(6)
  String destination;

  Delivery(
      {this.itemName,
      this.itemDescription,
      this.itemCategory,
      this.itemSize,
      this.departureTime,
      this.arrivalTime,
      this.destination});
}
