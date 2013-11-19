# -*- coding: utf-8 -*-

require 'pathname'

# iKnowledge特色功能之一
# 每篇文章末尾提供Git提交的记录，即展示修改历史
# 很多人从来不会回头看自己写的文章/博客
# 但iKnowledge作为知识库，需要频繁地回顾，自然每篇文章会不断地完善
module IKnowledge
  # 按照类型归档
  class PageChangeLogGenerator < Jekyll::Generator
    def generate(site)
      begin
        require 'grit'
      rescue LoadError
        # 如果用户为安装grit
        # 并不强制用户使用修改历史插件
        puts "如果您希望使用“修改历史”插件，请安装grit库"
        return
      end

      _posts = File.join(site.source, '_posts')
      repo = [_posts, site.source].find {|src|
        # 允许_posts独立作为一个仓库
        File.directory? File.join(src, '.git')
      }
      if repo
        root = Pathname.new(repo)
      else
        puts "如果您希望使用“修改历史”插件，请先创建git仓库"
        return
      end

      pwd = Dir.pwd
      Dir.chdir(repo)
      git = Grit::Repo.new('.')

      site.posts.each do |post|
        post_path = Pathname.new(File.join(site.source, post.path))
        git_path = post_path.relative_path_from(root).to_s
        post.data['logs'] = git.log(git_path).map do |log|
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
