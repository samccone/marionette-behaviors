App.module "Behaviors", (Behaviors, App, Backbone, Marionette, $, _) ->
  class Behaviors.AutoRegion extends Marionette.Behavior
    onShow: ->
      _.each @view.regions, (region, regionName) =>
        return unless region.viewClass

        viewClass   = region['viewClass']
        viewOptions = _.result(region, 'viewOptions') || {}

        this.view
        .getRegion(regionName)
        .show(new viewClass(viewOptions))
