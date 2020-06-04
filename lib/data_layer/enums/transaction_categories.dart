enum TransactionCategoriesEnum {
  Home,
  Shopping,
  Transport,
  Food,
  Campaign,
  Sports,
  Marketing,
  Coupon,
  Taxes
}

class CategoryEnumExtensions {
  static String EnumToString(TransactionCategoriesEnum enumerator) {
    return enumerator.toString().replaceAll('TransactionCategoriesEnum.', '');
  }
}
