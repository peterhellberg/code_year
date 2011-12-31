require_relative 'languages'

module CodeYear
  class TweetParser
    attr_reader :text

    def self.parse(text)
      new(text).parse
    end

    def initialize(text)
      @original_text = text
      @text = text.
              downcase.
              gsub('js', 'javascript').
              gsub('obj-c', 'objective-c').
              gsub('objectivec', 'objective-c').
              gsub(/#code\d{4}|and|more|less|some|&|\)|\(|\:/, '').
              gsub(/dabbled|a bit of/, '').
              gsub(/,|\/|\./, ' ').
              gsub(' pl sql', ' pl/sql').
              gsub(' pure data', ' pd').
              gsub(' emacs lisp', ' emacs-lisp').
              gsub(/\s+/, ' ').
              strip
    end

    def parse
      LANGUAGES.select { |language| " #{@text} ".include?(" #{language} ") }
    end
  end
end
