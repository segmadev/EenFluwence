class Points {
  final double x;
  final double y;
  Points({required this.x, required this.y});

  List<Points> get pricePoints {
    final data = <double>[2, 6, 7, 3, 0, 4, 9];
    return data.asMap().entries.map((entry) {
      return Points(x: entry.key.toDouble(), y: entry.value);
    }).toList();
  }

  // List<Points> get pricePoints {
  //   final data = <double>[2, 6, 7, 3, 0, 4, 9];
  //   return data.mapIndexed(
  //           ((index, element) => Points(x: index.toDouble(), y: element)))
  //       .toList();
  // }
}
