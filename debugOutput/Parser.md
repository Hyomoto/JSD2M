|Jump To|[`Go Back`](Core-Index)|[Arguments](#arguments)|[Methods](#methods)|[Variables](#variables)|
|---|---|---|---|---|
>## Parser()
 var _parser = new Parser().parse( "Hello World!" )  while( _parser.has_next() ) { 	show_debug_message( _parser.next() ); }
```GML
// no example provided
```
## Arguments
|Name|Type|Purpose|
|---|---|---||None|||

## Methods
|Jump To|[`top`](#)|[**size**](#size)|[**parse**](#parse-string-)|[**clear**](#clear)|[**reset**](#reset)|[**has_next**](#has_next)|[**next**](#next)|[**next_line**](#next_line)|[**peek**](#peek)|[**toArray**](#toArray)|[**toString**](#toString)|
|---|---|---|---|---|---|---|---|---|---|---|---|[**is**](#is-_data_type-)|
> ### size()
*Returns:* int (`0..`)
|Name|Type|Purpose|
|---|---|---||None|||

Returns the length of the internal string
***
> ### parse( string )
*Returns:* `self`
|Name|Type|Purpose|
|---|---|---|
|string|`string`|The string to parse|

Readies a string for parsing
***
> ### clear()
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---||None|||

Clears the parser of input
***
> ### reset()
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---||None|||

Resets the parser to start at the beginning of the string
***
> ### has_next()
*Returns:* string (`"string"`)
|Name|Type|Purpose|
|---|---|---||None|||

Returns `true` if there is string remaining to be parsed.
***
> ### next()
*Returns:* string (`"string"`), or `undefined`
|Name|Type|Purpose|
|---|---|---||None|||

Returns the next word in the string, or `undefined` if there is nothing left to parse.
***
> ### next_line()
*Returns:* string (`"string"`), or `undefined`
|Name|Type|Purpose|
|---|---|---||None|||

Returns the rest of the unparsed string, or `undefined` if nothing is left.
***
> ### peek()
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---||None|||

Returns the next word in the string without advancing the parser.
***
> ### toArray()
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---||None|||

Returns the internal string broken up into words as an array.
***
> ### toString()
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---||None|||

Returns the internal string.
***
> ### is( _data_type )
*Returns:* N/A `undefined`
|Name|Type|Purpose|
|---|---|---|
|_data_type|`undef`|none provided|

No description.
***

## Variables
|Jump To|[`top`](#)|
|---|---|
* content - none provided
* last - none provided
