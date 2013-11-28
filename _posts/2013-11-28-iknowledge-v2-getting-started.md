---
layout: article
title: 一分钟安装iKnowledge
date: 2013-11-28 21:18:23
category: 第二版
excerpt:
  下载、安装并运行iKnowledge
---

# 1. 安装Jekyll

```bash
$ gem install jekyll
```

因为iKnowledge基于[Jekyll](http://jekyllrb.com/)，因此这一步是必需完成的。如果上述命令在你的环境中不能成功执行，请参考[jekyll安装指南]()。

# 2. 下载iKnowledge

```bash
$ wget https://github.com/redraiment/iKnowledge/archive/master.zip
$ ls
master.zip
```

# 3. 安装iKnowledge

```bash
$ unzip master.zip
$ ls
iKnowledge-master master.zip
```

iKnowledge的安装非常简单，只需解压刚刚下载的压缩包即可！

# 4. 运行iKnowledge

和其他jekyll网站一样，你可以通过jekyll serve来运行：

```bash
$ cd iKnowledge-master
$ jekyll serve
Configuration file: /home/redraiment/iKnowledge-master/_config.yml
            Source: /home/redraiment/iKnowledge-master
       Destination: /home/redraiment/iKnowledge-master/_site
      Generating... done.
    Server address: http://0.0.0.0:4000
  Server running... press ctrl-c to stop.
```

此时，打开网页浏览器，访问`http://localhost:4000`，如果能正常看到首页，恭喜你已经成功安装并运行iKnowledge！

# 5. 下一步

[开始使用iKnowledge]({% post_url 2013-11-28-iknowledge-v2-wiki %})！
