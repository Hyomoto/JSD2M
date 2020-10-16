|Jump To|[`Go Back`](Core-Index)|[Arguments](#arguments)|[Methods](#methods)|[Variables](#variables)|
|---|---|---|---|---|
>## DsChain()
inheritable template, provides a standardized interface for dealing with linked /		data structures
```GML
// no example provided
```
## Arguments
|Name|Type|Purpose|
|---|---|---||None|||

## Methods
|Jump To|[`top`](#)|[**ChainLink**](#ChainLink-value-)|[**clear**](#clear)|[**empty**](#empty)|[**size**](#size)|[**toArray**](#toArray)|[**toString**](#toString-divider-)|[**is**](#is-_data_type-)|
|---|---|---|---|---|---|---|---|---|
> ### ChainLink( value )
*Returns:* ChainLink
|Name|Type|Purpose|
|---|---|---|
|value|`mixed`|The value to store|

A structure for holding and linking values as part of a DsChain.
***
> ### clear()
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---||None|||

Clears the chain, removing all links.
***
> ### empty()
*Returns:* boolean (`true` or `false`)
|Name|Type|Purpose|
|---|---|---||None|||

Returns `true` if the structure has no links.
***
> ### size()
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---||None|||

Returns the number of links in the structure.
***
> ### toArray()
*Returns:* N/A `undefined`
|Name|Type|Purpose|
|---|---|---||None|||

No description.
***
> ### toString( divider )
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---|
|divider|`string`|optional: The divider between each element. Default: ", "|

Returns a comma-separated string(by default) of all values in the array.
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
* chain - none provided
* links - none provided
