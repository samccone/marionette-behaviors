Marionette Behaviors
--------

A collection of useful behaviors I have abstracted from my applications

### Table of Contents

  * [Closeable](#closeable)
  * [ViewLinks](#viewlinks)
  * [BottomScroller](#bottomscroller)
  * [KeyEvents](#keyevents)
  * [HtmlClass](#htmlclass)
  * [AutoRegion](#autoregion)

## Closeable

Closes a view on click of an element with a class of `.close`. It also listens for a user to hit the `esc` key and then closes the view

```coffeescript
class FooView extends Marionette.ItemView
  behaviors:
    Closeable: {}
```

## ViewLinks

Allows you to define `v-href="route"` within you tags for invoking `App.Router.navigate` passing your route.

```coffeescript
class FooView extends Marionette.ItemView
  behaviors:
    ViewLinks: {}
```

** In your view template **
```jade
ul
  li
    a(v-href="detail/{item.id}")
```

## BottomScroller

Allows you to scroll to the bottom of a given view `onRender` and on any passed events emitted on `App.vent`

```coffeescript
class FooView extends Marionette.ItemView
  behaviors:
    BottomScroller: {
      events: "commentsUpdated"
    }
```

### Options

#### Events
  The `events` option can be `null`, a single string, or an array or strings.
  All of the passed events will be set to listen on `App.vent`

## KeyEvents

The `KeyEvents` behavior allows you to define global (single) key events that trigger view specific actions.

```coffeescript
class FooView extends Marionette.ItemView
  behaviors:
    KeyEvents:
      8:  -> @deleteImage()
      39: -> App.vent.trigger('edit:advance')
      37: -> App.vent.trigger('edit:previous')
      49: -> @setActiveRating(0)
      50: -> @setActiveRating(1)
      51: -> @setActiveRating(2)
      52: -> @setActiveRating(3)
      53: -> @setActiveRating(4)
      preventDefault: [8, 39, 37]

  setActiveRating: -> #...
  deleteImage: -> #...
```

### Options
Each option key value actually represents the keyboard event key.

#### preventDefault
Any keyCode passed into this array will prevent the default action of the event.

## HtmlClass

The `HtmlClass` behavior allows you to set a class on the `html` element on `onShow` and remove the class `onDestroy` of the view.

```coffeescript
  class MyView extends Marionette.ItemView
    behaviors:
      HtmlClass: {class: "help-modal noover"}
```

## AutoRegion

Do you find yourself writing this code over and over again?

```coffeescript
class MyView extends Marionette.LayoutView
  onShow: ->
    @fooRegion.show(new BarView)
    @zapRegion.show(new ZapView)
```

Well `AutoRegion` is the answer!
With a few declarative lines of code your regions will now auto populate.

```coffeescript
class MyView extends Marionette.LayoutView
  behaviors:
    AutoRegion: {}

  regions: ->
    fooRegion:
      selector: ".bam"
      viewClass: MyViewClass
      viewOptions: {} (or method def)
```

