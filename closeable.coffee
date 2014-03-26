App.module "Behaviors", (Behaviors, App, Backbone, Marionette, $, _) ->
  class Behaviors.Closeable extends Marionette.Behavior
    events: ->
      "click .close": -> @view.close()

    onShow: ->
      $(window).on 'keydown', @checkClose

    onClose: ->
      $(window).off 'keydown', @checkClose

    checkClose: (e) =>
      @view.close() if e.keyCode is 27

