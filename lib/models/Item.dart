import 'dart:convert';
/// success : true
/// data : [{"_id":"62f48fd1004740ad08ff966d","name":"Table","price":30000,"cost_price":24000,"quantity":5,"category":"Furnitutre","__v":0}]

Item itemFromJson(String str) => Item.fromJson(json.decode(str));
String itemToJson(Item data) => json.encode(data.toJson());
class Item {
  Item({
      bool? success, 
      List<Data>? data,}){
    _success = success;
    _data = data;
}

  Item.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  List<Data>? _data;
Item copyWith({  bool? success,
  List<Data>? data,
}) => Item(  success: success ?? _success,
  data: data ?? _data,
);
  bool? get success => _success;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "62f48fd1004740ad08ff966d"
/// name : "Table"
/// price : 30000
/// cost_price : 24000
/// quantity : 5
/// category : "Furnitutre"
/// __v : 0

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? name, 
      num? price, 
      num? costPrice, 
      num? quantity, 
      String? category, 
      num? v,}){
    _id = id;
    _name = name;
    _price = price;
    _costPrice = costPrice;
    _quantity = quantity;
    _category = category;
    _v = v;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _price = json['price'];
    _costPrice = json['cost_price'];
    _quantity = json['quantity'];
    _category = json['category'];
    _v = json['__v'];
  }
  String? _id;
  String? _name;
  num? _price;
  num? _costPrice;
  num? _quantity;
  String? _category;
  num? _v;
Data copyWith({  String? id,
  String? name,
  num? price,
  num? costPrice,
  num? quantity,
  String? category,
  num? v,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  price: price ?? _price,
  costPrice: costPrice ?? _costPrice,
  quantity: quantity ?? _quantity,
  category: category ?? _category,
  v: v ?? _v,
);
  String? get id => _id;
  String? get name => _name;
  num? get price => _price;
  num? get costPrice => _costPrice;
  num? get quantity => _quantity;
  String? get category => _category;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['price'] = _price;
    map['cost_price'] = _costPrice;
    map['quantity'] = _quantity;
    map['category'] = _category;
    map['__v'] = _v;
    return map;
  }

}