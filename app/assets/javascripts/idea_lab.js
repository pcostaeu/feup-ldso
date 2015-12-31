var values;
var i = 2;
$(document).ready(function() {
  $('#participanteRem').fadeOut();

  $('#participante').click(function() {

    if (i < 4) {
      $('#participantesForm').append("<div id=\"p_" + i + "\">" + "<div class=\"form-group col-lg-6\"> " + "<label for=\"idea_author" + i + "\">Nome</label>" + " <input class=\"form-control\" type=\"text\" name=\"idea[author" + i + "]\" id=\"idea_author" + i + "\">" + "</div>" + " <div class=\"form-group col-lg-6\">" + " <label for=\"idea_email" + i + "\">Email</label>" + "  <input class=\"form-control\" type=\"text\" name=\"idea[email" + i + "]\" id=\"idea_email" + i + "\">" + " </div>" + "</div>");
      i++;
      $('#participanteRem').fadeIn();
    }
    if (i == 4) {
      $('#participante').fadeOut();
    }
  });

  $('#participanteRem').click(function() {
    if (i > 2) {
      i--;
      $("#p_" + i + "").remove();
    }
    if (i < 4)
      $('#participante').fadeIn();
    if (i == 2) {
      $('#participanteRem').fadeOut();
    }

  });

  $("#nav").affix({
    offset: {
      top: $("#nav").position().top
    }
  });
  var height = $("#nav").position().top;

  $("#nav").on("affix.bs.affix", function() {
    var myElement = document.querySelector("#ideas");
    myElement.style.paddingTop = height + "px";
  });

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
          scrollTop: ($("#submitIdea").position().top - 80)
        }, 1000);
        return false;
      }
    }
  });
});

function hide_approved_idea(id) {
  document.getElementById('idea' + id).innerHTML = "<h4>Adicionado</h4>";
  document.getElementById('idea' + id).style.color = "green";
}

function hide_deleted_idea(id) {
  document.getElementById('idea' + id).innerHTML = "<h4>Apagado</h4>";
  document.getElementById('idea' + id).style.color = "red";
}

function hide_remove_top_idea(id) {
  document.getElementById('idea' + id).innerHTML = "<h4>Removida</h4>";
  document.getElementById('idea' + id).style.color = "red";
  document.getElementById('idea' + id).style.float = "right";
}

function showMore(id, text) {
  var url = window.location.href;
  if (url.substring(url.length - 2) != "en")
    $('#text' + id).append("<h4>Descrição</h4><p>" + text + "</p>");
  else
    $('#text' + id).append("<h4>Description</h4><p>" + text + "</p>");
  $('#showMoreButton' + id).fadeOut();
  $('#showMoreButton' + id).hide();
  $('#showLessButton' + id).fadeIn();
}

function showLess(id) {
  $('#text' + id).empty();
  $('#showMoreButton' + id).fadeIn();
  $('#showLessButton' + id).fadeOut();
  $('#showLessButton' + id).hide();
}
