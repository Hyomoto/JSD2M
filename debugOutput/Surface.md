|Jump To|[`Go Back`](Core-Index)|[Arguments](#arguments)|[Methods](#methods)|[Variables](#variables)|
|---|---|---|---|---|
>## Surface( width, height )
  if ( surface.update() ) {   surface.set();     draw_clear( c_white );   surface.reset(); } surface.draw( 0, 0 );
```GML
// no example provided
```
## Arguments
|Name|Type|Purpose|
|---|---|---|
|width|`int`|none provided|
|height|`int`|none provided|

## Methods
|Jump To|[`top`](#)|[**create**](#create)|[**resize**](#resize-_width-_height-)|[**update**](#update-forced-)|[**draw**](#draw-_x-_y-)|[**draw_part**](#draw_part-left-top-right-bottom-_x-_y-)|[**set**](#set)|[**reset**](#reset)|[**free**](#free)|[**is**](#is-_data_type-)|
|---|---|---|---|---|---|---|---|---|---|---|
> ### create()
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---||None|||

Recreates the internal surface
***
> ### resize( _width, _height )
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---|
|_width|`undef`|none provided|
|_height|`undef`|none provided|

Resizes the internal surface, will trigger a recreation of the surface.
***
> ### update( forced )
*Returns:* boolean (`true` or `false`)
|Name|Type|Purpose|
|---|---|---|
|forced|`bool`|Forces the surface to update, Default: false|

Returns whether or not this surface needs to be updated.  This will return true if the internal surface has not been created, or has been freed, redraw is flagged, or `forced` is set to true.
***
> ### draw( _x, _y )
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---|
|_x|`undef`|none provided|
|_y|`undef`|none provided|

Draws the surface at the given coordinates
***
> ### draw_part( left, top, right, bottom, _x, _y )
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---|
|left|`int`|The left side of the part to draw|
|top|`int`|The top side of the part to draw|
|right|`int`|The right side of the part to draw|
|bottom|`int`|The bottom side of the part to draw|
|_x|`undef`|none provided|
|_y|`undef`|none provided|

Draws the defined part of the surface at the given coordinates
***
> ### set()
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---||None|||

The same as calling `surface_set_target( surface )`
***
> ### reset()
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---||None|||

The same as calling `surface_set_target( surface )`
***
> ### free()
*Returns:* N/A 'undefined`
|Name|Type|Purpose|
|---|---|---||None|||

Frees the internal surface.  Note, if you attempt to use the surface again it will be recreated.
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
* surface - none provided
* width - none provided
* height - none provided
* redraw - none provided
