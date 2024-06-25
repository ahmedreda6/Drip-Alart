class PramsSensor {
  final String index;
  final int? humiditylevel;
  final int? risklevel;
  final double? left;
  final int? temperature;
  final String uid;

  PramsSensor(
      {required this.index,
      this.temperature,
      required this.uid,
      this.humiditylevel,
      this.risklevel,
      this.left});
}
