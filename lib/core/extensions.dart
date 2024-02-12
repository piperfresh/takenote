extension AssetName on String{
  String get svg => 'assets/icons/$this.svg';
  String get png => 'assets/images/$this.png';
}