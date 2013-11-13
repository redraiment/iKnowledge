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
end
