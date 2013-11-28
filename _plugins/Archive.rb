# -*- coding: utf-8 -*-

# iKnowledge归档插件
# 按照类型和时间两种方式归档文章
module IKnowledge
  # 归档页面
  class ArchivePage < Jekyll::Page
    def initialize(site, name, posts)
      @site = site
      @base = site.source
      @dir = 'archive'
      @name = "#{name}.html"

      self.process(@name)
      self.read_yaml(File.join(@base, site.config['layouts']), 'archive.html')
      self.data.merge!({
        'layout' => 'archive',
        'title' => name,
        'posts' => posts
      })
    end
  end

  # 按照类型归档
  class CategoryPageGenerator < Jekyll::Generator
    def generate(site)
      site.categories.each do |category, posts|
        site.pages << ArchivePage.new(site, category, posts)
      end
    end
  end

  # 类型归档列表
  class CategoryListTag < Liquid::Tag
    def walk(root)
      '<ul>' + root.map do |e|
        id = e['id'].downcase
        count = @site.categories[id].length
        name = e['name'] || e['id']

        label = count == 0? name: "#{name}(#{count})"
        url = count == 0? '#': "/archive/#{id}.html"

        children = e['children']? walk(e['children']): ''

        "<li><a href=\"#{url}\">#{label}</a>#{children}</li>"
      end.join + '</ul>'
    end

    def render(context)
      @site = context.registers[:site]
      @@html ||= walk(@site.data['categories'])
    end
  end

  # 按照时间（年-月）归档
  class TimelinePageGenerator < Jekyll::Generator
    def generate(site)
      site.posts.group_by {|post|
        post.date.strftime "%Y-%m"
      }.each do |date, posts|
        site.pages << ArchivePage.new(site, date, posts.reverse)
      end
    end
  end

  # 时间归档列表
  class TimelineListTag < Liquid::Tag
    def walk(posts)
      '<ul>' + posts.reverse.group_by {
        |post| post.date.year
      }.map do |year, posts|
        "<li><a href=\"#\">#{year}年</a><ul>" + posts.group_by {
          |post| post.date.month
        }.map {|month, posts|
          format "<li><a href=\"/archive/%d-%02d.html\">%02d月(%d)</a></li>", year, month, month, posts.length
        }.join + '</ul></li>'
      end.join + '</ul>'
    end

    def render(context)
      @site = context.registers[:site]
      @@html ||= walk(@site.posts)
    end
  end
end

Liquid::Template.register_tag('category_list', IKnowledge::CategoryListTag)
Liquid::Template.register_tag('timeline_list', IKnowledge::TimelineListTag)
