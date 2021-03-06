enum KanaType {
  hiragana, katakana
}

class Constants {
  static List<Map<String, String>> getFormattedList(Map<String, String> list) {
    var _ret = <Map<String, String>>[];
    list.forEach((String key, String value) {
      _ret.add({'roman': key, 'character': value});
    });
    return _ret;
  }
  static const Map<String, String> hiraganaBasic = {
    'a': 'あ',
    'i': 'い',
    'u': 'う',
    'e': 'え',
    'o': 'お',
    'ka': 'か',
    'ki': 'き',
    'ku': 'く',
    'ke': 'け',
    'ko': 'こ',
    'sa': 'さ',
    'shi': 'し',
    'su': 'す',
    'se': 'せ',
    'so': 'そ',
    'ta': 'た',
    'chi': 'ち',
    'tsu': 'つ',
    'te': 'て',
    'to': 'と',
    'na': 'な',
    'ni': 'に',
    'nu': 'ぬ',
    'ne': 'ね',
    'no': 'の',
    'ha': 'は',
    'hi': 'ひ',
    'fu': 'ふ',
    'he': 'へ',
    'ho': 'ほ',
    'ma': 'ま',
    'mi': 'み',
    'mu': 'む',
    'me': 'め',
    'mo': 'も',
    'ya': 'や',
    'yu': 'ゆ',
    'yo': 'よ',
    'ra': 'ら',
    'ri': 'り',
    'ru': 'る',
    're': 'れ',
    'ro': 'ろ',
    'wa': 'わ',
    'wo': 'を',
    'n': 'ん',
  };
  static const Map<String, String> hiraganaVoiced = {
    'ga': 'が',
    'gi': 'ぎ',
    'gu': 'ぐ',
    'ge': 'げ',
    'go': 'ご',
    'za': 'ざ',
    'ji': 'じ',
    'zu': 'ず',
    'ze': 'ぜ',
    'zo': 'ぞ',
    'da': 'だ',
    'ji(di)': 'ぢ',
    'zu(du)': 'づ',
    'de': 'で',
    'do': 'ど',
    'ba': 'ば',
    'bi': 'び',
    'bu': 'ぶ',
    'be': 'べ',
    'bo': 'ぼ',
    'pa': 'ぱ',
    'pi': 'ぴ',
    'pu': 'ぷ',
    'pe': 'ぺ',
    'po': 'ぽ',
  };
  static const Map<String, String> hiraganaCombo = {
    'kya': 'きゃ',
    'kyu': 'きゅ',
    'kyo': 'きょ',
    'sha': 'しゃ',
    'shu': 'しゅ',
    'sho': 'しゅ',
    'cha': 'ちゃ',
    'chu': 'ちゅ',
    'cho': 'ちょ',
    'nya': 'にゃ',
    'nyu': 'にゅ',
    'nyo': 'にょ',
    'hya': 'ひゃ',
    'hyu': 'ひゅ',
    'hyo': 'ひょ',
    'mya': 'みゃ',
    'myu': 'みゅ',
    'myo': 'みょ',
    'rya': 'りゃ',
    'ryu': 'りゅ',
    'ryo': 'りょ',
    'gya': 'ぎゃ',
    'gyu': 'ぎゅ',
    'gyo': 'ぎょ',
    'ja': 'じゃ',
    'ju': 'じゅ',
    'jo': 'じょ',
    'ja(dya)': 'ぢゃ',
    'ju(dyu)': 'ぢゅ',
    'jo(dyo)': 'ぢょ',
    'bya': 'びゃ',
    'byu': 'びゅ',
    'byo': 'びょ',
    'pya': 'ぴゃ',
    'pyu': 'ぴゅ',
    'pyo': 'ぴょ',
  };
  static const Map<String, String> katakanaBasic = {
    'a': 'ア',
    'i': 'イ',
    'u': 'ウ',
    'e': 'エ',
    'o': 'オ',
    'ka': 'カ',
    'ki': 'キ',
    'ku': 'ク',
    'ke': 'ケ',
    'ko': 'コ',
    'sa': 'サ',
    'shi': 'シ',
    'su': 'ス',
    'se': 'セ',
    'so': 'ソ',
    'ta': 'タ',
    'chi': 'チ',
    'tsu': 'ツ',
    'te': 'テ',
    'to': 'ト',
    'na': 'ナ',
    'ni': 'ニ',
    'nu': 'ヌ',
    'ne': 'ネ',
    'no': 'ノ',
    'ha': 'ハ',
    'hi': 'ヒ',
    'fu': 'フ',
    'he': 'ヘ',
    'ho': 'ホ',
    'ma': 'マ',
    'mi': 'ミ',
    'mu': 'ム',
    'me': 'メ',
    'mo': 'モ',
    'ya': 'ヤ',
    'yu': 'ユ',
    'yo': 'ヨ',
    'ra': 'ラ',
    'ri': 'リ',
    'ru': 'ル',
    're': 'レ',
    'ro': 'ロ',
    'wa': 'ワ',
    'wo': 'ヲ',
    'n': 'ン',
  };
  static const Map<String, String> katakanaVoiced = {
    'ga': 'ガ',
    'gi': 'ギ',
    'gu': 'グ',
    'ge': 'ゲ',
    'go': 'ゴ',
    'za': 'ザ',
    'ji': 'ジ',
    'zu': 'ズ',
    'ze': 'ゼ',
    'zo': 'ゾ',
    'da': 'ダ',
    'ji(di)': 'ヂ',
    'zu(du)': 'ヅ',
    'de': 'デ',
    'do': 'ド',
    'ba': 'バ',
    'bi': 'ビ',
    'bu': 'ブ',
    'be': 'ベ',
    'bo': 'ボ',
    'pa': 'パ',
    'pi': 'ピ',
    'pu': 'プ',
    'pe': 'ペ',
    'po': 'ポ',
  };
  static const Map<String, String> katakanaCombo = {
    'kya': 'キャ',
    'kyu': 'キュ',
    'kyo': 'キョ',
    'sha': 'シャ',
    'shu': 'シュ',
    'sho': 'ショ',
    'cha': 'チャ',
    'chu': 'チュ',
    'cho': 'チョ',
    'nya': 'ニャ',
    'nyu': 'ニュ',
    'nyo': 'ニョ',
    'hya': 'ヒャ',
    'hyu': 'ヒュ',
    'hyo': 'ヒョ',
    'mya': 'ミャ',
    'myu': 'ミュ',
    'myo': 'ミョ',
    'rya': 'リャ',
    'ryu': 'リュ',
    'ryo': 'リョ',
    'gya': 'ギャ',
    'gyu': 'ギュ',
    'gyo': 'ギョ',
    'ja': 'ジャ',
    'ju': 'ジュ',
    'jo': 'ジョ',
    'ja(dya)': 'ヂャ',
    'ju(dyu)': 'ヂュ',
    'jo(dyo)': 'ヂョ',
    'bya': 'ビャ',
    'byu': 'ビュ',
    'byo': 'ビョ',
    'pya': 'ピヤ',
    'pyu': 'ピュ',
    'pyo': 'ピョ',
  };
}
