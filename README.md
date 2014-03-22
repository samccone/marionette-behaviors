Marionette Behaviors
--------

A collection of useful behaviors I have abstracted from my applications

## Behaviors

### Closeable

Closes a view on click of an element with a class of `.close`. It also listens for a user to hit the `esc` key and then closes the view

```coffeescript
class FooView extend Marionette.ItemView
  behaviors:
    Closeable: {}
```