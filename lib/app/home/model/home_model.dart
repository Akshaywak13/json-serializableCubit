// import 'package:json_annotation/json_annotation.dart';

// part 'home_model.g.dart';

// @JsonSerializable(explicitToJson: true)
// class HomeModel {
//   final List<Data> data;

//   HomeModel({required this.data});

//   factory HomeModel.fromJson(List<dynamic> json) {
//     return HomeModel(
//       data: json.map((e) => Data.fromJson(e as Map<String, dynamic>)).toList(),
//     );
//   }

//   Map<String, dynamic> toJson() => _$HomeModelToJson(this);
// }

// @JsonSerializable(explicitToJson:true)
// class Data {
//   String? name;
//   String? address;
//   String? city;
//   String? id;

//   Data({
//     this.name,
//     this.address,
//     this.city,
//     this.id,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

//   Map<String, dynamic> toJson() => _$DataToJson(this);
// }



import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';



@JsonSerializable(explicitToJson: true)
class HomeModel {
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "address")
    String? address;
    @JsonKey(name: "city")
    String? city;
    @JsonKey(name: "id")
    String? id;

    HomeModel({
        this.name,
        this.address,
        this.city,
        this.id,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);

    Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}
