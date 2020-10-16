|Jump To|[`Go Back`](Core-Index)|[Arguments](#arguments)|[Methods](#methods)|[Variables](#variables)|
|---|---|---|---|---|
>## StringFormatter( format_rules, _functions )
 var _formatter = new StringFormatter( " :strip,\t:strip" );  show_debug_message( _formatter.format( "  Hello	World!" ) );
```GML
// no example provided
```
## Arguments
|Name|Type|Purpose|
|---|---|---|
|format_rules|`string`|The rules to use when formatting strings|
|_functions|`undef`|none provided|
No variables defined.
## Methods
|Jump To|[`top`](#)|[**rules**](#rules-rules-)|[**format**](#format-input-)|
|---|---|---|---|
> ### rules( rules )
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---|
|rules|`string`|A comma-separated list of rules to use when formatting the string. The rules are defined as part of the rules library.|

Processes the format into a set of rules the formatter can then use.
***
> ### format( input )
*Returns:* string (`"string"`)
|Name|Type|Purpose|
|---|---|---|
|input|`string`|The string to format|

Takes the input, applies the ruleset, and returns the modified string.
***

## Variables
|Jump To|[`top`](#)|
|---|---|
