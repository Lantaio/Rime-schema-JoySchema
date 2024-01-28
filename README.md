<a id="语言" />

🌏 [简体中文](#简体中文) | [English](joy/README.en.md)

<a id="简体中文" />

# 😍惊喜输入方案
*2024年1月27日*

## 项目概述
惊喜输入方案，懂程序员和科研工作者心意的[Rime输入法](https://rime.im/)方案！包含一些精心设计的输入方案以及相关的词库。如果你是一个纯中文输入者，可能体会不到此输入方案的好处。但如果你是程序员或者科研工作者，经常需要进行中英文混输和输入专业领域的特殊符号的话，那么你来对地方了。

## 项目规划
从2023年12月16日开始，此项目将包含classic和nex两个分支。虽然两个分支都是**以提高输入效率为宗旨**，但classic分支为偏传统输入理念的经典版，而nex分支则是更懂你心意的穿越版。在Release中版本号以‘c’开头的便是基于classic分支的发布版。接下来会将主要精力放在nex分支的开发上，日后在Release中版本号以‘n’开头的便是基于nex分支的发布版。两个分支的功能特点在各自的说明文档中说明，切换分支后查看位于根目录的Readme.md文档。

## 设计理念
我认为一个优秀的输入方案应能带给用户行云流水般的输入体验，所以此项目着重考虑以下几个方面：
* 首先，最重要的是**速度**。所以此Rime输入法方案*并非*追求大而全，而是**追求快速流畅的输入体验**。因此，无论是中文词库还是英文词库都是选用基本词库。而且Rime输入法本身有自造词功能，你可以在使用过程中形成自己独有的词库，这样就可以有效降低拼音重码和大量无用候选项，减少翻页次数，提高输入效率。如果觉得有必要，你还可以制作和添加固态词库。此外，为了减少重码，此方案禁用了模糊音功能（可自行选择开启）。
* 另一个重要的考虑因素是注重**人性化**的输入体验。因此，本输入方案选用右手附近的标点符号按键作为翻页及候选项按键，并且将不常用的向后翻页键从通常的<kbd>,</kbd>键改为<kbd>Shift</kbd>+<kbd>.</kbd>键，使得<kbd>,</kbd>键可以用作第2候选项按键，有效减轻手部疲劳和小指负担！另外将Rime输入法默认的快捷键调整到<kbd>Ctrl</kbd>+<kbd>6</kbd>\~<kbd>9</kbd>和<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>6</kbd>\~<kbd>9</kbd>（详见`joy.keybindings.yaml`），一来使得最常用的快捷键不是用小指来按，手部甚至不需要移动，二来亦可尽量避免和其它软件的快捷键冲突。总而言之，各个高频按键和快捷键的选取都是经过反复琢磨的结果，细节之处尽显人性化的关怀😁
* 在追求速度、人性化之余，还有一个不可忽略的考虑因素是**智能化**。此输入方案现阶段**侧重于程序员和科研工作者中英混输的使用场景**，同时也**非常适合用于Markdown文档的写作**。目标是尽量减少须要切换中/英文的情况，因此部分中文标点符号不直接上屏，而是提供候选菜单，可选择输入对应的中/英标点符号。对于此类有候选菜单的标点符号按键，原则上其对应的中文标点符号放在第1位，通过按<kbd>Space</kbd>键直接上屏；其对应的英文标点符号放在第2位，可以按第2候选键<kbd>,</kbd>键，也可以按<kbd>Return</kbd>键上屏，这样就可以盲打。只有一个例外情况是‘×’乘号并不是按<kbd>\*</kbd>键，而是连按2次<kbd>;</kbd>键（‘;’键候选菜单的第3个候选项）。部分标点符号按键还可以输入其它常用符号，详见`joy.punctuation.yaml`。当然，你也可以根据你的喜好进行自定制。\
有一个故意为之的设计是在*全角*输入模式中，所有标点符号按键第2候选项的*半角*英文标点符号都删去，排在后面的标点符号相应前移1位，以便让你留意到是处于全角输入模式。

以上几个主要的考虑因素彼此之间并非孤立，而是共同服务于此输入方案的宗旨——爽！⛷

## 主要功能
* 常用字词固顶功能（详见`joy_custom_phrase.txt`，可自定制。建议*尽量少*设置固顶字词，因为Rime输入法已经足够智能，在使用一段时间后便会形成基于你的输入习惯的候选字词排序，那时如真有必要再设置不迟）。
* 中英混输（包括大写开头和全大写的英文，想要输入全大写的英文只需要开头2个英文字母大写即可）。
* 经过精心安排优化的标点符号输入逻辑，以提高程序员中英混输的编程效率（目标是尽量减少须要切换中/英输入法的情况）。
* 经过精心挑选的翻页键组合（<kbd>.</kbd>向后翻页，<kbd>Shift</kbd>+<kbd>.</kbd>向前翻页）和候选项按键（使用<kbd>,</kbd>、<kbd>;</kbd>和<kbd>/</kbd>来选择第2、第3和第4个候选项），各快捷键改用更为舒适的按键组合。
* 【惊喜句号】功能，输入数字之后可以方便快捷地选择输入小数点或者中文句号（通过Lua插件程序实现）。
* 可以通过笔画来输入不知道拼音的字，并反查其拼音（按<kbd>~</kbd>键后输入'hspnz'）。
* 可以以词定字（出现候选词后通过<kbd>\[</kbd>或<kbd>\]</kbd>选字）。
* 方便地输入数字对应的中文数字和金额大写（按<kbd>></kbd>键后输入阿拉伯数字）。
* 方便地输入当前日期、星期以及时间等（输入'rq'、'xq'、'sj'）。
* 方便地输入大量符号（按<kbd>;</kbd>键后输入拼音简称，详见`joy.symbols.yaml`）。
* 方便地输入emoji表情符号😃，并可通过<kbd>Ctrl</kbd>+<kbd>7</kbd>开/关此功能（开启后输入表情对应的拼音，例如：‘xiaolian’〈笑脸〉）。
* 方便地输入英文目录路径（‘X:’或‘\’开头触发输入Windows目录路径，‘/’或‘~/’开头触发输入Linux/Mac目录路径）。
* 方便地输入英文程序代码（可通过‘{’、‘[’、‘(’或‘<’开头触发）。
* 方便地输入网址和Email地址。

## 特色功能
### 【惊喜句号】Lua插件程序
大多数中文输入方案在输入数字之后按<kbd>.</kbd>键一般会默认上屏小数点，但如果此时是想输入中文句号的话，就须要先按一次退格键，再按一次<kbd>.</kbd>键。我写了个Lua插件程序对此进行优化，使得数字之后按<kbd>.</kbd>键会出现候选菜单，第1个候选项是‘。’中文句号，第2个候选项是‘.’英文句号。这时分下面几种情况进行处理：
* 如果继续输入数字，则会上屏小数点，就是和其它的中文输入法一样。
* 如果接着再按<kbd>.</kbd>键，也就是相当于连按2次<kbd>.</kbd>键，就会上屏中文句号。这样就不需要用小指移动一大段距离去按那个反人类的退格键，然后再回来按<kbd>.</kbd>键，是不是丝滑奶茶了很多😂此处便是这个Lua插件程序的**关键改进**之处💡️
* 如果接着输入拼音，则会上屏中文句号，接着显示所输入的拼音候选项菜单（也就是说在输入数字之后如果想输入中文句号，最少只需要按1次<kbd>.</kbd>键）。
* 另外，和此输入方案输入其它标点符号相一致，如果接着按空格键，则会上屏第一个候选项中文句号，如果按<kbd>Return</kbd>或<kbd>,</kbd>键，则会上屏第2个候选项小数点。但建议通过前面的方法来上屏中文句号或小数点，更快速丝滑。
* 如果接着输入其它标点符号，则会先撤销之前按<kbd>.</kbd>键的操作，然后按照平时输入那个标点符号的情况来处理。

## 版权许可
此项目遵循[小狼毫](https://github.com/rime/weasel)（Rime for Windows）项目所使用的[GNU GPL-v3.0](joy/LICENSE.en.md)开源协议（另附[简体中文译文](LICENSE.md)）。因此，你可以自由分发和修改此项目。但如果你对此项目进行了修改，则必须明确指出修改之处，并且修改相应的署名（如果有的话），不能让别人误认为是我的作品。

## 收费情形
你可以*免费*将此项目用于**个人用途**或在**非营利性组织**中使用。但如果你将此项目用于能获取报酬的工作或者商业用途，则需要在3个月免费试用期后向我支付费用。暂定为每台设备收取人民币￥5元，即可获得此项目的永久使用权，并可免费获得所有后续更新的使用权。我会从每笔款项中拿出2元给开发Rime输入法引擎的lotem大神，另外再拿出2元给后面『[致谢](#致谢)』中提及的2位大神。现阶段无法对你进行监管，全凭自觉。另外需要注意的是，此收费不包括任何软件功能及其稳定性方面的承诺或保证，现阶段也无法提供技术支持服务，具体内容见前面『[版权许可](#版权许可)』部分。

其它费用免除情形：
* 如果你给此项目星标⭐并且是前2000位粉丝，则可以免费获得授予给1台设备的此项目及所有后续更新的永久使用权，以感谢你对此项目的认可🤝
* 如果你对此项目的代码进行了5%以上的修改，又或者是进行了一些功能性方面的修改，则可以视为是你的项目而无须向我支付费用。此开源项目鼓励思考和创新🐣
* 如果你对我的项目提出有建设性的建议并被我采纳的话，也可以免费获得授予给1台设备的此项目及所有后续更新的永久使用权👍

付款请备注“惊喜输入方案”，以便我转款给其他大神，谢谢。

![支付宝收款码](joy/assets/AliPay.png)
![微信收款码](joy/assets/WePay.png)

## 安装步骤（以Windows为例）
1. 如果未安装[Rime输入法](https://github.com/rime/weasel)，先去下载并安装（建议安装Actions里面最新的构建）。
2. 系统任务栏输入法图标右键菜单选择「退出算法服务」。
3. 备份你的Rime用户目录（一般是`C:\用户\%你的用户名%\AppData\Roaming\Rime`）中的`default.custom.yaml`和`weasel.custom.yaml`，以备移除惊喜输入方案时还原设置。注意，备份后**不要清空**你的Rime用户目录。
4. 下载最新的[Release](https://github.com/Lantaio/Rime-schema-JoySchema/releases)（**注意**：‘c’开头的版本为经典版，‘n’开头的版本为穿越版）中Assets（附件）中的`JoySchema-x.x.x.zip`并解压到你的Rime用户目录。
5. 系统任务栏输入法图标右键菜单选择「重启算法服务」。
6. 系统任务栏输入法图标右键菜单选择「输入法设定」。
7. 勾选“惊喜拼音”和“Joy English”，另外还有“惊喜双拼”（基于小鹤双拼方案）和“惊喜语句流”可供选择，选好后点〔中〕按钮。
8. 本方案配套的配色方案为“春光乍喜”，也可以根据你的喜好选用其它配色方案，选好后点〔中〕按钮。
9. 本方案呼出选项菜单的快捷键为<kbd>Ctrl</kbd>+<kbd>8</kbd>，其它功能开关的快捷键请查看`joy.keybindings.yaml`文件。

## 注意事项
* 为了使输入中文数字和金额时都能够正常上屏候选项。各候选按键的工作方式是假设当前高亮候选项是第1候选项时才可以正确上屏对应的候选项，因此要注意尽量不要使用<kbd>↑</kbd>和<kbd>↓</kbd>键改变当前高亮候选项的位置，否则须要通过按空格键来上屏当前高亮候选项。
* 由于输入英文时可能会使用<kbd>Shift</kbd>键输入大写英文，所以不使用此键上屏候选项。

## 移除步骤（以Windows为例）
虽然我希望你会喜欢此输入方案，但正如我有自己的想法一样，你也可能有更好的选择（提示：你可以直接在此方案之上进行修改），所以此项目也为方便你移除作了充分的考虑，你只需要:
1. 系统任务栏输入法图标右键菜单选择「退出算法服务」。
2. 删除你的Rime用户目录及build、Lua两个子目录中所有以“joy”开头的目录和文件。**注意**，不是删除整个Rime用户目录！最后删除preview子目录中的`color_scheme_joy_light.png`文件（如果目录中只有这个文件，也可以删除整个preview目录）。
3. 将之前安装此输入方案时备份的`default.custom.yaml`和`weasel.custom.yaml`恢复到你的Rime用户目录。
4. 系统任务栏输入法图标右键菜单选择「重启算法服务」。
5. 系统任务栏输入法图标右键菜单选择「输入法设定」。
6. 勾选你希望使用的输入方案，选好后点〔中〕按钮。然后选择你喜欢的配色方案，选好后点〔中〕按钮。

## 致谢
首先要感谢[Rime输入法引擎](https://github.com/rime)的主创 [lotem](https://github.com/lotem) 大神以及项目的其他贡献者奉献这么强大的输入法项目👍并且此项目还有十分详尽的[wiki文档](https://github.com/rime/home/wiki)，想自定制Rime输入方案的话必须去打卡。

其次要感谢[雾凇拼音](https://github.com/iDvel/rime-ice)输入法方案的作者 [iDvel](https://github.com/iDvel) 大神以及项目的其他贡献者，此项目有非常详尽的注释，让我这个小白从中学习到很多自定制Rime输入法方案的知识。如果你也想设计属于你自己的方案，定能从中获益良多。另外，如果你喜欢大而全的词库的话，那么雾凇拼音可能更适合你。

还有一个对我帮助很大的项目是 [hchunhui](https://github.com/hchunhui) 大神以及项目的其他贡献者开发的[librime-lua](https://github.com/hchunhui/librime-lua)项目（已包含在Rime安装包中）。这个项目让用户可以使用Lua脚本语言来扩展Rime输入法的功能，非常简单方便，也大大降低了我这种小白用户扩展Rime输入法的门槛，强烈推荐。具体使用方法见其[wiki文档](https://github.com/hchunhui/librime-lua/wiki/Scripting)。

最后，感谢网络上众多Rime输入法使用教程和自定制教程的作者，还有各种词库的贡献者。有他们的热心指导和无私分享，这个项目才得以诞生💟

## 欢迎反馈
* 如果你在使用此Rime输入法方案的过程中发现有什么问题或者缺陷，请在[Issues](https://github.com/Lantaio/Rime-schema-JoySchema/issues)中反馈情况。
* 如果有任何建议、改进或功能需求可在[Discussions](https://github.com/Lantaio/Rime-schema-JoySchema/discussions)中提出。

## 打赏支持
除了商业用途需要购买使用许可之外，如果你觉得这个项目很赞，提高了你的码字效率，让你喜出望外，也可以通过上面的付款码给我打赏支持，金额随喜。同样请备注“惊喜输入方案”，我也会按前面『[收费情形](#收费情形)』中所说的比例转账给『[致谢](#致谢)』中提及的几位大神。谢谢支持，希望此Rime输入方案能让你码不停提！😉
