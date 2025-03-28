class MealsModelClass {
  String? idMeal;
  String? strMeal;
  String? strCategory;
  String? strArea;
  String? strInstructions;
  String? strMealThumb;
  String? strYoutube;
  String? strTags;

  MealsModelClass(
      {this.idMeal,
        this.strMeal,
        this.strCategory,
        this.strArea,
        this.strInstructions,
        this.strMealThumb,
        this.strYoutube,
        this.strTags
       });

  MealsModelClass.fromJson(Map<String, dynamic> json) {
    idMeal = json['idMeal'];
    strMeal = json['strMeal'];
    strCategory = json['strCategory'];
    strArea = json['strArea'];
    strInstructions = json['strInstructions'];
    strMealThumb = json['strMealThumb'];
    strYoutube = json['strYoutube'];
    strTags = json['strTags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idMeal'] = this.idMeal;
    data['strMeal'] = this.strMeal;
    data['strCategory'] = this.strCategory;
    data['strArea'] = this.strArea;
    data['strInstructions'] = this.strInstructions;
    data['strMealThumb'] = this.strMealThumb;

    return data;
  }
}
