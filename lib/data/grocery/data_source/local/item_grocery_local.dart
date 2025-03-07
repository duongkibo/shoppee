import 'package:equatable/equatable.dart';
import 'package:shoppbee/data/grocery/data_source/local/attributes_product_local.dart';

import 'package:shoppbee/data/grocery/data_source/local/description_model_local.dart';

import 'package:shoppbee/data/grocery/data_source/local/image_model_local.dart';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'item_grocery_local.g.dart';
@HiveType(typeId: 3)
class ItemGroceryLocal extends HiveObject
{
 @HiveField(0)
  String? id;
 @HiveField(1)
  String? sku;
 @HiveField(2)
  String? image;
 @HiveField(3)
  String? brandId;
 @HiveField(4)
  String? supplierId;
 @HiveField(5)
  String? price;
 @HiveField(6)
 String? cost;
 @HiveField(7)
  int? stock;
 @HiveField(8)
  int? sold;
 @HiveField(9)
  int? minimum;
 @HiveField(10)
  String? weight;
 @HiveField(11)
  String? length;
 @HiveField(12)
  String? width;
 @HiveField(13)
 String? height;
 @HiveField(14)
 int? kind;
 @HiveField(15)
  String? property;
 @HiveField(16)
  String? taxId;
 @HiveField(17)
  int? status;
 @HiveField(18)
  int? sort;
 @HiveField(19)
  int? view;
 @HiveField(20)
  String? alias;
 @HiveField(21)
  List<ImageModelLocal>? images;
 @HiveField(22)
  List<DesCriptionModelLocal>? descriptions;
 @HiveField(23)
  List<AttributesProductLocal>? attributes;

 ItemGroceryLocal(
      {this.id,
      this.sku,
      this.image,
      this.brandId,
      this.supplierId,
      this.price,
      this.cost,
      this.stock,
      this.sold,
      this.minimum,
      this.weight,
      this.length,
      this.width,
      this.height,
      this.kind,
      this.property,
      this.taxId,
      this.status,
      this.sort,
      this.view,
      this.alias,
      this.images,
      this.descriptions,
      this.attributes});

}