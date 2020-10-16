|Jump To|[`Go Back`](Core-Index)|[Arguments](#arguments)|[Methods](#methods)|[Variables](#variables)|
|---|---|---|---|---|
>## DsLinkedList( values... )
A garbage-collected, linear-traversable linked-list.
```GML
// no example provided
```
## Arguments
|Name|Type|Purpose|
|---|---|---|
|values...|`undef`|none provided|

## Methods
|Jump To|[`top`](#)|[**add**](#add-value-)|[**remove**](#remove-link-)|[**first**](#first)|[**has_next**](#has_next-link-)|[**next**](#next-link-)|[**find**](#find-value-)|[**is**](#is-_data_type-)|
|---|---|---|---|---|---|---|---|---|
> ### add( value )
*Returns:* ChainLink
|Name|Type|Purpose|
|---|---|---|
|value|`mixed`|The value to add to the list|

Adds the given value to the list, and returns the link that contains it.
***
> ### remove( link )
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---|
|link|`ChainLink`|The link to remove.|

Removes the given link from the list
***
> ### first()
*Returns:* ChainLink (or `undefined`)
|Name|Type|Purpose|
|---|---|---||None|||

Returns the first link in the list.  Returns `undefined` if the list is empty.
***
> ### has_next( link )
*Returns:* boolean (`true` or `false`)
|Name|Type|Purpose|
|---|---|---|
|link|`ChainLink`|The link to check.|

Returns if there are more links after the specified one.
***
> ### next( link )
*Returns:* ChainLink (or `undefined`)
|Name|Type|Purpose|
|---|---|---|
|link|`ChainLink`|The link to check.|

Returns the next link after the specified one, or `undefined` if this is the last one.
***
> ### find( value )
*Returns:* ChainLink (or `undefined`)
|Name|Type|Purpose|
|---|---|---|
|value|`mixed`|The value to check for|

Searches the list for the given value and returns the link holding it, or `undefined` if it isn't found.
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
* final - none provided
