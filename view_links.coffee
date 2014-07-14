App.module "Behaviors", (Behaviors, App, Backbone, Marionette, $, _) ->
  class Behaviors.ViewLinks extends Marionette.Behavior
    events:
      "click [v-href]": 'routeTrigger'

    routeTrigger: (e) ->
      App.Router.navigate $(e.currentTarget).attr('v-href'), trigger: 1
