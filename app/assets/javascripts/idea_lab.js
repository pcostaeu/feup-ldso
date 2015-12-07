var values;

$(document).ready(function() {
  $("#nav").affix({
    offset: {
      top: $("#nav").position().top
    }
  });
  var height = $("#nav").position().top;
  // add padding element above is affixed
  $("#nav").on("affix.bs.affix", function() {
    //$("#teste").addClass("padded");
    var myElement = document.querySelector("#ideas");
    myElement.style.paddingTop = height + "px";
  });

  // and remove again when unaffixed
  $("#nav").on("affix-top.bs.affix", function() {
    var myElement = document.querySelector("#ideas");
    myElement.style.paddingTop = "0px";
  });
});

$(function() {
  $('#click').click(function() {
    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: ($("#submitIdea").position().top - 140)
        }, 1000);
        return false;
      }
    }
  });
});

function hide_approved_idea(id) {
  document.getElementById('idea' + id).innerHTML = "<h4>Adicionado</h4>"
  document.getElementById('idea' + id).style.color = "green";
}

function hide_deleted_idea(id) {
  document.getElementById('idea' + id).innerHTML = "<h4>Apagado</h4>"
  document.getElementById('idea' + id).style.color = "red";
}
