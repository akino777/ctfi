import Foundation

extension Character {
    static func generate(count: Int, letters: String) -> String {
        return String((0 ..< count).map { _ in letters.randomElement()! })
    }
}
