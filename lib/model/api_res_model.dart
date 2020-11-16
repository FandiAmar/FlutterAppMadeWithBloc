class ApiResultModel {
  String logo;
  int tables;
  List<Foods> foods;

  ApiResultModel({this.logo, this.tables, this.foods});

  ApiResultModel.fromJson(Map<String, dynamic> json) {
    logo = json['logo'];
    tables = json['tables'];
    if (json['foods'] != null) {
      foods = new List<Foods>();
      json['foods'].forEach((v) {
        print(v);
        foods.add(new Foods.fromJson(v));
      });
      print('the foods length is : '+foods.length.toString());

    }else{

      print(foods.length.toString());
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logo'] = this.logo;
    data['tables'] = this.tables;
    if (this.foods != null) {

      data['foods'] = this.foods.map((v) => v.toJson()).toList();

    }
    return data;
  }
}

class Foods {
  Map<String,dynamic> title;
  Map<String,dynamic>  description;
  String image;
  String category;
  String price;

  Foods(
      {
        this.title,
        this.description,
        this.image,
        this.category,
        this.price,});

  Foods.fromJson(Map<String, dynamic> json) {
    description =json['description'];
    title = json['title'];
    image = json['image'];
    category = json['category']== null? "":json['category'];
    price = json['price']== null? "":json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.description != null) {
      data['description'] = this.description;
    }
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['category'] = this.category;
    data['price'] = this.price;
    return data;
  }
}

class Cat {
  String ar;
  String he;

  Cat({this.ar, this.he});

  Cat.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    he = json['he'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    data['he'] = this.he;
    return data;
  }
}

class Tit {
  String ar;
  String he;

  Tit({this.ar, this.he});

  Tit.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    he = json['he'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    data['he'] = this.he;
    return data;
  }
}