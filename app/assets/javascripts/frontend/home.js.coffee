# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
opts = {
  lines: 12, # The number of lines to draw
  length: 22, # The length of each line
  width: 4, # The line thickness
  radius: 10, # The radius of the inner circle
  corners: 1, # Corner roundness (0..1)
  rotate: 0, # The rotation offset
  color: '#000', # #rgb or #rrggbb
  speed: 1.1, # Rounds per second
  trail: 100, # Afterglow percentage
  shadow: false, # Whether to render a shadow
  hwaccel: false, # Whether to use hardware acceleration
  className: 'spinner', # The CSS class to assign to the spinner
  zIndex: 2e9, # The z-index (defaults to 2000000000)
  top: 'auto', # Top position relative to parent in px
  left: 'auto' # Left position relative to parent in px
}

# save the lastEvent type that was called
lastEvent = undefined
# the element where the spinner should appear
$n = undefined

# I can only pop the $n var when document is ready
$(document).ready ->
  $n = $('.navbar.navbar-static-top')

# get the event type, ex: a "page:change" will return only 'page'
eventType = (event) ->
  return false if not event
  type = event.type
  if type.indexOf(':') > -1
    type.split(':')[0]
  else
    type.match(/[A-Z]?[a-z]+|[0-9]+/g)[0]

# show the spinner
loadState = (event) ->
  lastEvent = eventType event
  $n.spin opts

# hide the spinner
doneState = (event) ->
  if eventType(event) == lastEvent
    lastEvent = undefined
    $n.spin false

# bind some states (will see if it is more needed)
$(document).on 'ajax:before ajaxStart page:fetch', (event) ->
  loadState event
$(document).on 'ajax:complete ajaxComplete page:change', (event) ->
  doneState event


$(document).on 'page:change', ->
  if window._gaq?
    _gaq.push ['_trackPageview']
  else if window.pageTracker?
    pageTracker._trackPageview()
