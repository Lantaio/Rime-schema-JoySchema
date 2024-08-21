# 😍惊喜输入方案
*2024年8月21日*

最新版本：[v2.48.208](https://github.com/Lantaio/Rime-schema-JoySchema/releases) (*2024/8/21*) [更新日志](joy/ChangeLog.md)

ℹ*提示：可通过此文档右上角的〔标题列表〕按钮快速转到某个标题。可以通过后面有‘⚡️’图标的标题内容快速了解此项目，以及留意各部分的**粗体字**内容。*

## 项目概述⚡️
惊喜输入方案，懂程序员和科研工作者心意的[Rime输入法](https://rime.im/)方案！包含一些精心设计的输入方案以及相关的词库。

特别为以下人士设计：
* 经常**需要中英混输**又想早睡的程序员；
* 经常**需要输入键盘上没有键位的中/英文标点符号**的科研人员，或者是写学术论文的师生，例如：℃、π、≌、『』、【】、〔〕等；
* 喜欢**用Markdown写技术文档或者做笔记**的社会精英。

## 设计理念
我认为==**一个优秀的输入方案应能带给用户行云流水般的输入体验**==，所以此项目着力于以下几个方面：
* 首先，最根本的是**速度**。所以此Rime输入法方案*并非*追求大而全，而是**追求快速流畅的输入体验**。因此，无论是中文词库还是英文词库都是选用基本词库。而且Rime输入法本身有自造词功能，你可以在使用过程中形成自己独有的词库，这样就可以有效降低拼音重码和大量无用候选项，减少翻页次数，提高输入效率。如果觉得有必要，你还可以制作和添加固态词库。此外，为了尽量减少重码，此拼音输入方案没有开启模糊音功能（可根据需要开启）。
* 另一个重要的考虑因素是**智能化**。此输入方案**侧重于程序员和科研工作者中英混输的使用场景**，同时也**非常适合用于Markdown文档的写作**。为此专门研发了 [FinalD/终点 输入法插件](https://github.com/Lantaio/IME-booster-FinalD)来突破中英混输的瓶颈。
* 在追求速度、智能化之余，还有一个不可忽略的考虑因素是注重**人性化**的输入体验。因此，本输入方案选用右手附近的标点符号按键作为翻页及候选项按键，并且将不常用的向前翻页键从通常的<kbd>,</kbd>键改为<kbd>Shift</kbd>+<kbd>.</kbd>键，使得<kbd>,</kbd>键可以用作第2候选项按键，有效减轻手部疲劳和小指负担！另外将Rime输入法默认的快捷键调整到<kbd>Ctrl</kbd>+<kbd>6</kbd>\~<kbd>9</kbd>和<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>6</kbd>\~<kbd>9</kbd>（详见 joy.keybindings.yaml），一来使得最常用的快捷键不是用小指来按，手部甚至不需要移动，二来亦可尽量避免和其它软件的快捷键冲突。总而言之，各个高频按键和快捷键的选取都是经过反复琢磨的结果，细节之处尽显人性化的理念😉

## 主要功能⚡️
* **常用字词固顶**功能（详见 joy_custom_phrase.txt，可自定制。建议*尽量少*设置固顶字词，因为Rime输入法已经足够智能，在使用一段时间后便会形成基于你的输入习惯的候选字词排序，那时如真有必要再设置不迟）。
* **中英字词混输**（包括大写开头和全大写的英文，想要输入全大写的英文只需要开头2个英文字母大写即可）。
* ⭐️通过【[FinalD/终点 输入法插件](https://github.com/Lantaio/IME-booster-FinalD)】颠覆标点符号的输入方式，实现**真正意义上的中英混输**，让程序员和科研工作者的输入效率如火箭般爆发。
* **经过精心挑选的翻页键组合**（<kbd>.</kbd>向后翻页，<kbd>Shift</kbd>+<kbd>.</kbd>向前翻页）**和候选项按键**（使用<kbd>,</kbd>、<kbd>;</kbd>和<kbd>/</kbd>来选择第2、第3和第4个候选项），各快捷键改用更为舒适的按键组合。
* **通过笔画来输入**不知道拼音的字，并反查其拼音（按<kbd>|</kbd>键后输入'hspnz'）。
* **以词定字**（出现候选词后通过<kbd>\[</kbd>或<kbd>\]</kbd>选字）。
* ⭐️如果是用<kbd>.</kbd>键向后翻页，则**在翻页后可以继续输入拼音来缩小候选范围，而不会出现英文句号的问题**。
* 方便地**输入数字对应的中文数字和金额大写**（按<kbd>$</kbd>键后输入阿拉伯数字）。
* **方便地输入当前日期、星期以及时间**等（输入‘rq’、‘xq’、‘sj’）。
* **⭐️方便地输入指定的月日或年月日**（输入‘rq’后跟4位表示月日的数字或8位表示年月日的数字，只有输入合法的日期数字时才会显示对应的候选项）。
* **方便地输入大量扩展符号**（按<kbd>^</kbd>键后输入拼音简称，详见 joy.symbols.yaml）。
* **方便地输入emoji表情符号**，并可通过<kbd>Ctrl</kbd>+<kbd>9</kbd>开/关此功能（开启后输入表情对应的拼音，例如：‘xiaolian’笑脸😊️）。
* **方便地输入英文目录路径**（‘X:’或‘\’开头触发输入Windows目录路径，‘/’开头触发输入Linux/Mac目录路径）。
* **方便地输入网址和Email地址**。
* ~~🧪实验性加入🔮️[预言功能](https://github.com/rime/librime-predict)，通过<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>9</kbd>开/关此功能。~~（暂时撤下，因现阶段体验还不是很好。）

## 安装需求⚡️
* 使用此输入方案前须要先安装Rime输入法引擎，其所支持的系统及版本见其[下载页面](https://rime.im/download/)。
* 此输入方案理论上适用于包括手机等全平台，但我尚未在Windows之外的其它平台进行验证，有问题可自行研究解决😝
* 除了Rime输入法引擎的默认安装约占用70MB磁盘空间之外，此项目会额外占用约15MB磁盘空间。

## 安装步骤（Windows）⚡️
1. **安装依赖软件**：如果未安装Rime输入法，先去[下载](https://github.com/rime/weasel/releases)并安装（建议安装最新的版本）。
2. **备份你的Rime输入法个人设置**，以备移除此输入方案时还原设置：
	1. 系统任务栏输入法图标右键菜单选择「退出算法服务」。
	2. 备份你的Rime用户目录（一般是`C:\用户\%你的用户名%\AppData\Roaming\Rime`）中的 default.custom.yaml 和 weasel.custom.yaml。注意，备份后**无须清空**你的Rime用户目录。
3. **添加此Rime输入法方案**:
	1. 下载最新的[Release](https://github.com/Lantaio/Rime-schema-JoySchema/releases)中Assets（附件）中的 JoySchema-x.x.x.zip 并解压到你的Rime用户目录。
	2. 系统任务栏输入法图标右键菜单选择「重启算法服务」。
	3. 系统任务栏输入法图标右键菜单选择「输入法设定」。
	4. 勾选“惊喜拼音”和“Joy English”，另外还有“惊喜双拼”（基于小鹤双拼方案）和“惊喜语句流”可供选择，选好后点〔中〕按钮。
	5. 本方案配套的配色方案为“春光乍喜”，也可以根据你的喜好选用其它配色方案，选好后点〔中〕按钮。
4. **强烈推荐安装 [FinalD/终点 输入法插件](https://github.com/Lantaio/IME-booster-FinalD)**，为你的输入法装上火箭🚀️推进器！具体使用方法请看其项目说明。

*本方案呼出选项菜单的快捷键为<kbd>Ctrl</kbd>+<kbd>8</kbd>，其它功能开关的快捷键请查看 joy.keybindings.yaml 文件。*

## 注意事项⚡️
* 为了使输入中文数字和金额时都能够正常上屏候选项。各候选按键的工作方式是假设当前高亮候选项是第1候选项时才可以正确上屏对应的候选项，因此要注意尽量不要使用<kbd>↑</kbd>和<kbd>↓</kbd>键改变当前高亮候选项的位置，否则须要通过按空格键来上屏当前高亮候选项，或者用鼠标点选候选项。
* 由于输入英文时可能会使用<kbd>Shift</kbd>键输入大写英文，所以不能使用此键上屏候选项。

## 欢迎反馈
* 如果你在使用此Rime输入法方案的过程中发现有什么问题、缺陷或功能需求，请在[议题（Issues）](https://github.com/Lantaio/Rime-schema-JoySchema/issues)中反馈情况。
* 如果有任何疑问或建议可在[讨论区（Discussions）](https://github.com/Lantaio/Rime-schema-JoySchema/discussions)中提出。


## 移除步骤（Windows）
虽然我希望你会喜欢此输入方案，但正如我有自己的想法一样，你也可能有更好的选择（提示：你可以直接在此方案之上进行修改），所以此项目也为方便你移除作了充分的考虑，步骤如下:
1. **移除此惊喜输入法方案**：
	1. 系统任务栏输入法图标右键菜单选择「退出算法服务」。
	2. 删除你的Rime用户目录及build、Lua两个子目录中所有以“joy”开头的目录和文件。**无须**删除整个Rime用户目录！最后删除preview子目录中的 color_scheme_joy_light.png 文件（如果目录中只有这个文件，也可以删除整个preview目录）。
2. **恢复之前备份的你的Rime输入法个人设置**：
	1. 将之前安装此输入方案时备份的 default.custom.yaml 和 weasel.custom.yaml 恢复到你的Rime用户目录中。
	2. 系统任务栏输入法图标右键菜单选择「重启算法服务」。
	3. 系统任务栏输入法图标右键菜单选择「输入法设定」。
	4. 勾选你希望使用的输入方案，选好后点〔中〕按钮。然后选择你喜欢的配色方案，选好后点〔中〕按钮。
3. 如果你想**卸载Rime输入法**，可以打开系统的『控制面板』→『程序和功能』，卸载「小狼毫输入法」。

## 版权许可
此项目遵循[小狼毫](https://github.com/rime/weasel)（Rime for Windows）项目所使用的[GNU GPL-v3.0](joy/LICENSE.en.md)开源协议（另附[简体中文译文](LICENSE.md)）。因此，你可以自由分发和修改此项目。但如果你对此项目进行了修改，则必须明确指出修改之处，或者修改相应的署名，不能让别人误认为是我的作品。

## 收费规则
### 免费情形：
* 可以免费将此插件用于个人用途以及在非营利性组织中使用。
* 可以将此插件（或其修改版）以开源的方式包含在你的开源项目中而无需给我付费，即便你的开源项目是收费项目。
* 如果你在GitHub上给[此项目](https://github.com/Lantaio/Rime-schema-JoySchema)星标⭐，并且是排名前10000名的标星用户，则可以免费获得授予给1台设备的永久使用权，以感谢你对此项目的认可与支持🤝
* 如果你对此项目的代码进行了5%以上的修改，又或者是进行了一些功能性方面的修改，则可以视为是你的项目而无须向我支付费用。此开源项目鼓励思考和创新🐣
* 如果你对我的项目提出有建设性的建议💡并被我采纳的话，也可以免费获得授予给1台设备的永久使用权。

### 收费情形：
如果你将此项目用于能获取报酬的工作或者商业用途，则需要在**3个月免费试用期**后向我支付费用购买使用权。暂定为每台设备（不限操作系统数目）收取人民币￥5元，即可获得此项目的永久使用权，并可免费获得所有后续更新的使用权。现阶段我会从每笔款项中拿出2元给开发Rime输入法引擎的lotem大神，另外再拿出3元给后面『[致谢](#致谢)』中提及的3位大神。

ℹ*提示：此收费不包括任何软件功能及其稳定性方面的承诺或保证，现阶段也无法提供技术支持服务。*

付款请备注“惊喜输入方案”，以便我转款给其他大神，谢谢。

![支付宝收款码](joy/assets/AliPay.png)
![微信收款码](joy/assets/WePay.png)

## 打赏支持
除了商业用途需要购买使用许可之外，如果你觉得这个项目很赞，提高了你的码字效率，让你喜出望外，也可以通过上面的二维码给我打赏支持，金额随喜。同样请备注“惊喜输入方案”，我也会按『[收费规则](#收费规则)』中所说的比例转账给『[致谢](#致谢)』中提及的几位大神。多谢支持与鼓励😊

ℹ*提示：为保护赞助人的隐私，本人不会制作『打赏支持感谢名单』。另外，无论是付款购买许可证还是打赏支持，都不应视为期望我为你实现特定功能而给我预先支付报酬。此插件的功能仅以现状提供。*

## 致谢💐
首先要感谢[Rime输入法引擎](https://github.com/rime)的主创 [lotem](https://github.com/lotem) 大神以及项目的其他贡献者奉献这么强大的输入法项目👍并且此项目还有十分详尽的[wiki文档](https://github.com/rime/home/wiki)，想自定制Rime输入方案的话必须去打卡。

其次要感谢[雾凇拼音](https://github.com/iDvel/rime-ice)输入法方案的作者 [iDvel](https://github.com/iDvel) 大神以及项目的其他贡献者，此项目有非常详尽的注释，让我这个小白从中学习到很多自定制Rime输入法方案的知识。如果你也想设计属于你自己的方案，定能从中获益良多。另外，如果你喜欢大而全的词库的话，那么雾凇拼音可能更适合你。

还有一个对我帮助很大的项目是 [hchunhui](https://github.com/hchunhui) 大神以及项目的其他贡献者开发的[librime-lua](https://github.com/hchunhui/librime-lua)项目（已包含在Rime安装包中）。这个项目让用户可以使用Lua脚本语言来扩展Rime输入法的功能，非常简单方便，也大大降低了我这种小白用户扩展Rime输入法的门槛，强烈推荐。具体使用方法见其[wiki文档](https://github.com/hchunhui/librime-lua/wiki/Scripting)。

还要感谢 [shewer](https://github.com/shewei) 大神，不但是多个Rime项目的贡献者，而且还非常热心解答大家提出的问题，对我的帮助很大。🤝

最后，感谢网络上众多Rime输入法使用教程和自定制教程的作者，还有各种词库的贡献者。🌹有他们的热心指导和无私分享，这个项目才得以诞生🌱

希望此Rime输入方案能让你在通往梦想的路上码不停提！😉
