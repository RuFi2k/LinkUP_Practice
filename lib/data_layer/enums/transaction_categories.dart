import 'package:flutter/material.dart';

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

  static TransactionCategoriesEnum toEnum(String text) {
    TransactionCategoriesEnum result;
    TransactionCategoriesEnum.values.forEach((element) {
      if (EnumToString(element) == text) {
        result = element;
      }
    });
    return result;
  }

  static IconData GetEnumIcon(TransactionCategoriesEnum enumerator) {
    switch (enumerator) {
      case TransactionCategoriesEnum.Home:
        return Icons.home;
        break;
      case TransactionCategoriesEnum.Shopping:
        return Icons.shopping_cart;
        break;
      case TransactionCategoriesEnum.Transport:
        return Icons.time_to_leave;
        break;
      case TransactionCategoriesEnum.Food:
        return Icons.restaurant;
        break;
      case TransactionCategoriesEnum.Campaign:
        return Icons.volume_up;
        break;
      case TransactionCategoriesEnum.Sports:
        return Icons.flag;
        break;
      case TransactionCategoriesEnum.Marketing:
        return Icons.mail;
        break;
      case TransactionCategoriesEnum.Coupon:
        return Icons.payment;
        break;
      default:
        return Icons.note;
        break;
    }
  }

  static Color getCategoryColor(String category) {
    TransactionCategoriesEnum enumerator = toEnum(category);
    switch (enumerator) {
      case TransactionCategoriesEnum.Home:
        return Color(0xFFFCC76F);
        break;
      case TransactionCategoriesEnum.Shopping:
        return Color(0xFFFF7BAA);
        break;
      case TransactionCategoriesEnum.Transport:
        return Color(0xFF41D9FD);
        break;
      case TransactionCategoriesEnum.Food:
        return Color(0xFFFB9F77);
        break;
      case TransactionCategoriesEnum.Campaign:
        return Color(0xFF63E5FE);
        break;
      case TransactionCategoriesEnum.Sports:
        return Color(0xFFFBBF5D);
        break;
      case TransactionCategoriesEnum.Marketing:
        return Color(0xFFFF7CAB);
        break;
      case TransactionCategoriesEnum.Coupon:
        return Color(0xFFF98D62);
        break;
      default:
        return Color(0xFF2ED4FD);
        break;
    }
  }
}
