import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_reponse_model.g.dart';
@JsonSerializable()
class CategoryReponseModel extends Equatable {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "alias")
  String? alias;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "sort")
  int? sort;


  CategoryReponseModel(this.id, this.name, this.alias, this.image, this.url,
      this.status, this.sort);

  factory CategoryReponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryReponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryReponseModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [id??0,name??'',alias??'',image??''];

}
