# -*- coding: utf-8 -*-

# 自动生成CNAME文件
module IKnowledge
  class CNamePage < Jekyll::Page
    def initialize(site, url)
      @site = site
      @base = site.source
      @dir = ''
      @name = 'CNAME'

      self.process(@name)
      self.data = {}
      self.content = "#{url}\n"
    end
  end

  class DomainGenerator < Jekyll::Generator
    def generate(site)
      if site.data['blog'] and site.data['blog']['url']
        site.pages << CNamePage.new(site, site.data['blog']['url'])
      end
    end
  end
end
