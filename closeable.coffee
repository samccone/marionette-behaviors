App.module "Behaviors", (Behaviors, App, Backbone, Marionette, $, _) ->
  Behaviors.Closeable = Marionette.Behavior.extend
    events: ->
      "click .close": -> @view.close()

    onShow: ->
      $(window).on 'keydown', _.bind(@checkClose, @view)

    onClose: ->
      $(window).off 'keydown', _.bind(@checkClose, @view)

    checkClose: (e) ->
      @close() if e.keyCode is 27

