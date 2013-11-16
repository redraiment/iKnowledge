# -*- coding: utf-8 -*-

# Redcarpet生成的Table没有任何标记
# 为<table>设置样式会影响gist插件的样式
# 因此要设置相应的class，缩小范围
module Jekyll
  module Convertible
    alias_method :original_write, :write

    def write(dest)
      if self.output.include? '<table>'
        self.output['<table>'] = '<table class="content-table">'
      end
      original_write(dest);
    end
  end
end
