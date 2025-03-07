import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category_reponse_model.dart';
part 'list_category.g.dart';
@JsonSerializable()
class ListCategory extends Equatable
{
  @JsonKey(name: 'data')
  List<CategoryReponseModel>? listItemCategory;


  ListCategory(this.listItemCategory);

  factory ListCategory.fromJson(Map<String, dynamic> json) =>
      _$ListCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ListCategoryToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [listItemCategory??[]];
}