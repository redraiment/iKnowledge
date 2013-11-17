# -*- coding: utf-8 -*-

# 自动生成图片路径
module IKnowledge
  class ArticleFigureTag < Liquid::Tag
    def initialize(tag, text, tokens)
      super
      value = text.split
      @name = value[0];
      @align = value.length > 1? value[1]: ''
    end

    def render(context)
      page = context.registers[:page]
      if @align == ''
        "<img src=\"/resource#{page['url']}#@name\" />"
      else
        "<img align=\"#@align\" src=\"/resource#{page['url']}#@name\" />"
      end
    end
  end
end

Liquid::Template.register_tag('img', IKnowledge::ArticleFigureTag)
