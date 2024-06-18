class PramsSensor {
  final String index;
  final int humiditylevel;
  final int risklevel;
  final double left;
  final int temperature;
  final String uid;

  PramsSensor(
      {required this.index,
      required this.temperature,
      required this.uid,
      required this.humiditylevel,
      required this.risklevel,
      required this.left});
}
