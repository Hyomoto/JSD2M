|Jump To|[`Go Back`](Core-Index)|[Arguments](#arguments)|[Methods](#methods)|[Variables](#variables)|
|---|---|---|---|---|
>## Array( array/size, default )
  array = new Array( 10, 0 );   array = new Array( [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] );
```GML
// no example provided
```
## Arguments
|Name|Type|Purpose|
|---|---|---|
|array/size|`undef`|none provided|
|default|`undef`|none provided|

## Methods
|Jump To|[`top`](#)|[**sort**](#sort)|[**unique**](#unique)|[**concat**](#concat-target-)|[**difference**](#difference-target-)|[**union**](#union-target-)|[**contains**](#contains-value-)|[**set**](#set-index-value-)|[**get**](#get-index-)|[**resize**](#resize-size-default-)|[**toArray**](#toArray)|
|---|---|---|---|---|---|---|---|---|---|---|---|[**toString**](#toString-divider-)|[**is**](#is-_data_type-)|
> ### sort()
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---||None|||

Used as a template interface for constructors that inherit Array
***
> ### unique()
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---||None|||

Returns an array containing all of the unique elements in the array.
***
> ### concat( target )
*Returns:* array (`[values...]`)
|Name|Type|Purpose|
|---|---|---|
|target|`array`|The array to combine|

Returns an array containing all the elements from both arrays..
***
> ### difference( target )
*Returns:* array (`[values...]`)
|Name|Type|Purpose|
|---|---|---|
|target|`array`|The array to subtract|

Returns an array containing every element not in the provided array.
***
> ### union( target )
*Returns:* array (`[values...]`)
|Name|Type|Purpose|
|---|---|---|
|target|`array`|The array to union with|

Returns an array containing all of the unique elements between both arrays.
***
> ### contains( value )
*Returns:* int (`0..`)
|Name|Type|Purpose|
|---|---|---|
|value|`mixed`|The value to search for|

Return the first index which contains `value`, or -1 if it wasn't found.
***
> ### set( index, value )
*Returns:* `value`
|Name|Type|Purpose|
|---|---|---|
|index|`int`|The index to set|
|value|`mixed`|The value to assign|

Used to set an element in the array.
***
> ### get( index )
*Returns:* Mixed
|Name|Type|Purpose|
|---|---|---|
|index|`int`|The index to retrieve|

Used to get an element from the array.
***
> ### resize( size, default )
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---|
|size|`int`|The new size for the array|
|default|`mixed`|optional: the value the array any new elements will be populated with. Default is `undefined`|

no description provided
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
* content - none provided
