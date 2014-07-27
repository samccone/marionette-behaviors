App.module "Behaviors", (Behaviors, App, Backbone, Marionette) ->
  class Behaviors.KeyEvents extends Marionette.Behavior
    defaults:
      preventDefault: []

    onShow: ->
      $(window).on 'keydown', @checkKey

    onDestroy: ->
      $(window).off 'keydown', @checkKey

    shouldIgnore: ->
      a = document.activeElement.tagName
      return true if a is "INPUT" or a is "TEXTAREA"

    checkKey: (e) =>
      return if @shouldIgnore()

      if toInvoke = @options[e.keyCode]
        fn = toInvoke.call(@view, e)

      if ~@options.preventDefault.indexOf(e.keyCode)
        e.preventDefault()
        return false

