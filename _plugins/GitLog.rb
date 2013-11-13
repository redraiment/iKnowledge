# -*- coding: utf-8 -*-

require 'grit'

# iKnowledge特色功能之一
# 每篇文章末尾提供Git提交的记录，即展示修改历史
# 很多人从来不会回头看自己写的文章/博客
# 但iKnowledge作为知识库，需要频繁地回顾，自然每篇文章会不断地完善
module IKnowledge
  # 按照类型归档
  class PageChangeLogGenerator < Jekyll::Generator
    def generate(site)
      pwd = Dir.pwd

      workdir = File.join(site.source, '_posts')
      Dir.chdir(workdir)
      git = Grit::Repo.new('.')

      site.posts.each do |post|
        post.data['logs'] = git.log(File.basename(post.path)).map do |log|
          {
            'date' => log.committed_date,
            'message' => log.message.force_encoding('utf-8'),
            'author' => log.author.name,
            'email' => log.author.email
          }
        end
      end

      Dir.chdir(pwd)
    end
  end
end
