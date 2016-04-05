var values;
var i = 2;
$(document).ready(function() {
  $('#participanteRem').hide();

  //Adds a new participant to submit idea form
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

  //Removes a participant from submit idea form
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

  //Fixes nav bar to top after scroll
  $("#nav").affix({
    offset: {
      top: $("#nav").position().top
    }
  });
  var height = $("#nav").position().top;

  //Fix to prevent a small jump after scroll related to nav bar
  $("#nav").on("affix.bs.affix", function() {
    var myElement = document.querySelector("#ideas");
    myElement.style.paddingTop = height + "px";
  });

  //Fix to prevent a small jump after scroll related to nav bar
  $("#nav").on("affix-top.bs.affix", function() {
    var myElement = document.querySelector("#ideas");
    myElement.style.paddingTop = "0px";
  });

  changeAbout();
});

//Makes vertical scroll effect to ideas div
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

//Puts simple text to admin pages (to not be necessary reload page) - manage ideas
function hide_approved_idea(id) {
  document.getElementById('idea' + id).innerHTML = "<h4>Adicionado</h4>";
  document.getElementById('idea' + id).style.color = "green";
}

//Puts simple text to admin pages (to not be neccessary reload page) - manage ideas
function hide_deleted_idea(id) {
  document.getElementById('idea' + id).innerHTML = "<h4>Apagado</h4>";
  document.getElementById('idea' + id).style.color = "red";
}

//Puts simple text to admin pages (to not be neccessary reload page) - top_ideas
function hide_remove_top_idea(id) {
  document.getElementById('idea' + id).innerHTML = "<h4>Removida</h4>";
  document.getElementById('idea' + id).style.color = "red";
  document.getElementById('idea' + id).style.float = "right";
}

//Fucntion to show more button. Adds to a div the text received on funcion
function showMore(id) {
  $('#text' + id).fadeIn();
  $('#showMoreButton' + id).fadeOut();
  $('#showMoreButton' + id).hide();
  $('#showLessButton' + id).fadeIn();
}

//Changes about text when page is in Enghish
function changeAbout() {
  var url = window.location.href;
  if (url.substring(url.length - 2) == "en") {
      $('#about').text('About this page');
      $('#about').attr("href",'/about_en')
  }
}

//Fucntion to show less button. Remeve div with specified ID.
function showLess(id) {
  $('#text' + id).fadeOut();
  $('#text' + id).hide();
  $('#showMoreButton' + id).fadeIn();
  $('#showLessButton' + id).fadeOut();
  $('#showLessButton' + id).hide();
}
