App.module "Behaviors", (Behaviors, App, Backbone, Marionette, $, _) ->
  class Behaviors.Closeable extends Marionette.Behavior
    events: ->
      "click .close": -> @view.destroy()

    onShow: ->
      $(window).on 'keydown', @checkClose

    onDestroy: ->
      $(window).off 'keydown', @checkClose

    checkClose: (e) =>
      @view.destroy() if e.keyCode is 27

