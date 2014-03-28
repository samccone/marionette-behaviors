Marionette Behaviors
--------

A collection of useful behaviors I have abstracted from my applications

## Behaviors

### Closeable

Closes a view on click of an element with a class of `.close`. It also listens for a user to hit the `esc` key and then closes the view

```coffeescript
class FooView extends Marionette.ItemView
  behaviors:
    Closeable: {}
```

### ViewLinks

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

### BottomScroller

Allows you to scroll to the bottom of a given view `onRender` and on any passed events emitted on `App.vent`

```coffeescript
class FooView extends Marionette.ItemView
  behaviors:
    BottomScroller: {
      events: "commentsUpdated"
    }
```
