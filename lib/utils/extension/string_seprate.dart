/// 扩展String，增加字符串分隔方法
extension StringSeprate on String {
  String stringSeparate({int count = 3, String separator = ",", bool fromRightToLeft = true}) {
    if (this.isEmpty) {
      return "";
    }

    if (count < 1) {
      return this;
    }

    if (count >= this.length) {
      return this;
    }

    var str = this.replaceAll(separator, "");

    var chars = str.runes.toList();
    var namOfSeparation = (chars.length.toDouble() / count.toDouble()).ceil() - 1;
    var separatedChars = List.filled(chars.length + namOfSeparation.round(), "", growable: false);
    var j = 0;
    for (var i = 0; i < chars.length; i++) {
      separatedChars[j] = String.fromCharCode(chars[i]);
      if (i > 0 && (i + 1) < chars.length && (i + 1) % count == 0) {
        j += 1;
        separatedChars[j] = separator;
      }

      j += 1;
    }

    return fromRightToLeft ? String.fromCharCodes(separatedChars.join().runes.toList().reversed) : separatedChars.join();
  }
}
