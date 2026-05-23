# termcolor

The tiniest terminal output formatting library with ANSI colors for Cangjie.

Inspired by [picocolors](https://github.com/alexeyraspopov/picocolors).

## Features

- Zero dependencies
- Nested color composition with automatic close-sequence replacement
- Disable colors via `createColors(false)`
- Full coverage of standard ANSI formatting, foreground, background, and bright variants

## Installation

Add the dependency in `cjpm.toml`:

Central registry:

```toml
[dependencies]
  termcolor = "1.0.0"
```

Git:

```toml
[dependencies]
  termcolor = { git = "https://github.com/gtn1024/termcolor" }
```

## Usage

```cangjie
import termcolor.*

let c = createColors(true)
println(c.red("Hello, World!"))
println(c.bold(c.green("Success!")))
println(c.bgBlue(c.white("Info")))
```

## API

### `createColors(enabled: Bool): Colors`

Creates a `Colors` instance. When `enabled` is `false`, all formatting functions return the input string unchanged.

### `Colors`

- `isColorSupported: Bool` — whether colors are enabled
- **Formatting**: `reset`, `bold`, `dim`, `italic`, `underline`, `inverse`, `hidden`, `strikethrough`
- **Foreground colors**: `black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, `white`, `gray`
- **Background colors**: `bgBlack`, `bgRed`, `bgGreen`, `bgYellow`, `bgBlue`, `bgMagenta`, `bgCyan`, `bgWhite`
- **Bright foreground**: `blackBright`, `redBright`, `greenBright`, `yellowBright`, `blueBright`, `magentaBright`, `cyanBright`, `whiteBright`
- **Bright background**: `bgBlackBright`, `bgRedBright`, `bgGreenBright`, `bgYellowBright`, `bgBlueBright`, `bgMagentaBright`, `bgCyanBright`, `bgWhiteBright`

All functions have the signature `(String) -> String` and can be composed via nesting:

```cangjie
c.bold(c.red("bold and red"))
```

