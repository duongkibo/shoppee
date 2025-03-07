import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'image_model_local.g.dart';
@HiveType(typeId: 2)
class ImageModelLocal extends HiveObject
{
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? image;
  @HiveField(2)
  String? productId;

  ImageModelLocal({this.id, this.image, this.productId});
}