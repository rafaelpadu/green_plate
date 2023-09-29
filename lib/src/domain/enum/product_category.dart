// ignore_for_file: constant_identifier_names

enum ProductCategory {
  FRUITS_VEGETABLES,
  BREAKFAST,
  BEVERAGE,
  MEAT_FISH,
  SNACKS,
  DAIRY;

  String toJson() => name;
  static ProductCategory? fromJson(String? json) {
    if (json != null) {
      return values.byName(json);
    } else {
      null;
    }
    return null;
  }

  String get translate {
    switch (this) {
      case ProductCategory.FRUITS_VEGETABLES:
        return 'Frutos e Vegetais';
      case ProductCategory.BREAKFAST:
        return 'Café da Manhã';
      case ProductCategory.BEVERAGE:
        return 'Bebidas';
      case ProductCategory.MEAT_FISH:
        return 'Carnes e Peixes';
      case ProductCategory.SNACKS:
        return 'Lanches';
      case ProductCategory.DAIRY:
        return 'Laticínios';
    }
  }
}
