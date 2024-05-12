; Variables
(identifier) @variable

; Methods
(method_declaration
  name: (identifier) @function)
(method_invocation
  name: (identifier) @function.call)
(super) @function.builtin

; Constructors
(constructor_declaration
  name: (identifier) @constructor)
(constructor_invocation 
  type: (type_identifier) @constructor)

; Annotations
(annotation
  name: (identifier) @attribute)
(marker_annotation
  name: (identifier) @attribute)
(annotation_argument_list
  (element_value_pair
    (identifier) @variable.parameter))
"@" @operator

; Types
(type_identifier) @type
(interface_declaration
  name: (identifier) @type)
(class_declaration
  name: (identifier) @type)
(enum_declaration
  name: (identifier) @type)
((field_access
  object: (identifier) @type)
 (#match? @type "^[A-Z]"))
((scoped_identifier
  scope: (identifier) @type)
 (#match? @type "^[A-Z]"))
((method_invocation
  object: (identifier) @type)
 (#match? @type "^[A-Z]"))
((method_reference
  . (identifier) @type)
 (#match? @type "^[A-Z]"))
[
  (boolean_type)
  (integral_type)
  (floating_point_type)
  (floating_point_type)
  (void_type)
] @type.builtin

; Generics
(type_arguments
  (type_identifier) @type)
(type_parameters
  (type_parameter
    name: (identifier) @type
    type_bound: (type_bound
      (type_identifier) @type)))

; Constants
((identifier) @constant
 (#match? @constant "^_*[A-Z][A-Z\\d_]+$"))

; Builtins
(this) @variable.builtin
(super) @variable.builtin

; Literals
[
  (hex_integer_literal)
  (decimal_integer_literal)
  (octal_integer_literal)
  (decimal_floating_point_literal)
  (hex_floating_point_literal)
] @number
[
  (character_literal)
  (string_literal)
  (text_block)   ; Java 13+
] @string
(escape_sequence) @string.escape
[
  (true)
  (false)
  (null_literal)
] @constant.builtin

; Comments
[
  (line_comment)
  (block_comment)
] @comment

; Java 12+ Switch Expressions
(switch_expression
  "switch" @keyword
  (switch_block
    (switch_label
      (case_label) @keyword)))

; Java 9+ Module System
(module_declaration 
  "module" @keyword
  name: (identifier) @namespace)
[
  "requires"
  "exports"
  "opens"
] @keyword

; Java 14+ Records
(record_declaration
  "record" @keyword
  name: (identifier) @type
  parameters: (formal_parameters
    (formal_parameter
      name: (identifier) @variable.parameter)))

; Java 14+ Pattern Matching
(instanceof_expression
  left: (identifier) @variable
  right: (type_identifier) @type
  (identifier) @variable)

; Java 15+ Sealed Classes and Interfaces
(class_declaration
  (modifiers
    (annotation
      name: (identifier) @attribute))
  (modifiers 
    (marker_annotation
      name: (identifier) @attribute)))
(interface_declaration
  (modifiers
    (annotation
      name: (identifier) @attribute))
  (modifiers
    (marker_annotation
      name: (identifier) @attribute)))
[
  "sealed"
  "non-sealed"
  "permits"
] @keyword

; Java 16+ Pattern Matching for instanceof
(instanceof_expression
  left: (identifier) @variable
  right: (type_identifier) @type
  (identifier) @variable)

; Java 17+ Sealed Classes
(class_declaration
  (modifiers
    (annotation
      name: (identifier) @attribute))
  (modifiers 
    (marker_annotation
      name: (identifier) @attribute)))
(interface_declaration
  (modifiers
    (annotation
      name: (identifier) @attribute))
  (modifiers
    (marker_annotation
      name: (identifier) @attribute)))
[
  "sealed"
  "non-sealed"
  "permits"
] @keyword

; Java 19+ Virtual Threads
(method_declaration
  (modifiers
    (annotation
      name: (identifier) @attribute))
  (modifiers
    (marker_annotation
      name: (identifier) @attribute)))
[
  "virtual"
] @keyword

; Java 20+ Record Patterns
(record_pattern
  (type_identifier) @type
  (record_component_pattern_list
    (record_component_pattern
      (identifier) @variable)))

; Inline Comments
(line_comment) @comment.line

; Javadoc Comments
(comment
  (comment_content) @comment.documentation)

; Enums with Fields and Methods
(enum_declaration
  name: (identifier) @type
  body: (enum_body
    (enum_constant
      name: (identifier) @constant)
    (field_declaration
      (variable_declarator
        name: (identifier) @variable)
      (variable_declarator
        (identifier) @variable))
    (method_declaration
      name: (identifier) @function)))

; Static Imports
(import_declaration
  "import" @keyword
  "static" @keyword)

; Lambda Expressions
(lambda_expression
  parameters: (identifier) @variable.parameter
  "->" @operator)

; Type Casting and instanceof
(cast_expression
  "(" @punctuation
  (type_identifier) @type
  ")" @punctuation)
(instanceof_expression
  "instanceof" @keyword)

; Ternary Operator
(ternary_expression
  "?" @operator
  ":" @operator)

; Keywords
[
  "abstract"
  "assert"
  "break"
  "case"
  "catch"
  "class"
  "continue"
  "default"
  "do"
  "else"
  "enum"
  "exports"
  "extends"
  "final"
  "finally"
  "for"
  "if"
  "implements"
  "import"
  "instanceof"
  "interface"
  "module"
  "native"
  "new"
  "non-sealed"
  "open"
  "opens"
  "package"
  "private"
  "protected"
  "provides"
  "public"
  "requires"
  "record"
  "return"
  "sealed"
  "static"
  "strictfp"
  "switch"
  "synchronized"
  "throw"
  "throws"
  "to"
  "transient"
  "transitive"
  "try"
  "uses"
  "volatile"
  "while"
  "when"
  "yield"
  "var"
] @keyword

; Operators
[
  "+"
  "-"
  "*"
  "/"
  "%"
  "="
  "+="
  "-="
  "*="
  "/="
  "%="
  "=="
  "!="
  "<"
  "<="
  ">"
  ">="
  "&&"
  "||"
  "!"
  "~"
  "?"
  ":"
  "^"
  "|"
  "&"
  "<<"
  ">>"
  ">>>"
  "++"
  "--"
  "->"
  "::"
] @operator

; Punctuation
[
  ","
  "."
  ";"
  "..."
  "("
  ")"
  "["
  "]"
  "{"
  "}"
  "@"
  "::"
] @punctuation