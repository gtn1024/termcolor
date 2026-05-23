package termcolor

public class Colors {
    public var isColorSupported: Bool = true

    public var reset: (String) -> String
    public var bold: (String) -> String
    public var dim: (String) -> String
    public var italic: (String) -> String
    public var underline: (String) -> String
    public var inverse: (String) -> String
    public var hidden: (String) -> String
    public var strikethrough: (String) -> String

    public var black: (String) -> String
    public var red: (String) -> String
    public var green: (String) -> String
    public var yellow: (String) -> String
    public var blue: (String) -> String
    public var magenta: (String) -> String
    public var cyan: (String) -> String
    public var white: (String) -> String
    public var gray: (String) -> String

    public var bgBlack: (String) -> String
    public var bgRed: (String) -> String
    public var bgGreen: (String) -> String
    public var bgYellow: (String) -> String
    public var bgBlue: (String) -> String
    public var bgMagenta: (String) -> String
    public var bgCyan: (String) -> String
    public var bgWhite: (String) -> String

    public var blackBright: (String) -> String
    public var redBright: (String) -> String
    public var greenBright: (String) -> String
    public var yellowBright: (String) -> String
    public var blueBright: (String) -> String
    public var magentaBright: (String) -> String
    public var cyanBright: (String) -> String
    public var whiteBright: (String) -> String

    public var bgBlackBright: (String) -> String
    public var bgRedBright: (String) -> String
    public var bgGreenBright: (String) -> String
    public var bgYellowBright: (String) -> String
    public var bgBlueBright: (String) -> String
    public var bgMagentaBright: (String) -> String
    public var bgCyanBright: (String) -> String
    public var bgWhiteBright: (String) -> String

    public init(enabled: Bool) {
        isColorSupported = enabled
        let f: (String, String, String) -> (String) -> String = if (enabled) { format } else { identity }
        reset = f("\u{1b}[0m", "\u{1b}[0m", "\u{1b}[0m")
        bold = f("\u{1b}[1m", "\u{1b}[22m", "\u{1b}[22m\u{1b}[1m")
        dim = f("\u{1b}[2m", "\u{1b}[22m", "\u{1b}[22m\u{1b}[2m")
        italic = f("\u{1b}[3m", "\u{1b}[23m", "\u{1b}[3m")
        underline = f("\u{1b}[4m", "\u{1b}[24m", "\u{1b}[4m")
        inverse = f("\u{1b}[7m", "\u{1b}[27m", "\u{1b}[7m")
        hidden = f("\u{1b}[8m", "\u{1b}[28m", "\u{1b}[8m")
        strikethrough = f("\u{1b}[9m", "\u{1b}[29m", "\u{1b}[9m")

        black = f("\u{1b}[30m", "\u{1b}[39m", "\u{1b}[30m")
        red = f("\u{1b}[31m", "\u{1b}[39m", "\u{1b}[31m")
        green = f("\u{1b}[32m", "\u{1b}[39m", "\u{1b}[32m")
        yellow = f("\u{1b}[33m", "\u{1b}[39m", "\u{1b}[33m")
        blue = f("\u{1b}[34m", "\u{1b}[39m", "\u{1b}[34m")
        magenta = f("\u{1b}[35m", "\u{1b}[39m", "\u{1b}[35m")
        cyan = f("\u{1b}[36m", "\u{1b}[39m", "\u{1b}[36m")
        white = f("\u{1b}[37m", "\u{1b}[39m", "\u{1b}[37m")
        gray = f("\u{1b}[90m", "\u{1b}[39m", "\u{1b}[90m")

        bgBlack = f("\u{1b}[40m", "\u{1b}[49m", "\u{1b}[40m")
        bgRed = f("\u{1b}[41m", "\u{1b}[49m", "\u{1b}[41m")
        bgGreen = f("\u{1b}[42m", "\u{1b}[49m", "\u{1b}[42m")
        bgYellow = f("\u{1b}[43m", "\u{1b}[49m", "\u{1b}[43m")
        bgBlue = f("\u{1b}[44m", "\u{1b}[49m", "\u{1b}[44m")
        bgMagenta = f("\u{1b}[45m", "\u{1b}[49m", "\u{1b}[45m")
        bgCyan = f("\u{1b}[46m", "\u{1b}[49m", "\u{1b}[46m")
        bgWhite = f("\u{1b}[47m", "\u{1b}[49m", "\u{1b}[47m")

        blackBright = f("\u{1b}[90m", "\u{1b}[39m", "\u{1b}[90m")
        redBright = f("\u{1b}[91m", "\u{1b}[39m", "\u{1b}[91m")
        greenBright = f("\u{1b}[92m", "\u{1b}[39m", "\u{1b}[92m")
        yellowBright = f("\u{1b}[93m", "\u{1b}[39m", "\u{1b}[93m")
        blueBright = f("\u{1b}[94m", "\u{1b}[39m", "\u{1b}[94m")
        magentaBright = f("\u{1b}[95m", "\u{1b}[39m", "\u{1b}[95m")
        cyanBright = f("\u{1b}[96m", "\u{1b}[39m", "\u{1b}[96m")
        whiteBright = f("\u{1b}[97m", "\u{1b}[39m", "\u{1b}[97m")

        bgBlackBright = f("\u{1b}[100m", "\u{1b}[49m", "\u{1b}[100m")
        bgRedBright = f("\u{1b}[101m", "\u{1b}[49m", "\u{1b}[101m")
        bgGreenBright = f("\u{1b}[102m", "\u{1b}[49m", "\u{1b}[102m")
        bgYellowBright = f("\u{1b}[103m", "\u{1b}[49m", "\u{1b}[103m")
        bgBlueBright = f("\u{1b}[104m", "\u{1b}[49m", "\u{1b}[104m")
        bgMagentaBright = f("\u{1b}[105m", "\u{1b}[49m", "\u{1b}[105m")
        bgCyanBright = f("\u{1b}[106m", "\u{1b}[49m", "\u{1b}[106m")
        bgWhiteBright = f("\u{1b}[107m", "\u{1b}[49m", "\u{1b}[107m")
    }
}

func identity(_open: String, _close: String, _replace: String): (String) -> String {
    { s: String => s }
}

func format(open: String, close: String, replace: String): (String) -> String {
    return { input: String =>
        let opt = input.indexOf(close, open.size)
        if (opt.isSome()) {
            let index = opt.getOrThrow()
            open + replaceClose(input, close, replace, index) + close
        } else {
            open + input + close
        }
    }
}

func replaceClose(string: String, close: String, replace: String, startIndex: Int64): String {
    var result = ""
    var cursor: Int64 = 0
    var idx: Option<Int64> = Some(startIndex)
    while (idx.isSome()) {
        let index = idx.getOrThrow()
        result = result + string[cursor..index] + replace
        cursor = index + close.size
        idx = string.indexOf(close, cursor)
    }
    result = result + string[cursor..]
    return result
}

public func createColors(enabled: Bool): Colors {
    return Colors(enabled)
}
