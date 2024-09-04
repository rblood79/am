import 'package:flutter/material.dart';

class SelectedWidgetModel extends ChangeNotifier {
  WidgetProperties? selectedWidgetProperties;

  void selectWidget(WidgetProperties properties) {
    selectedWidgetProperties = properties;
    notifyListeners();  // 상태 변경을 알림
  }

  void clearSelection() {
    selectedWidgetProperties = null;
    notifyListeners();
  }

  void updateLabel(String label) {
    if (selectedWidgetProperties != null) {
      selectedWidgetProperties!.label = label;
      notifyListeners();
    }
  }

  void updateSize(double width, double height) {
    if (selectedWidgetProperties != null) {
      selectedWidgetProperties!.width = width;
      selectedWidgetProperties!.height = height;
      notifyListeners();
    }
  }

  void updateColor(Color color) {
    if (selectedWidgetProperties != null) {
      selectedWidgetProperties!.color = color;
      notifyListeners();
    }
  }

  void updateLayoutType(LayoutType layoutType) {
    if (selectedWidgetProperties != null) {
      selectedWidgetProperties!.layoutType = layoutType;
      notifyListeners();
    }
  }
  
}

enum LayoutType { container, row, column, stack }
class WidgetProperties {
  final String id;  // 고유 식별자
  String label;
  double width;
  double height;
  Color color;
  double x;
  double y;
  LayoutType layoutType;
  List<WidgetProperties> children; // 자식 컨테이너 리스트 추가

  WidgetProperties({
    required this.id,
    required this.label,
    required this.width,
    required this.height,
    required this.color,
    required this.x,
    required this.y,
    required this.layoutType,
    List<WidgetProperties>? children, // 선택적 매개변수로 설정
  }) : children = children ?? []; // children이 null일 경우 빈 리스트로 초기화
}