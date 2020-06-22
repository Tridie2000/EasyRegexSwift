public class EasyRegexBuilder {
    
    private var regex = String()
    
    public init() {}
    
    public func anyCharacterExceptNewLine() -> EasyRegexBuilder {
        regex += "."
        return self
    }
    
    public func word() -> EasyRegexBuilder {
        regex += "\\w"
        return self
    }
    
    public func digit() -> EasyRegexBuilder {
        regex += "\\d"
        return self
    }
    
    public func whitespace() -> EasyRegexBuilder {
        regex += "\\s"
        return self
    }
    
    public func notWord() -> EasyRegexBuilder {
        regex += "\\W"
        return self
    }
    
    public func notDigit() -> EasyRegexBuilder {
        regex += "\\D"
        return self
    }
    
    public func notWhitespace() -> EasyRegexBuilder {
        regex += "\\S"
        return self
    }
    
    public func anyOf(_ values: [String]) -> EasyRegexBuilder {
        regex += "["
        values.forEach { (value) in regex += "\(value)" }
        regex += "]"
        return self
    }
    
    public func exactly(_ times: Int, of: String) -> EasyRegexBuilder {
        regex += "\(of){\(times)}"
        return self
    }
    
    public func startOfString() -> EasyRegexBuilder {
        regex += "^"
        return self
    }
    
    public func endOfString() -> EasyRegexBuilder {
        regex += "$"
        return self
    }
    
    public func between(_ this: Int, and that: Int, of: String) -> EasyRegexBuilder {
        regex += "\(of){\(this),\(that)}"
        return self
    }
    
    public func zeroOrMore(of this: Character) -> EasyRegexBuilder {
        regex += "\(this)*"
        return self
    }
    
    public func oneOrMore(of this: Character) -> EasyRegexBuilder {
        regex += "\(this)+"
        return self
    }
    
    public func zeroOrOne(of this: Character) -> EasyRegexBuilder {
        regex += "\(this)?"
        return self
    }
    
    public func build() -> String {
        regex
    }
}
