/*
Navicat MySQL Data Transfer

Source Server         : kingja
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : kblog

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-01-10 22:42:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `authorId` int(10) DEFAULT NULL,
  `title` varchar(255) DEFAULT '' COMMENT '文章标题',
  `content` mediumtext,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `readCount` int(10) unsigned DEFAULT '0' COMMENT '阅读数',
  `commentCount` int(10) unsigned DEFAULT '0' COMMENT '评价数',
  `categoryId` int(10) DEFAULT '0' COMMENT '标签',
  `author` varchar(255) DEFAULT 'KingJA' COMMENT '作者',
  PRIMARY KEY (`id`),
  KEY `article_ibfk_1` (`categoryId`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '1', '怎么写一篇高逼格的技术文章1', '正如标题所言，到底怎么写呢', '2017-01-07 11:15:54', '2017-01-10 22:42:15', '456', '0', '6', 'KingJA');
INSERT INTO `article` VALUES ('2', '1', '怎么写一篇高逼格的技术文章2', '正如标题所言，到底怎么写呢', '2016-11-01 11:16:35', '2017-01-10 22:42:15', '574', '0', '6', 'KingJA');
INSERT INTO `article` VALUES ('3', '1', '怎么写一篇高逼格的技术文章3', '正如标题所言，到底怎么写呢', '2016-06-01 11:16:36', '2017-01-10 22:42:16', '654', '0', '8', 'KingJA');
INSERT INTO `article` VALUES ('4', '1', '怎么写一篇高逼格的技术文章4', '正如标题所言，到底怎么写呢', '2016-08-01 11:16:37', '2017-01-10 22:42:16', '45', '0', '8', 'KingJA');
INSERT INTO `article` VALUES ('5', '1', '怎么写一篇高逼格的技术文章5', '正如标题所言，到底怎么写呢', '2016-12-01 11:16:37', '2017-01-10 22:42:16', '765', '0', '6', 'KingJA');
INSERT INTO `article` VALUES ('6', '1', '怎么写一篇高逼格的技术文章6', '正如标题所言，到底怎么写呢', '2017-01-08 11:16:37', '2017-01-10 22:42:16', '56', '0', '6', 'KingJA');
INSERT INTO `article` VALUES ('7', '1', '怎么卖掉一只猪', '# 第三方地方', '2016-11-01 15:15:29', '2017-01-10 21:21:22', '5675', '0', '7', 'KingJA');
INSERT INTO `article` VALUES ('8', '1', 'sdfsd', '# fdsf d ', '2016-08-01 15:18:57', '2017-01-10 21:21:22', '456', '0', '7', 'KingJA');
INSERT INTO `article` VALUES ('9', '1', '欢迎使用 Cmd Markdown 编辑阅读器', '# 欢迎使用 Cmd Markdown 编辑阅读器\n\n------\n\n我们理解您需要更便捷更高效的工具记录思想，整理笔记、知识，并将其中承载的价值传播给他人，**Cmd Markdown** 是我们给出的答案 —— 我们为记录思想和分享知识提供更专业的工具。 您可以使用 Cmd Markdown：\n\n> * 整理知识，学习笔记\n> * 发布日记，杂文，所见所想\n> * 撰写发布技术文稿（代码支持）\n> * 撰写发布学术论文（LaTeX 公式支持）\n\n![cmd-markdown-logo](https://www.zybuluo.com/static/img/logo.png)\n\n除了您现在看到的这个 Cmd Markdown 在线版本，您还可以前往以下网址下载：\n\n### [Windows/Mac/Linux 全平台客户端](https://www.zybuluo.com/cmd/)\n\n> 请保留此份 Cmd Markdown 的欢迎稿兼使用说明，如需撰写新稿件，点击顶部工具栏右侧的 <i class=\"icon-file\"></i> **新文稿** 或者使用快捷键 `Ctrl+Alt+N`。\n\n------\n\n## 什么是 Markdown\n\nMarkdown 是一种方便记忆、书写的纯文本标记语言，用户可以使用这些标记符号以最小的输入代价生成极富表现力的文档：譬如您正在阅读的这份文档。它使用简单的符号标记不同的标题，分割不同的段落，**粗体** 或者 *斜体* 某些文字，更棒的是，它还可以\n\n### 1. 制作一份待办事宜 [Todo 列表](https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#13-待办事宜-todo-列表)\n\n- [ ] 支持以 PDF 格式导出文稿\n- [ ] 改进 Cmd 渲染算法，使用局部渲染技术提高渲染效率\n- [x] 新增 Todo 列表功能\n- [x] 修复 LaTex 公式渲染问题\n- [x] 新增 LaTex 公式编号功能\n\n### 2. 书写一个质能守恒公式[^LaTeX]\n\n$$E=mc^2$$\n\n### 3. 高亮一段代码[^code]\n\n```python\n@requires_authorization\nclass SomeClass:\n    pass\n\nif __name__ == \'__main__\':\n    # A comment\n    print \'hello world\'\n```\n\n### 4. 高效绘制 [流程图](https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#7-流程图)\n\n```flow\nst=>start: Start\nop=>operation: Your Operation\ncond=>condition: Yes or No?\ne=>end\n\nst->op->cond\ncond(yes)->e\ncond(no)->op\n```\n\n### 5. 高效绘制 [序列图](https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#8-序列图)\n\n```seq\nAlice->Bob: Hello Bob, how are you?\nNote right of Bob: Bob thinks\nBob-->Alice: I am good thanks!\n```\n\n### 6. 高效绘制 [甘特图](https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#9-甘特图)\n\n```gantt\n    title 项目开发流程\n    section 项目确定\n        需求分析       :a1, 2016-06-22, 3d\n        可行性报告     :after a1, 5d\n        概念验证       : 5d\n    section 项目实施\n        概要设计      :2016-07-05  , 5d\n        详细设计      :2016-07-08, 10d\n        编码          :2016-07-15, 10d\n        测试          :2016-07-22, 5d\n    section 发布验收\n        发布: 2d\n        验收: 3d\n```\n\n### 7. 绘制表格\n\n| 项目        | 价格   |  数量  |\n| --------   | -----:  | :----:  |\n| 计算机     | \\$1600 |   5     |\n| 手机        |   \\$12   |   12   |\n| 管线        |    \\$1    |  234  |\n\n### 8. 更详细语法说明\n\n想要查看更详细的语法说明，可以参考我们准备的 [Cmd Markdown 简明语法手册][1]，进阶用户可以参考 [Cmd Markdown 高阶语法手册][2] 了解更多高级功能。\n\n总而言之，不同于其它 *所见即所得* 的编辑器：你只需使用键盘专注于书写文本内容，就可以生成印刷级的排版格式，省却在键盘和工具栏之间来回切换，调整内容和格式的麻烦。**Markdown 在流畅的书写和印刷级的阅读体验之间找到了平衡。** 目前它已经成为世界上最大的技术分享网站 GitHub 和 技术问答网站 StackOverFlow 的御用书写格式。\n\n---\n\n## 什么是 Cmd Markdown\n\n您可以使用很多工具书写 Markdown，但是 Cmd Markdown 是这个星球上我们已知的、最好的 Markdown 工具——没有之一 ：）因为深信文字的力量，所以我们和你一样，对流畅书写，分享思想和知识，以及阅读体验有极致的追求，我们把对于这些诉求的回应整合在 Cmd Markdown，并且一次，两次，三次，乃至无数次地提升这个工具的体验，最终将它演化成一个 **编辑/发布/阅读** Markdown 的在线平台——您可以在任何地方，任何系统/设备上管理这里的文字。\n\n### 1. 实时同步预览\n\n我们将 Cmd Markdown 的主界面一分为二，左边为**编辑区**，右边为**预览区**，在编辑区的操作会实时地渲染到预览区方便查看最终的版面效果，并且如果你在其中一个区拖动滚动条，我们有一个巧妙的算法把另一个区的滚动条同步到等价的位置，超酷！\n\n### 2. 编辑工具栏\n\n也许您还是一个 Markdown 语法的新手，在您完全熟悉它之前，我们在 **编辑区** 的顶部放置了一个如下图所示的工具栏，您可以使用鼠标在工具栏上调整格式，不过我们仍旧鼓励你使用键盘标记格式，提高书写的流畅度。\n\n![tool-editor](https://www.zybuluo.com/static/img/toolbar-editor.png)\n\n### 3. 编辑模式\n\n完全心无旁骛的方式编辑文字：点击 **编辑工具栏** 最右侧的拉伸按钮或者按下 `Ctrl + M`，将 Cmd Markdown 切换到独立的编辑模式，这是一个极度简洁的写作环境，所有可能会引起分心的元素都已经被挪除，超清爽！\n\n### 4. 实时的云端文稿\n\n为了保障数据安全，Cmd Markdown 会将您每一次击键的内容保存至云端，同时在 **编辑工具栏** 的最右侧提示 `已保存` 的字样。无需担心浏览器崩溃，机器掉电或者地震，海啸——在编辑的过程中随时关闭浏览器或者机器，下一次回到 Cmd Markdown 的时候继续写作。\n\n### 5. 离线模式\n\n在网络环境不稳定的情况下记录文字一样很安全！在您写作的时候，如果电脑突然失去网络连接，Cmd Markdown 会智能切换至离线模式，将您后续键入的文字保存在本地，直到网络恢复再将他们传送至云端，即使在网络恢复前关闭浏览器或者电脑，一样没有问题，等到下次开启 Cmd Markdown 的时候，她会提醒您将离线保存的文字传送至云端。简而言之，我们尽最大的努力保障您文字的安全。\n\n### 6. 管理工具栏\n\n为了便于管理您的文稿，在 **预览区** 的顶部放置了如下所示的 **管理工具栏**：\n\n![tool-manager](https://www.zybuluo.com/static/img/toolbar-manager.jpg)\n\n通过管理工具栏可以：\n\n<i class=\"icon-share\"></i> 发布：将当前的文稿生成固定链接，在网络上发布，分享\n<i class=\"icon-file\"></i> 新建：开始撰写一篇新的文稿\n<i class=\"icon-trash\"></i> 删除：删除当前的文稿\n<i class=\"icon-cloud\"></i> 导出：将当前的文稿转化为 Markdown 文本或者 Html 格式，并导出到本地\n<i class=\"icon-reorder\"></i> 列表：所有新增和过往的文稿都可以在这里查看、操作\n<i class=\"icon-pencil\"></i> 模式：切换 普通/Vim/Emacs 编辑模式\n\n### 7. 阅读工具栏\n\n![tool-manager](https://www.zybuluo.com/static/img/toolbar-reader.jpg)\n\n通过 **预览区** 右上角的 **阅读工具栏**，可以查看当前文稿的目录并增强阅读体验。\n\n工具栏上的五个图标依次为：\n\n<i class=\"icon-list\"></i> 目录：快速导航当前文稿的目录结构以跳转到感兴趣的段落\n<i class=\"icon-chevron-sign-left\"></i> 视图：互换左边编辑区和右边预览区的位置\n<i class=\"icon-adjust\"></i> 主题：内置了黑白两种模式的主题，试试 **黑色主题**，超炫！\n<i class=\"icon-desktop\"></i> 阅读：心无旁骛的阅读模式提供超一流的阅读体验\n<i class=\"icon-fullscreen\"></i> 全屏：简洁，简洁，再简洁，一个完全沉浸式的写作和阅读环境\n\n### 8. 阅读模式\n\n在 **阅读工具栏** 点击 <i class=\"icon-desktop\"></i> 或者按下 `Ctrl+Alt+M` 随即进入独立的阅读模式界面，我们在版面渲染上的每一个细节：字体，字号，行间距，前背景色都倾注了大量的时间，努力提升阅读的体验和品质。\n\n### 9. 标签、分类和搜索\n\n在编辑区任意行首位置输入以下格式的文字可以标签当前文档：\n\n标签： 未分类\n\n标签以后的文稿在【文件列表】（Ctrl+Alt+F）里会按照标签分类，用户可以同时使用键盘或者鼠标浏览查看，或者在【文件列表】的搜索文本框内搜索标题关键字过滤文稿，如下图所示：\n\n![file-list](https://www.zybuluo.com/static/img/file-list.png)\n\n### 10. 文稿发布和分享\n\n在您使用 Cmd Markdown 记录，创作，整理，阅读文稿的同时，我们不仅希望它是一个有力的工具，更希望您的思想和知识通过这个平台，连同优质的阅读体验，将他们分享给有相同志趣的人，进而鼓励更多的人来到这里记录分享他们的思想和知识，尝试点击 <i class=\"icon-share\"></i> (Ctrl+Alt+P) 发布这份文档给好友吧！\n\n------\n\n再一次感谢您花费时间阅读这份欢迎稿，点击 <i class=\"icon-file\"></i> (Ctrl+Alt+N) 开始撰写新的文稿吧！祝您在这里记录、阅读、分享愉快！\n\n作者 [@ghosert][3]\n2016 年 07月 07日\n\n[^LaTeX]: 支持 **LaTeX** 编辑显示支持，例如：$\\sum_{i=1}^n a_i=0$， 访问 [MathJax][4] 参考更多使用方法。\n\n[^code]: 代码高亮功能支持包括 Java, Python, JavaScript 在内的，**四十一**种主流编程语言。\n\n[1]: https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown\n[2]: https://www.zybuluo.com/mdeditor?url=https://www.zybuluo.com/static/editor/md-help.markdown#cmd-markdown-高阶语法手册\n[3]: http://weibo.com/ghosert\n[4]: http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference\n\n', '2016-12-01 09:48:30', '2017-01-10 21:21:22', '45565', '0', '9', 'KingJA');
INSERT INTO `article` VALUES ('10', '1', '语法高亮', '---\n``` javascript\n $(function () {\n        var content = $(\"#article\").text();\n        $(\"#article\").html(marked(content));\n    });\n```\n\n```java\npublic Map<String, Object> getGeneralParam(String token, String cardType, String dataTypeCode, Object privateParam) {\n        Gson gson = new Gson();\n        String json = gson.toJson(privateParam);\n        Map<String, Object> generalParam = new HashMap<>();\n        generalParam.put(\"token\", token);\n        generalParam.put(\"encryption\", \"0\");\n        generalParam.put(\"DataTypeCode\", dataTypeCode);\n        generalParam.put(\"content\", json);\n        generalParam.put(\"cardType\", cardType);\n        generalParam.put(\"taskId\", \"1\");\n        Log.e(\"PARAM\", gson.toJson(generalParam));\n        Logger.json(gson.toJson(generalParam));\n        return generalParam;\n\n    }\n```\n\n---\n\n# h1 Heading 8-)\n## h2 Heading\n### h3 Heading\n#### h4 Heading\n##### h5 Heading\n###### h6 Heading\n\n\n## Horizontal Rules\n\n___\n\n---\n\n***\n\n\n## Typographic replacements\n\nEnable typographer option to see result.\n\n(c) (C) (r) (R) (tm) (TM) (p) (P) +-\n\ntest.. test... test..... test?..... test!....\n\n!!!!!! ???? ,,  -- ---\n\n\"Smartypants, double quotes\" and \'single quotes\'\n\n\n## Emphasis\n\n**This is bold text**\n\n__This is bold text__\n\n*This is italic text*\n\n_This is italic text_\n\n~~Strikethrough~~\n\n\n## Blockquotes\n\n\n> Blockquotes can also be nested...\n>> ...by using additional greater-than signs right next to each other...\n> > > ...or with spaces between arrows.\n\n\n## Lists\n\nUnordered\n\n+ Create a list by starting a line with `+`, `-`, or `*`\n+ Sub-lists are made by indenting 2 spaces:\n  - Marker character change forces new list start:\n    * Ac tristique libero volutpat at\n    + Facilisis in pretium nisl aliquet\n    - Nulla volutpat aliquam velit\n+ Very easy!\n\nOrdered\n\n1. Lorem ipsum dolor sit amet\n2. Consectetur adipiscing elit\n3. Integer molestie lorem at massa\n\n\n1. You can use sequential numbers...\n1. ...or keep all the numbers as `1.`\n\nStart numbering with offset:\n\n57. foo\n1. bar\n\n\n## Code\n\nInline `code`\n\nIndented code\n\n    // Some comments\n    line 1 of code\n    line 2 of code\n    line 3 of code\n\n\nBlock code \"fences\"\n\n```\nSample text here...\n```\n\nSyntax highlighting\n\n``` js\nvar foo = function (bar) {\n  return bar++;\n};\n\nconsole.log(foo(5));\n```\n\n## Tables\n\n| Option | Description |\n| ------ | ----------- |\n| data   | path to data files to supply the data that will be passed into templates. |\n| engine | engine to be used for processing templates. Handlebars is the default. |\n| ext    | extension to be used for dest files. |\n\nRight aligned columns\n\n| Option | Description |\n| ------:| -----------:|\n| data   | path to data files to supply the data that will be passed into templates. |\n| engine | engine to be used for processing templates. Handlebars is the default. |\n| ext    | extension to be used for dest files. |\n\n\n## Links\n\n[link text](http://dev.nodeca.com)\n\n[link with title](http://nodeca.github.io/pica/demo/ \"title text!\")\n\nAutoconverted link https://github.com/nodeca/pica (enable linkify to see)\n\n\n## Images\n\n![Minion](https://octodex.github.com/images/minion.png)\n![Stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg \"The Stormtroopocat\")\n\nLike links, Images also have a footnote style syntax\n\n![Alt text][id]\n\nWith a reference later in the document defining the URL location:\n\n[id]: https://octodex.github.com/images/dojocat.jpg  \"The Dojocat\"\n\n\n## Plugins\n\nThe killer feature of `markdown-it` is very effective support of\n[syntax plugins](https://www.npmjs.org/browse/keyword/markdown-it-plugin).\n\n\n### [Emojies](https://github.com/markdown-it/markdown-it-emoji)\n\n> Classic markup: :wink: :crush: :cry: :tear: :laughing: :yum:\n>\n> Shortcuts (emoticons): :-) :-( 8-) ;)\n\nsee [how to change output](https://github.com/markdown-it/markdown-it-emoji#change-output) with twemoji.\n\n\n### [Subscript](https://github.com/markdown-it/markdown-it-sub) / [Superscript](https://github.com/markdown-it/markdown-it-sup)\n\n- 19^th^\n- H~2~O\n\n\n### [\\<ins>](https://github.com/markdown-it/markdown-it-ins)\n\n++Inserted text++\n\n\n### [\\<mark>](https://github.com/markdown-it/markdown-it-mark)\n\n==Marked text==\n\n\n### [Footnotes](https://github.com/markdown-it/markdown-it-footnote)\n\nFootnote 1 link[^first].\n\nFootnote 2 link[^second].\n\nInline footnote^[Text of inline footnote] definition.\n\nDuplicated footnote reference[^second].\n\n[^first]: Footnote **can have markup**\n\n    and multiple paragraphs.\n\n[^second]: Footnote text.\n\n\n### [Definition lists](https://github.com/markdown-it/markdown-it-deflist)\n\nTerm 1\n\n:   Definition 1\nwith lazy continuation.\n\nTerm 2 with *inline markup*\n\n:   Definition 2\n\n        { some code, part of Definition 2 }\n\n    Third paragraph of definition 2.\n\n_Compact style:_\n\nTerm 1\n  ~ Definition 1\n\nTerm 2\n  ~ Definition 2a\n  ~ Definition 2b\n\n\n### [Abbreviations](https://github.com/markdown-it/markdown-it-abbr)\n\nThis is HTML abbreviation example.\n\nIt converts \"HTML\", but keep intact partial entries like \"xxxHTMLyyy\" and so on.\n\n*[HTML]: Hyper Text Markup Language\n\n### [Custom containers](https://github.com/markdown-it/markdown-it-container)\n\n::: warning\n*here be dragons*\n:::\n', '2017-01-10 14:53:50', '2017-01-10 21:21:22', '7655', '0', '9', 'KingJA');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('6', 'Java', '2017-01-10 20:33:56');
INSERT INTO `category` VALUES ('7', 'Android', '2017-01-10 20:33:51');
INSERT INTO `category` VALUES ('8', 'Javascript', '2017-01-10 20:34:20');
INSERT INTO `category` VALUES ('9', '前端', '2017-01-10 20:34:25');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '' COMMENT '用户名',
  `password` varchar(255) DEFAULT '' COMMENT '密码',
  `nick` varchar(255) DEFAULT '' COMMENT '昵称',
  `role` tinyint(1) DEFAULT '0' COMMENT '角色',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'aaa', 'bbb', 'KingJA Me', '0', '2017-01-09 10:49:18', '2017-01-09 11:13:38');
SET FOREIGN_KEY_CHECKS=1;
