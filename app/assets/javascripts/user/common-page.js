// JavaScript Document
$(document).ready(function(){
    $(".menu-icon").click(function(){
        $("ul").toggle();
    });
});

$(function() {
      $('select, .select').selectric();

      $('.customOptions').selectric({
        optionsItemBuilder: function(itemData, element, index) {
          return element.val().length ? '<span class="ico ico-' + element.val() +  '"></span>' + itemData.text : itemData.text;
        }
      });

      $('.customLabel').selectric({
        labelBuilder: function(currItem) {
          return '<strong><em>' + currItem.text + '</em></strong>';
        }
      });
    });