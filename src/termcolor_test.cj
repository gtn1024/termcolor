package termcolor

import std.unittest.*
import std.unittest.testmacro.*

@Test
func testColorMatching() {
    let c = createColors(true)
    @Expect(c.red("string") == "\u{1b}[31m" + "string" + "\u{1b}[39m")
    @Expect(c.green("hello") == "\u{1b}[32m" + "hello" + "\u{1b}[39m")
    @Expect(c.bold("test") == "\u{1b}[1m" + "test" + "\u{1b}[22m")
    @Expect(c.blue("world") == "\u{1b}[34m" + "world" + "\u{1b}[39m")
    @Expect(c.bgRed("bg") == "\u{1b}[41m" + "bg" + "\u{1b}[49m")
    @Expect(c.yellowBright("bright") == "\u{1b}[93m" + "bright" + "\u{1b}[39m")
}

@Test
func testFormatColorNesting() {
    let c = createColors(true)
    let result = c.bold("BOLD " + c.red("RED " + c.dim("DIM") + " RED") + " BOLD")
    @Expect(result == "\u{1b}[1m" + "BOLD " + "\u{1b}[31m" + "RED " + "\u{1b}[2m" + "DIM" + "\u{1b}[22m" + "\u{1b}[1m" + " RED" + "\u{1b}[39m" + " BOLD" + "\u{1b}[22m")
}

@Test
func testProperWrapping() {
    let c = createColors(true)
    @Expect(c.red(c.bold("==TEST==")) == "\u{1b}[31m" + "\u{1b}[1m" + "==TEST==" + "\u{1b}[22m" + "\u{1b}[39m")
}

@Test
func testComplexWrapping() {
    let c = createColors(true)
    @Expect(c.bold(c.yellow(c.bgRed(c.italic("==TEST==")))) == "\u{1b}[1m" + "\u{1b}[33m" + "\u{1b}[41m" + "\u{1b}[3m" + "==TEST==" + "\u{1b}[23m" + "\u{1b}[49m" + "\u{1b}[39m" + "\u{1b}[22m")
    @Expect(c.cyan(c.bold(c.underline("==TEST=="))) == "\u{1b}[36m" + "\u{1b}[1m" + "\u{1b}[4m" + "==TEST==" + "\u{1b}[24m" + "\u{1b}[22m" + "\u{1b}[39m")
}

@Test
func testCloseSequenceReplacement() {
    let c = createColors(true)
    @Expect(c.red("foo " + c.yellow("bar") + " baz") == "\u{1b}[31m" + "foo " + "\u{1b}[33m" + "bar" + "\u{1b}[31m" + " baz" + "\u{1b}[39m")
    @Expect(c.bold("foo " + c.red(c.dim("bar")) + " baz") == "\u{1b}[1m" + "foo " + "\u{1b}[31m" + "\u{1b}[2m" + "bar" + "\u{1b}[22m" + "\u{1b}[1m" + "\u{1b}[39m" + " baz" + "\u{1b}[22m")
}

@Test
func testDisabledColors() {
    let c = createColors(false)
    @Expect(c.isColorSupported == false)
    @Expect(c.red("hello") == "hello")
    @Expect(c.bold("test") == "test")
    @Expect(c.bgBlue("bg") == "bg")
}

@Test
func testIsColorSupported() {
    @Expect(createColors(true).isColorSupported == true)
    @Expect(createColors(false).isColorSupported == false)
}

@Test
func testAllFormatters() {
    let c = createColors(true)
    let formatters: Array<(String) -> String> = [c.reset, c.bold, c.dim, c.italic, c.underline, c.inverse, c.hidden, c.strikethrough]
    for (f in formatters) {
        @Expect(f("x").contains("x"))
    }
}

@Test
func testAllColors() {
    let c = createColors(true)
    let colors: Array<(String) -> String> = [c.black, c.red, c.green, c.yellow, c.blue, c.magenta, c.cyan, c.white, c.gray]
    for (f in colors) {
        @Expect(f("x").contains("x"))
    }
}

@Test
func testAllBgColors() {
    let c = createColors(true)
    let colors: Array<(String) -> String> = [c.bgBlack, c.bgRed, c.bgGreen, c.bgYellow, c.bgBlue, c.bgMagenta, c.bgCyan, c.bgWhite]
    for (f in colors) {
        @Expect(f("x").contains("x"))
    }
}

@Test
func testAllBrightColors() {
    let c = createColors(true)
    let colors: Array<(String) -> String> = [c.blackBright, c.redBright, c.greenBright, c.yellowBright, c.blueBright, c.magentaBright, c.cyanBright, c.whiteBright]
    for (f in colors) {
        @Expect(f("x").contains("x"))
    }
}

@Test
func testAllBgBrightColors() {
    let c = createColors(true)
    let colors: Array<(String) -> String> = [c.bgBlackBright, c.bgRedBright, c.bgGreenBright, c.bgYellowBright, c.bgBlueBright, c.bgMagentaBright, c.bgCyanBright, c.bgWhiteBright]
    for (f in colors) {
        @Expect(f("x").contains("x"))
    }
}
