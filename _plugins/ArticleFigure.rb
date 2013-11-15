# -*- coding: utf-8 -*-

# 自动生成图片路径
module IKnowledge
  class ArticleFigureTag < Liquid::Tag
    def initialize(tag, text, tokens)
      super
      @name = text;
    end

    def render(context)
      page = context.registers[:page]
      "<img src=\"/resource#{page['url']}#@name\" />"
    end
  end
end

Liquid::Template.register_tag('img', IKnowledge::ArticleFigureTag)
