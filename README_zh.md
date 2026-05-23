# termcolor

中文 | [English](README.md)

适用于仓颉语言的轻量级终端 ANSI 颜色格式化库。

灵感来源于 [picocolors](https://github.com/alexeyraspopov/picocolors)。

## 特性

- 零依赖
- 支持嵌套颜色组合，自动处理 close 序列替换
- 可通过 `createColors(false)` 禁用颜色输出
- 完整覆盖标准 ANSI 格式化、前景色、背景色及 Bright 变体

## 安装

在 `cjpm.toml` 中添加依赖：

中心仓：

```toml
[dependencies]
  termcolor = "1.0.0"
```

Git：

```toml
[dependencies]
  termcolor = { git = "https://github.com/gtn1024/termcolor" }
```

## 使用方法

```cangjie
import termcolor.*

let c = createColors(true)
println(c.red("Hello, World!"))
println(c.bold(c.green("Success!")))
println(c.bgBlue(c.white("Info")))
```

## API

### `createColors(enabled: Bool): Colors`

创建 `Colors` 实例。当 `enabled` 为 `false` 时，所有格式化函数直接返回原始字符串，不做任何处理。

### `Colors`

- `isColorSupported: Bool` — 是否启用颜色
- **格式化**: `reset`, `bold`, `dim`, `italic`, `underline`, `inverse`, `hidden`, `strikethrough`
- **前景色**: `black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, `white`, `gray`
- **背景色**: `bgBlack`, `bgRed`, `bgGreen`, `bgYellow`, `bgBlue`, `bgMagenta`, `bgCyan`, `bgWhite`
- **亮色前景**: `blackBright`, `redBright`, `greenBright`, `yellowBright`, `blueBright`, `magentaBright`, `cyanBright`, `whiteBright`
- **亮色背景**: `bgBlackBright`, `bgRedBright`, `bgGreenBright`, `bgYellowBright`, `bgBlueBright`, `bgMagentaBright`, `bgCyanBright`, `bgWhiteBright`

所有函数签名均为 `(String) -> String`，可通过嵌套实现组合效果：

```cangjie
c.bold(c.red("加粗红色"))
```

