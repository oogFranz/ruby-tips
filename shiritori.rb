# coding: UTF-8
class String
  @@cols_H = {
    "あ"=>["あ","か","さ","た","な","は","ま","や","ら","わ","が","ざ","だ","ば","ぱ","ぁ","ゃ"],
    "い"=>["い","き","し","ち","に","ひ","み","り","ぎ","じ","ぢ","び","ぴ","ぃ"],
    "う"=>["う","く","す","つ","ぬ","ふ","む","ゆ","る","ぐ","ず","づ","ぶ","ぷ","ぅ","ゅ"],
    "え"=>["え","け","せ","て","ね","へ","め","れ","げ","ぜ","で","べ","ぺ","ぇ"],
    "お"=>["お","こ","そ","と","の","ほ","も","よ","ろ","を","ご","ぞ","ど","ぼ","ぽ","ぉ","ょ"]
  }

  #すべてひらがなならtrueをそうでなければfalseを返す
  def hiragana?
    return !(/^[\p{hiragana}ー－]+$/ =~ self).nil?
  end

  # 最後の文字がしりとりに使える文字であればtrueをそうでなければfalseを返す
  def last_char?
    last_char = self.get_last_char
    return !(last_char.nil? || last_char == "ん" || last_char == "っ")
  end

  #しりとり的に最後の文字を取得する
  #最後が長音のときは、最後から二番目の文字の母音を取る
  def get_last_char
    last_char = self[-1]
    if !(last_char == "ー" || last_char == "－")
      return last_char
    else
      return get_vowel(self[-2])
    end
  end

  #母音を取得する
  #母音がない場合はnilを返す
  def get_vowel(char)
    @@cols_H.each do |vowel,array|
      if array.include?(char)
        return vowel
      end
    end
    return nil
  end
end

class Shiritoris
  attr_reader :last_word
  def initialize
    @answer_list = []
    #単語リストの読み込み
    @wordslist = {}
    f = open("wordlist.txt")
    while line = f.gets
      word = line.chomp.encode("utf-8","utf-8")
      first_char = word[0]
      if @wordslist[first_char].nil?
        @wordslist[first_char] = []
      end
      @wordslist[first_char].push(word)
    end
    @last_word = @wordslist["あ"][0]
  end

  def answer
    begin
      str = STDIN.gets.chomp.encode("utf-8")
      if str == "exit" || str == "e"
        return false
      end
      return checkAnswer(str)
    rescue => ex
      STDERR.puts ex
      STDERR.puts ex.backtrace
      return false
    end
  end

  def checkAnswer(word)
    #ひらがなのみかどうか
    if !(word.hiragana?)
      STDERR.puts("ひらがな以外を含む")
      return false
    end

    #単語が短くないか
    if (word.size <= 2)
      STDERR.puts("単語が短い")
      return false
    end

    #最後の文字がしりとり的に正しいか調べる
    if !(word.last_char?)
      STDERR.puts("んで終わる")
      return false
    end

    #単語リストに含まれるか
    if !(included_in_wordslist?(word))
      STDERR.puts("そんな単語はない")
      return false
    end

    #回答済みの単語でないか
    if @answer_list.include?(word)
      STDERR.puts("回答済みの単語だよ")
      return false
    end

    #しりとりとしてつながっているかどうか
    if !(checkShiritori(word))
      STDERR.puts("しりとりとしてつながっていない")
      return false
    end

    @last_word = word
    @answer_list.push(word)
    return true
  end

  def included_in_wordslist?(word)
    list = @wordslist[word[0]]
    if list.nil?
      return false
    end
    return  list.include?(word)
  end

  def checkShiritori(word)
    last_char = @last_word.get_last_char
    return last_char == word[0]
  end
end

#初期化
shiritoris = Shiritoris.new

print "しりとりをしましょう\n"
print "#{shiritoris.last_word} ->"

while shiritoris.answer
  print "-> "
end
