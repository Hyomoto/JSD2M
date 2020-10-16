|Jump To|[`Go Back`](Core-Index)|[Arguments](#arguments)|[Methods](#methods)|[Variables](#variables)|
|---|---|---|---|---|
>## DsQueue( values... )
 queue = new DsQueue()  queue.enqeue( "Hello!" ) show_debug_message( queue.dequeue() );
```GML
// no example provided
```
## Arguments
|Name|Type|Purpose|
|---|---|---|
|values...|`mixed`|The initial values to be pushed to the queue|

## Methods
|Jump To|[`top`](#)|[**enqueue**](#enqueue-values...-)|[**enqueue_at_head**](#enqueue_at_head-values...-)|[**dequeue**](#dequeue-values...-)|[**head**](#head-values...-)|[**tail**](#tail-values...-)|[**is**](#is-_data_type-)|
|---|---|---|---|---|---|---|---|
> ### enqueue( values... )
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---|
|values...|`mixed`|Enqueues the values at the tail of the queue|

no description provided
***
> ### enqueue_at_head( values... )
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---|
|values...|`mixed`|Enqueues the values at the head of the queue|

no description provided
***
> ### dequeue( values... )
*Returns:* Mixed
|Name|Type|Purpose|
|---|---|---|
|values...|`mixed`|Removes the value at the front of the queue and returns it|

no description provided
***
> ### head( values... )
*Returns:* Mixed
|Name|Type|Purpose|
|---|---|---|
|values...|`mixed`|Returns the value at the head of the queue|

no description provided
***
> ### tail( values... )
*Returns:* Mixed
|Name|Type|Purpose|
|---|---|---|
|values...|`mixed`|Removes the value at the tail of the queue and returns it|

no description provided
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
* tail_link - none provided
