(class_declaration
  name: (identifier) @name) @definition.class

(method_declaration
  name: (identifier) @name) @definition.method

(method_invocation
  name: (identifier) @name
  arguments: (argument_list) @reference.call)

(interface_declaration
  name: (identifier) @name) @definition.interface

(type_list
  (type_identifier) @name) @reference.implementation

(object_creation_expression
  type: (type_identifier) @name) @reference.class

(superclass (type_identifier) @name) @reference.class

(enum_declaration
  name: (identifier) @name) @definition.enum

(constructor_declaration
  name: (identifier) @name) @definition.constructor

(field_declaration
  declarator: (variable_declarator
    name: (identifier) @name)) @definition.field

(record_declaration
  name: (identifier) @name) @definition.record

(generic_type
  name: (type_identifier) @name) @reference.type

(class_body
  (field_declaration
    type: (type_identifier) @name)) @reference.type

(implements_clause
  (type_identifier) @name) @reference.interface

(method_declaration
  return_type: (type_identifier) @name) @reference.type

(method_invocation
  object: (identifier) @name) @reference.variable

(formal_parameter
  type: (type_identifier) @name) @reference.type

(local_variable_declaration
  (type_identifier) @name) @reference.type

(import_declaration
  (identifier) @name) @reference.import

(package_declaration
  (identifier) @name) @definition.package