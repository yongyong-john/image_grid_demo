class StringManagement {
  static String addHashtags(String input) {
    List<String> words = input.split(', ');
    List<String> hashtagWords = words.map((word) => '#$word').toList();
    String result = hashtagWords.join(' ');
    return result;
  }
}
