import XCTest
import EasyRegex

final class EasyRegexTests: XCTestCase {
    
    func testAnyCharacterExceptNewLine() {
        // Arrange
        var testString = String()
        var range: NSRange!
        var pattern: NSRegularExpression!
        var matches: [NSTextCheckingResult]
        
        // Test builder
        let regex = EasyRegexBuilder()
            .anyCharacterExceptNewLine()
            .build()
        XCTAssertEqual(".", regex)
        
        // Test pattern with character
        testString = "a"
        range = NSRange(location: 0, length: testString.count)
        pattern = try! NSRegularExpression(pattern: regex)
        matches = pattern.matches(in: testString, options: [], range: range)
        XCTAssertEqual(1, matches.count)
        
        // Test pattern with newline
        testString = "\n"
        range = NSRange(location: 0, length: testString.count)
        pattern = try! NSRegularExpression(pattern: regex)
        matches = pattern.matches(in: testString, options: [], range: range)
        XCTAssertEqual(0, matches.count)
    }
    
    func testWord() {
        // Arrange
        var testString = String()
        var range: NSRange!
        var pattern: NSRegularExpression!
        var matches: [NSTextCheckingResult]
        
        // Test builder
        let regex = EasyRegexBuilder()
            .word()
            .build()
        XCTAssertEqual("\\w", regex)
    }
    
    func testDigit() {
        let regex = EasyRegexBuilder()
            .digit()
            .build()
        
        XCTAssertEqual("\\d", regex)
    }
    
    func testWhitespace() {
        let regex = EasyRegexBuilder()
            .whitespace()
            .build()
        
        XCTAssertEqual("\\s", regex)
    }
    
    func testNotWord() {
        let regex = EasyRegexBuilder()
            .notWord()
            .build()
        
        XCTAssertEqual("\\W", regex)
    }
    
    func testNotDigit() {
        let regex = EasyRegexBuilder()
            .notDigit()
            .build()
        
        XCTAssertEqual("\\D", regex)
    }
    
    func testNotWhitespace() {
        let regex = EasyRegexBuilder()
            .notWhitespace()
            .build()
        
        XCTAssertEqual("\\S", regex)
    }
    
    func testAnyOf() {
        let regex = EasyRegexBuilder()
            .anyOf(["a", "b", "c"])
            .build()
        
        XCTAssertEqual("[abc]", regex)
    }
    
    func testExactly() {
        let regex = EasyRegexBuilder()
            .exactly(3, of: "a")
            .build()
        
        XCTAssertEqual("a{3}", regex)
    }
    
    func testStartOfString() {
        let regex = EasyRegexBuilder()
            .startOfString()
            .build()
        
        XCTAssertEqual("^", regex)
    }
    
    func testEndOfString() {
        let regex = EasyRegexBuilder()
            .endOfString()
            .build()
        
        XCTAssertEqual("$", regex)
    }
    
    func testZeroOrMore() {
        let regex = EasyRegexBuilder()
            .zeroOrMore(of: "a")
            .build()
        
        XCTAssertEqual("a*", regex)
    }
    
    func testBetween() {
        let regex = EasyRegexBuilder()
            .between(2, and: 4, of: "a")
            .build()
        
        XCTAssertEqual("a{2,4}", regex)
    }
    
    func testOneOrMore() {
        let regex = EasyRegexBuilder()
            .oneOrMore(of: "a")
            .build()
        
        XCTAssertEqual("a+", regex)
    }
    
    func testZeroOrOne() {
        let regex = EasyRegexBuilder()
            .zeroOrOne(of: "a")
            .build()
        
        XCTAssertEqual("a?", regex)
    }
}
