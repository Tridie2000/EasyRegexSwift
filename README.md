# EasyRegex

EasyRegex is a Swift library to simplify the usage of regular expressions. You can declare patterns with a simple declarative syntax.

## How to use

1. Start by creating a new `EasyRegexBuilder()`
2. Create a chain of commands after the `EasyRegexBuilder()` like `.digit()`
3. Finish the chain by calling `.build()` to build the pattern. This returns the pattern as a string you can use in a regular expression pattern matcher.
