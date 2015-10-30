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
  myElement.style.paddingTop ="0px";
});
});

function startCounters () {
	values = counters();

	$('.counter1').counter({initial: values[0], clockNum: 0});
	$('.counter2').counter({initial: values[1], clockNum: 1});
	$('.counter3').counter({initial: values[2], clockNum: 2});
}

function counters() {
	var datainicio = new Date(2015, 0, 1, 0, 0, 0, 0);
	var datafim = new Date();
	var tempo = Math.floor((datafim - datainicio) / 1000);

	var electricidade_consumo = (0.215 * tempo).toFixed(2);
	var agua_consumo = (0.001367 * tempo).toFixed(2);
	var papel_consumo = Math.floor(0.12 * tempo);

	var values = new Object();
	values[0] = Math.round(electricidade_consumo);
	values[1] = Math.round(agua_consumo);
	values[2] = Math.round(papel_consumo);

	return values;
}

$(function() {
  $('#click').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: ($("#submitIdea").position().top - 140)
        }, 1000);
        return false;
      }
    }
  });
});
