import 'package:flutter/material.dart';
import '../Utils/utils.dart';

Widget sizeItem(String size, bool isSelected, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 12.0),
    child: Container(
      width: screenAwareSize(30.0, context),
      height: screenAwareSize(30.0, context),
      decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFC3930) : const Color(0xFF525663),
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(color: isSelected ? Colors.black.withOpacity(.5) : Colors.black12, offset: const Offset(0.0, 10.0), blurRadius: 10.0)
          ]),
      child: Center(
        child: Text(size, style: const TextStyle(color: Colors.white, fontFamily: "Montserrat-Bold")),
      ),
    ),
  );
}

Widget colorItem({required Color color, required bool isSelected, required BuildContext context, required VoidCallback ontab}) {
  return GestureDetector(
    onTap: ontab,
    child: Padding(
      padding: EdgeInsets.only(left: screenAwareSize(10.0, context)),
      child: Container(
        width: screenAwareSize(30.0, context),
        height: screenAwareSize(30.0, context),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: isSelected ? [BoxShadow(color: Colors.black.withOpacity(.8), blurRadius: 10.0, offset: const Offset(0.0, 10.0))] : []),
        child: ClipPath(
          clipper: MClipper(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: color,
          ),
        ),
      ),
    ),
  );
}

class MClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

Widget divider() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
    child: Container(
      width: 0.8,
      color: Colors.black,
    ),
  );
}
