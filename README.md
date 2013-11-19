欢迎访问基于iKnowledge 2.0的博客：http://zzp.me

http://redraiment.com/ 的文章会逐步迁移到 http://zzp.me

# iKnowledge 2.0

年初我开发了[iKnowledge](http://zzp.me/2013-11-16/iknowledge-v2-release/)，当时为了快速地完成从无到有的突破，我选择基于ExtJS来实现（稍纵即逝的灵感很容易被惰性打败）。在这大半年里，我依旧不断地学习新技术，以前一直下不了决心学习Python、[Ruby](http://ruby-lang.org/)等主流脚本语言，现在也开始使用并喜欢上它们。在仔细阅读了[Jekyll](http://jekyllrb.com/docs/home/)的官方文档后，我觉得时机已经成熟，便开始动手开发新版的iKnowledge！

经过几夜奋斗，iKnowledge 2.0终于完成，实现了许多我梦寐以求的功能！新版本之于旧版本，犹如SVN之于CVS：iKnowledge 1.0是伟大的软件，它从无到有的创新（当然也许早就存在我不知道的同类软件），但同时它不是一款好软件，安装繁琐、使用麻烦、体态臃肿……；iKnowledge 2.0站在巨人的肩膀之上，从软件的安装到使用，许多方面都得到了改善，它努力成为一款好用的软件！

再次感谢[Jekyll](http://jekyllrb.com/)，感谢[Ruby](http://ruby-lang.org/)！如果没有这些优秀的开源软件，道路会曲折很多。

# iKnowledge 的改进

## 更简便的安装

第一版可谓是东拼西凑的产物，很多功能都停留在“能工作”的状态。例如从零搭建一套iKnowledge v1.0，你需要在本地安装Java、Shell环境、下载Rhino……门槛相当高。

新版本努力在这方面做得更好，新版本不会图一时便利而引入额外的工具或库。你需要做的仅仅是执行

    git clone --depth 1 https://github.com/redraiment/iKnowledge.git

然后开始写文章！

## 超轻量级

iKnowledge终于摆脱了“击败全球99%的龟速博客”称号。现在，包括[Ruby](http://ruby-lang.org/)开发的[Jekyll](http://jekyllrb.com/)插件在内，整套系统只有100KB！单张页面不到2KB，比起一些刻意为移动设备优化过的网页还要小！

同时，iKnowledge还从重度依赖JavaScript的极端走向无JavaScript的另一个极端！第一版只有一张页面，所有文章的内容都通过AJAX动态加载，对搜索引擎的爬虫不够友好，导致站内搜索功能形同虚设；新版则是真正生成了纯静态的页面，每篇文章都是独立页面。

## 分类归档

1. 分类依旧可嵌套：第一版本中已实现；
1. 同一篇文章可属于多个分类：由于第一版的分层结构依赖文件目录结构，因此一篇文章只隶属于一种分类；
1. 文章所属分类变化时不影响文章的URL：第一版分类结构变化时URL也会随之变化，理由同上；
1. 文章名不再出现在分类列表中：第一版分类与文章都放在同一颗树中，新版分类列表中不再包含文章链接，取而代之的是点击分类链接时显示该分类下的文章列表。

## Markdown

自2010年参加工作以来，我的CSDN博客几乎停止更新，偶尔发点小打小闹的东西。因为我转战线下：改用Emacs自带的org-mode来写文章，这更能让我专注于文章的内容。这半年里除了学习新的编程技术，我还掌握了Markdown格式，我发现它比org-mode更适合写文章，而且[Jekyll](http://jekyllrb.com/)默认就能处理！

第一版中写文章需要手工书写HTML，遇到需要贴代码的情况还要手工转移特殊字符，这些琐事很影响我写作的心情和欲望。现在换成Markdown之后，它简洁的语法让我更有写作的冲动！

## 修改历史

这是iKnowledge的特色功能之一！即自动在每篇文章的末尾追加修改历史。

早在2009年，我就向CSDN博客维护团队建议过添加这个功能，但我很能理解他们否决的理由，这个功能很多人都用不上，甚至有些人还排斥这个功能。当时我要求添加这个功能的初衷是有很多网友在看我写的文章时会发现其中有错别字或其他错误，我希望有一个地方能统一展示有哪些人为这篇文章做出贡献。

另一个原因和我写文章的方式有关，我写文章通常不是一气呵成，往往从灵感乍现，到下笔写作，最后成文发布要经历很长的一段时间。例如我开发“中文计算器”这个小工具不是某一天一拍脑袋就想出来的，而是早在一年前研究阿拉伯数字转中文大写的算法，之后又研究中文转阿拉伯数字，最有才想到做成一个中文的计算器。我希望能完整地记录这个过程。

## 社交分享

最后，感谢新浪微博提供的评论箱功能，让静态页面也拥有评论的功能！同时集成微博分享功能，因此新版本中微博分享的按钮已经取消了。
