App.module "Behaviors", (Behaviors, App, Backbone, Marionette, $, _) ->
  class Behaviors.HtmlClass extends Marionette.Behavior
    onShow: ->
      $('html').addClass @options.class

    onDestroy: ->
      $('html').removeClass @options.class