---
layout: article
title: 开始使用iKnowledge
date: 2013-11-28 21:48:44
category: 第二版
excerpt:
  iKnowledge使用中的常见问题
---

# Q: 如何修改网站信息？

开始使用iKnowledge之前先要配置一些基本信息，例如博客的名称、域名地址等。

所有博客相关的信息都在文件`_data/blog.yml`中：

```yaml
name: 博客名
motto: 座右铭
url: 个人域名
author:
  id: 网名
  name: 真实姓名
  email: 电子邮件
```

把`博客名`等内容修改成你自己的个人信息，它们会出现在页面的相应位置。

*注意*：如果你没有自己的独立域名，请删除`url`这一行；如果设置了自己的域名，iKnowledge会在`_site`目录下额外生成一个名为`CNAME`的文件，用于Github Pages等。

# Q: 如何自定义层级分类列表？

层级分类列表的信息保存在文件`_data/categories.yml`中，与`_data/blog.yml`一样，这也是一个[YAML](http://zh.wikipedia.org/zh-cn/YAML)文档：

```yaml
- id: iKnowledge
  excerpt: iKnowledge使用手册
  children:
    - id: v1
      name: 第一版
    - id: v2
      name: 第二版

- id: 友情链接
```

每个字段的意义如下：

* id：必须的字段。必须全局唯一，用于每篇文章的分类（category）。
* name：用于在页面上展示的名字，如果该字段未指定，系统使用`id`字段代替。该字段并不要唯一性。
* excerpt：简短的描述，介绍该分类的内容。该描述会现在是分类页面上。
* children： 子类别（如果有的话）。

# Q: 如何写文章？

新的文章必须放在_posts目录下，并且文件名格式为：

```
YEAR-MONTH-DAY-title.md
```

其中YEAR是四位数，MONTH和DAY是两位数，title是文章标题。例如以下文件名都是合法的：

```
2013-03-13-iknowledge-v1-release.md
2013-11-16-iknowledge-v2-release.md
2013-11-27-iknowledge-users.md
2013-11-28-iknowledge-v2-getting-started.md
2013-11-28-iknowledge-v2-wiki.md
```

`.md`扩展名表明文章采用Markdown格式，如果你还不熟悉Markdown语法，请参考[《Mark语法说明（简体中文版）》](http://wowubuntu.com/markdown/)。

# Q: 如何插入图片？

按照习惯，图片放在资源目录（resource）下，你可以使用Markdown的语法在文章中插入图片：

```
![Avatar]({{ site.url }}/resource/image/avatar.gif)
```

效果如下：

![Avatar](resource/image/avatar.gif)

iKnowledge还提供了一种额外的方式插入图片。如果图片放置的路径为：

```
resource/YEAR-MONTH-DAY/title/
```

其中`YEAR`、`MONTH`、`DAY`以及`title`的值均与当前文章的文件名一致，就能使用`img`标签来插入图片。例如本文的文件名是`2013-11-28-iknowledge-v2-wiki.md`，另外有一张图片`1.gif`放置在`resource/2013-11-28/iknowledge-v2-wiki/`目录下，在文章中使用：

<pre>&#123;% img 1.gif %&#125;</pre>

即可插入图片。

# Q: 如何使用修改历史插件？

`_plugins/GitLog.rb`依赖grit库，iKnowledge通过它来获取文章的历史信息。因此需要先安装grit，执行下列命令：

```bash
$ gem install grit
```

grit是一个用于操作git的ruby库，即使没有安装grit，iKnowledge依旧能正常使用，只是文章末尾不会生成修改历史。

# Q: 下一步？

因为iKnowledge就是Jekyll，所有Jekyll的功能都照常能用。想了解iKnowledge更多的功能，请参考[Jekyll在线文档](http://jekyllrb.com/docs/home/)。