App.module "Behaviors", (Behaviors, App, Backbone, Marionette, $, _) ->
  Behaviors.ViewLinks = Marionette.Behavior.extend
    events: ->
      "click a[v-href]": @routeTrigger

    routeTrigger: (e) ->
      App.Router.navigate $(e.currentTarget).attr('v-href'), trigger: 1
