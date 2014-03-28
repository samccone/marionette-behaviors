App.module "Behaviors", (Behaviors, App, Backbone, Marionette, $, _) ->
  class Behaviors.BottomScroller extends Marionette.Behavior
    initialize: (opts) ->
      return unless opts.events?

      _.each Array.prototype.concat(opts.events), (e) =>
        @view.listenTo App.vent, e, @scrollBottom

    onShow: ->
      @scrollBottom()

    scrollBottom: ->
      @$el[0].scrollTop = @$el[0].scrollHeight
