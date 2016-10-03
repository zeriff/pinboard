$ ->
    $('#pins').imagesLoaded ->
      $('#pins').masonry
        itemSelector: '.box'
        isFitWidth: true
        
    #Global binding for link_to tag ajax
    $('a[data-remote]').bind('ajax:success', (evt, data, status, xhr) ->
      ).bind 'ajax:error', (evt, data, status, xhr) ->
        toastr.error data.responseText

    #Global binding for form ajax
    $('form[data-remote]').bind('ajax:success', (evt, data, status, xhr) ->
      ).bind 'ajax:error', (evt, data, status, xhr) ->
        toastr.error data.responseText


    $('.dropdown').dropdown
      transition: 'vertical flip'

     $('#showpinurlbtn').bind 'click', ->
       $('.pinform').show()
       $('.newform').hide()
       $('#showpinurlbtn').hide()

      $('#cancelpinurl').bind 'click', ->
        $('.pinform').hide()
        $('.newform').show()
        $('#showpinurlbtn').show()
