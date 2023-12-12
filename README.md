<a id="语言" />

🌏 [简体中文](#简体中文) | [English](#英文)

<a id="简体中文" />

# 欢喜输入方案
## 项目概述
欢喜输入方案，懂程序员心意的[Rime输入法](https://rime.im/)方案！包含一些定制化的输入方案以及相关的词库。

## 设计理念
* 速度，速度，还是**速度**！本输入法方案*并非*追求大而全，而是追求快速的输入体验，因此无论是中文词库还是英文词库都是选用基本词库。另外，此输入法有自造词功能，用户可以在使用过程中形成自己独有的词库，这样就可以有效降低拼音重码和大量无用候选项，减少翻页次数，提高输入效率。
* 另一个重点设计理念是侧重于提高程序员中英混输的编程效率，同时也非常适合Markdown文档写作，尽量减少须要切换中/英文的情况，因此部分中文标点符号不直接上屏，而是提供候选菜单，可选择输入对应的中/英标点符号。对于有候选菜单的标点符号按键，基本上其对应的中文标点符号放在第1位，其对应的英文标点符号放在第2位，以方便盲打。除了‘、’号并不是按<kbd>\\</kbd>键，而是连按2次<kbd>;</kbd>键，因为考虑到编程需要，按<kbd>/</kbd>键和<kbd>\\</kbd>键将直接上屏英文符号‘/’和‘\’。部分标点符号按键还可以输入其它常用符号，具体见`joy.punctuation.yaml`。当然，也可以根据你的喜好自定制。
* 有一个故意为之的设计是在全角输入模式中，所有标点符号按键第2候选项的英文标点符号都删去，以便让用户留意到是处于全角输入模式。
* 在追求快速、功能强大之外，也非常注重舒适的输入体验。因此，本输入方案选用右手附近的符号按键作为候选项按键，并且将不常用的向后翻页键从通常的<kbd>,</kbd>键改为<kbd>></kbd>键（即<kbd>Shift</kbd>+<kbd>.</kbd>）。这样<kbd>,</kbd>键就可以用作候选项按键，让候选项按键达到4个之多！

## 主要功能
* 常用字词固顶功能（见`joy_custom_phrase.txt`，可自定制）
* 中英混输（包括大写开头和全大写的英文）
* 经过精心设计优化的标点符号输入逻辑，以提高程序员中英混输的编程效率（目标是尽量减少须要切换输入法的情况）
* 经过精心设计优化的翻页键组合（<kbd>.</kbd>向后翻页，<kbd>Shift</kbd>+<kbd>.</kbd>向前翻页）和候选项按键（使用<kbd>,</kbd>、<kbd>;</kbd>和<kbd>/</kbd>来选择第2、第3和第4个候选项）
* 【特有功能】输入数字之后可以方便快捷地选择输入小数点或者中文句号（通过我开发的Lua扩展程序实现）
* 可以通过笔画来输入不知道拼音的字，反查拼音（按<kbd>~</kbd>键后输入'hspnz'）
* 可以以词定字（输入词语后通过<kbd>[</kbd>和<kbd>]</kbd>选字）
* 方便地输入数字对应的中文数字和金额大写（按<kbd>></kbd>键后输入阿拉伯数字）
* 方便地输入当前日期、星期以及时间等（输入'rq'、'xq'、'sj'）
* 方便地输入大量符号（见`joy.symbols.yaml`）
* 方便地输入emoji表情符号😃，并可通过<kbd>Ctrl</kbd>+<kbd>5</kbd>开/关此功能
* 方便地输入网址和Email

## 使用说明（以Windows为例）
1. 如果未安装[Rime输入法](https://github.com/rime/weasel)，先去下载并安装（建议安装Actions里面最新的构建）。
2. 系统任务栏输入法图标右键菜单选择“退出Rime算法服务”。
3. 备份你的Rime用户目录中的`default.custom.yaml`和`weasel.custom.yaml`，以备移除欢喜输入方案时还原设置。注意，备份后**不要清空**你的Rime用户目录。
4. 下载最新的Release中Assets（附件）中的`Rime-schema-JoySchema-x.x.x.zip`并解压到你的Rime用户目录。
5. 系统任务栏输入法图标右键菜单选择“重启Rime算法服务”。
6. 系统任务栏输入法图标右键菜单选择“输入法设定”。
7. 勾选“欢喜拼音”和“Joy English”，另外还有“欢喜双拼”（基于小鹤双拼方案）和“欢喜语句流”可供选择，点「中」按钮。
8. 本方案配套的配色方案为“春光乍喜”，也可以根据你的喜好选用其它配色方案，点「中」按钮。
9. 本方案呼出选项菜单的快捷键为<kbd>Ctrl</kbd>+<kbd>8</kbd>，其它功能开关的快捷键请查看`joy.keybindings.yaml`文件。

[更换语言](#语言) | [返回标题](#简体中文)

---

<a id="英文" />

# JoySchema
## Description
JoySchema, [Rime](https://github.com/rime) schemas that understands the intentions of coders! Includes some customized input schemas and some related vocabularies.

[change language](#语言) | [back to title](#英文)
