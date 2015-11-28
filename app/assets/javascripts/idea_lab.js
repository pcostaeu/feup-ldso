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

function hide_when_upvote(id) {
  //esconder botoes
  document.getElementById('voteButtons' + id).style.visibility = "hidden";
  //atualizar numero de votos automaticamente
  var upvotes = document.getElementById('upvote' + id).innerHTML;
  upvotes = upvotes.substring(1, upvotes.length);
  upvotes = Number(upvotes);
  upvotes = upvotes + 1;
  document.getElementById('upvote' + id).innerHTML = "+" + upvotes;

}

function hide_when_downvote(id) {
  //esconder botoes
  document.getElementById('voteButtons' + id).style.visibility = "hidden";
  //atualizar numero de votos automaticamente

  var downvotes = document.getElementById('downvote' + id).innerHTML;
  downvotes = downvotes.substring(1, downvotes.length);
  downvotes = Number(downvotes);
  downvotes = downvotes + 1;
  document.getElementById('downvote' + id).innerHTML = "-" + downvotes;


}

function hide_approved_idea(id) {
  alert("Ideia Aprovada ");
  document.getElementById('idea' + id).innerHTML = "<h2>Aprovada</h2>"
  document.getElementById('idea' + id).style.color = "green";

}
