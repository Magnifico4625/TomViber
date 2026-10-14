**[English](README.md) | [Русский](README.ru.md) | 简体中文**

<div align="center">

# 🐱 TomViber

<p align="center"><img src="assets/tomviber-hero.jpg" alt="TomViber" width="100%"></p>

<p align="center"><img src="assets/tomviber-demo.gif" alt="TomViber 演示：真实会话" width="100%"></p>
<p align="center"><a href="assets/tomviber-demo.mp4"><b>▶ 观看完整演示（77 秒，有声音）</b></a></p>

**为不读代码的 vibe coder 准备的技术负责人导师。**
一个 Agent Skill：从第一次提交起就为你提供存档、项目记忆和"紧急回滚"按钮。

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
![Agent Skills](https://img.shields.io/badge/Agent%20Skills-SKILL.md-blue)
![Version](https://img.shields.io/badge/version-0.4.2-informational)
![Status](https://img.shields.io/badge/status-early-orange)

</div>

## 使用前 → 使用后

| 没有 TomViber | 有了 TomViber |
|---|---|
| AI 助手"只改了一点点"，结果删掉了半个项目，昨天的版本也找不回来。 | 输入 **PANIC**，项目立即回到最近一次可用的状态，出问题的版本另存一份，什么都不会丢。 |
| 机器人的 token 被推到了 GitHub 上。 | 密钥通过一个小窗口输入，保存在 git 看不到的 `.env` 里。 |
| 第二天 AI 完全不记得昨天做了什么。 | `MEMORY.md` 记录：做到哪了、下一步、踩过的坑。 |
| "一切正常！"——结果根本跑不起来。 | 如实汇报："已构建""已跑通流程""无法验证"，并告诉你具体该点哪里检查。 |

## 一分钟安装

**最简单：** 对你的 AI 助手说：

> 从 https://github.com/Magnifico4625/TomViber 安装这个 skill

**手动安装：** [下载 ZIP](https://github.com/Magnifico4625/TomViber/archive/refs/heads/main.zip)，解压后把 `tomviber/` 文件夹放进对应目录：

| 工具 | 全局 | 仅当前项目 |
|---|---|---|
| Claude Code | `~/.claude/skills/tomviber/` | `.claude/skills/tomviber/` |
| Cursor | `~/.cursor/skills/tomviber/` 或 `~/.agents/skills/tomviber/` | `.cursor/skills/…` 或 `.agents/skills/…` |
| Codex | `~/.agents/skills/tomviber/` | `.agents/skills/tomviber/` |
| 其他支持 Agent Skills 的工具 | 通常为 `~/.agents/skills/` | `.agents/skills/` |

```bash
git clone https://github.com/Magnifico4625/TomViber.git
mkdir -p ~/.agents/skills && cp -r TomViber/tomviber ~/.agents/skills/
```

## 第一条消息示例

> 我想做一个 Telegram 机器人，每天早上给我发天气和美元汇率。我不会编程。

AI 会先复述你的想法，建议一个规模（"一晚上的原型"），在后台搭好安全网，然后从第一个真正能用的功能开始。

## 常见问题

**没有 git 怎么办？** AI 会提议帮你安装（Windows 上一条命令）。无法安装时，会在每一步前按日期备份项目文件夹。

**支持 Windows 吗？** 支持。启动和输入密钥都是双击 `.bat` 文件；Mac 上是 `.command` 文件。

**怎么知道它启用了？** 项目根目录会出现 `AGENTS.md`，第一行是 `<!-- tomviber v1 -->`。而且 AI 会先复述你的想法，再开始写代码。

**支持中文吗？** 内置英文和俄文提示语；它会尽量用你的语言回复，包括中文。

## 状态

早期版本，**已在 Windows 11 上完成端到端手动测试**（v0.3，包括紧急回滚）。其他平台和工具尚未系统测试。欢迎通过 issue 分享你的使用体验。

## 许可证

[MIT](LICENSE) © 2026 Damir Damirov ([@Magnifico4625](https://github.com/Magnifico4625))
