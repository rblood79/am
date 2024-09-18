import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class SidebarMenu extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(icon: Remix.file_line, label: 'Site'),
    MenuItem(icon: Remix.square_line, label: 'Widget'),
    MenuItem(icon: Remix.node_tree, label: 'Tree'),
    MenuItem(icon: Remix.database_2_line, label: 'Data'),
    MenuItem(icon: Remix.book_3_line, label: 'Library'),
    MenuItem(icon: Remix.account_circle_line, label: 'User'),
    MenuItem(icon: Remix.settings_line, label: 'Setting'),
  ];

  final Function(String) onMenuButtonPressed;

  SidebarMenu({super.key, required this.onMenuButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48, // 사이드바의 전체 너비
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.white, // 배경색
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16), // 그림자 색상 및 투명도
            spreadRadius: 1, // 그림자의 확산 반경
            blurRadius: 8, // 그림자의 흐림 정도
            offset: const Offset(2, 0), // 그림자의 위치
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // 아이템을 중앙 정렬
        children: [
          // 첫 번째 그룹: 상단에 배치될 메뉴 항목들
          ...menuItems.sublist(0, 5).map((item) => buildMenuItem(item)),

          // Flexible을 사용하여 남은 공간을 유연하게 차지하도록 함
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: menuItems
                  .sublist(5)
                  .map((item) => buildMenuItem(item))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  // 메뉴 항목을 빌드하는 헬퍼 메소드
  Widget buildMenuItem(MenuItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0), // 항목 간 간격 설정
      child: GestureDetector(
        onTap: () {
          onMenuButtonPressed(item.label); // 메뉴 이름을 전달
          //print('${item.label} clicked');
        },
        child: Container(
          width: 36, // 버튼의 너비
          height: 54, // 버튼의 높이
          decoration: BoxDecoration(
            color: Colors.white, // 버튼 배경색
            borderRadius: BorderRadius.circular(8.0), // 모서리 둥글게
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 21, color: Colors.black87),
              const SizedBox(height: 4.0),
              Text(
                item.label,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final IconData icon;
  final String label;

  MenuItem({required this.icon, required this.label});
}