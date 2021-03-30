local indent = require'snippets.utils'.match_indentation

local java = {}

java.getter = indent [[
public ${1:int} get${2:Num|S.v:gsub("^%l", string.upper)}() {
    return ${|S[2]:gsub("^%u", string.lower)};
}]]

java.setter = indent [[
public void set${|S[2]:gsub("^%l", string.upper)}(${1:int} ${2:num}) {
    this.$2 = $2;
}]]

java.main = indent [[
public static void main(String[] args) {
    $0
}]]

java.println = "System.out.println($0);"
java.print = "System.out.print($0);"
java.package = "package $1;$0"

return java
