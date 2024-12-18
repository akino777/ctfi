// The Swift Programming Language
// https://docs.swift.org/swift-book

import ArgumentParser

struct CTFI: ParsableCommand {
    @Option(
        name: .shortAndLong,
        help: """
        Generates the same number of characters as the entered number.
        Only alphabet characters are generated.
        Usage example: `ctri --count {count}`
        """
    )
    var count: Int?

    @Flag(
        name: .shortAndLong,
        help: """
        If you want to output numbers, please specify the --number flag.
        Usage example: `ctfi --count {count} --number`
        """
    )
    var number: Bool = false

    @Flag(
        name: .shortAndLong,
        help: """
        If you want to output in Japanese, please specify the --japanese flag.
        Usage example: `ctfi --count {count} --japanese`
        """
    )
    var japanese: Bool = false

    @Flag(
        name: .shortAndLong,
        help: """
        If you want to output symbols, please specify the --symbol flag.
        Usage example: `ctfi --count {count} --symbol`
        """
    )
    var symbol: Bool = false

    @Flag(
        name: .shortAndLong,
        help: """
        Show version.
        Usage example: `ctri --version`
        """
    )
    var version: Bool = false

    mutating func run() throws {
        if let message = validate() {
            print(message)
            return
        }

        if let count: Int = count {
            handleCharacterGenerate(count: count, number: number, japanese: japanese)
            return
        }
    }
}

CTFI.main()

extension CTFI {
    private func handleCharacterGenerate(count: Int, number: Bool, japanese: Bool) {
        if number {
            let characters = Character.generate(count: count, letters: Constants.numbers)
            print(characters)
            return
        }

        if japanese {
            let characters = Character.generate(count: count, letters: Constants.japanese)
            print(characters)
            return
        }

        if symbol {
            let characters = Character.generate(count: count, letters: Constants.symbol)
            print(characters)
            return
        }

        let characters = Character.generate(count: count, letters: Constants.alphabet)
        print(characters)
    }
}

extension CTFI {
    func validate() -> String? {
        let flags = [number, japanese, symbol, version]
        let selectedFlags = flags.filter { $0 }

        if selectedFlags.count > 1 {
            return "Only one flag can be specified at a time."
        }

        if version {
            return "ctri version 1.0.0"
        }

        return nil
    }
}
