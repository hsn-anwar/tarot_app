enum Music { relaxing, epic, meditative, off }

extension ParseToString on Music {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
