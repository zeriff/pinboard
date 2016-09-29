$ ->
  $('.ui.sidebar').sidebar
    context:  $('.bottom.segment')
  .sidebar('attach events', '.menu .item')

  $('#pins').imagesLoaded ->
    $('#pins').masonry
      itemSelector: '.box'
      isFitWidth: true

   $('#showpinurlbtn').bind 'click', ->
     $('.pinform').show()
     $('.newform').hide()
     $('#showpinurlbtn').hide()

    $('#cancelpinurl').bind 'click', ->
      $('.pinform').hide()
      $('.newform').show()
      $('#showpinurlbtn').show()

# $("#hide").click(function(){
#     $("p").hide();
# });
#
# $("#show").click(function(){
#     $("p").show();
# });
