# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.set_listeners = ->
  console.log "listeners set"
  $("#order_quantity").on "change", ->
    console.log "change"
    update_price()

  $("#refresh_price").on "click", ->
    console.log "clk rfrsh prc"
    update_price()

  $("#order_quantity").on "keyup", ->
    console.log "keyup"
    update_price()

update_price = ->
  console.log "funct"
  quantity = $("#order_quantity").val()
  if quantity < 25
    quantity_x_price = (8.95 * $("#order_quantity").val())
  else
    quantity_x_price = (6.00 * $("#order_quantity").val())
  $("#quantity_x_price").html '$' + quantity_x_price.toFixed(2)
