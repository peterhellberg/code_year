require_relative 'languages'

module CodeYear
  class TweetParser
    attr_reader :original_text, :text

    def self.parse(text)
      new(text).parse
    end

    def initialize(text)
      @original_text = text
      @text = text.
              downcase.
              gsub('as3', 'actionscript').
              gsub('js', 'javascript').
              gsub('golang', 'go').
              gsub(/obj-c|objectivec/, 'objective-c').
              gsub(/#code\d{4}|and|more|less|some|&|\)|\(|\:|\/cc/, '').
              gsub(/dabbled|a bit of|a tiny bit|this year i|wrote/, '').
              gsub(/mainly/, '').
              gsub(/^#/, '').
              gsub(/\s#/, ' ').
              gsub(/,|\/|\./, ' ').
              gsub(' pl sql', ' pl/sql').
              gsub(' pure data', ' pd').
              gsub(/ emacs lisp| elisp/, ' emacs-lisp').
              gsub(/\s+/, ' ').
              strip
    end

    def parse
      LANGUAGES.select { |language| " #{@text} ".include?(" #{language} ") }
    end
  end
end
