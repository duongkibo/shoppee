import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'attributes_product.dart';
import 'description_model.dart';
import 'image_model.dart';
part 'item_grocery.g.dart';
@JsonSerializable()
class ItemGrocery extends Equatable
{
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "sku")
  String?sku;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "brand_id")
  String? brandId;
  @JsonKey(name: "supplier_id")
  String? supplierId;
  @JsonKey(name: "price")
  String? price;
  @JsonKey(name: "cost")
  String? cost;
  @JsonKey(name: "stock")
  int? stock;
  @JsonKey(name: "sold")
  int? sold;
  @JsonKey(name: "minimum")
  int? minimum;
  @JsonKey(name: "weight")
  String? weight;
  @JsonKey(name: "length")
  String? length;
  @JsonKey(name: "width")
  String? width;
  @JsonKey(name: "height")
  String? height;
  @JsonKey(name: "kind")
  int? kind;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "approve")
  int? approve;
  @JsonKey(name: "sort")
  int? sort;
  @JsonKey(name: "view")
  int? view;
  @JsonKey(name: "alias")
  String? alias;
  @JsonKey(name: "property")
  String? property;
  @JsonKey(name: "tax_id")
  String? taxId;

  @JsonKey(name: "images")
  List<ImageModel>? images;
  @JsonKey(name: "descriptions")
  List<DesCriptionModel>? descriptions;

  @JsonKey(name: "attributes")
  List<AttributesProduct>? attributes;


  ItemGrocery({this.id, this.sku, this.image, this.brandId, this.supplierId,
    this.price, this.cost, this.stock, this.sold, this.minimum, this.weight,
    this.length, this.width, this.height, this.kind, this.status,
    this.approve, this.sort, this.view, this.alias, this.images,
    this.descriptions, this.attributes,this.property});

  factory ItemGrocery.fromJson(Map<String, dynamic> json) =>
      _$ItemGroceryFromJson(json);

  Map<String, dynamic> toJson() => _$ItemGroceryToJson(this);

  @override
  List<Object?> get props => [];
}