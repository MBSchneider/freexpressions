# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
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
  quantity_x_price = (8.95 * $("#order_quantity").val())
  $("#quantity_x_price").html '$' + quantity_x_price.toFixed(2)
  total_price = parseFloat($("#shipping_price").html().split("$")[1])\
                + quantity_x_price
  $("#total_price").html('$' + total_price.toFixed(2))
