# encoding: UTF-8

require 'minitest/pride'
require 'minitest/autorun'
require 'minitest/spec'

require_relative '../lib/code_year/tweet_parser'

include CodeYear

describe TweetParser do
  describe "when called with a string containing programming languages" do
    it "should return the correct number of programming languages and contain the sample language" do
      [
        ['scala, python, ruby, objective-c, java,c#, actionscript, javascript. #code2011', 8, 'java'],
        ['Java, C/C++, PHP, SQL, jQuery/JavaScript, Python, Ruby #code2011', 8, 'c++'],
        ['Released to PRD: Python Java Bash PHP SQL Ruby Dabbled: R Scala Groovy Obj-C Ruby Javascript #code2011', 11, 'objective-c'],
        ['c and some C# #code2011', 2, 'c#'],
        ['C#, SQL, Python, Javascript, jQuery and a bit of Java & Octave #code2011', 6, 'octave'],
        ['JS, C++, Objective-C, Ruby, PHP, shell (bash/zsh), CoffeeScript (ugh), Python. (XUL, HTML, CSS don\'t quite count…) #code2011', 9, 'javascript'],
        ['JavaScript, CoffeeScript, VimScript, Shell (ZSH), Ruby, PHP and a little bit of Python, Haskell and C++ #code2011', 9, 'zsh'],
        ['Java, JavaScript, Python, Ruby, Lua, PHP, Perl #code2011', 7, 'lua'],
        ['C, C++, Java, HTML, PHP, JavaScript, Prolog, PL/SQL. #code2011', 7, 'pl/sql'],
        ['SuperCollider, Scheme, Java, C, JavaScript, Python, Pure Data, and in the past weeks Lua. #code2011', 8, 'pd'],
        ['Processing, JavaScript, HTML, Supercollider, PHP and C++ #code2011', 5, 'processing'],
        ['C++, Go, Python, Java and a little Haskell #code2011', 5, 'go'],
        ['Obj-c, ActionScript 3, JavaScript, C#, Go, Perl, C/C++, Dart, SQL #code2011', 10, 'dart'],
        ['#code2011 clojure javascript java python octave common-lisp', 6, 'common-lisp'],
        ['c, c++, python, assembly, erlang, f# #code2011', 6, 'assembly'],
        ['#code2011, in order of enjoyment: Clojure, Racket, Python, Emacs Lisp, Java, Octave, SQL, Bash', 8, 'emacs-lisp'],
        ['Java, Scala, Haskell, ActionScript and of course COBOL. #code2011', 5, 'cobol'],
        ['Scala, ObjectiveC, Coffeescript #code2011', 3, 'objective-c'],
      ].each do |tweet, count, sample|
        result = TweetParser.parse(tweet)
        result.count.must_equal count
        result.must_include sample
      end
    end
  end
end
