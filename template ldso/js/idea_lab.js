var values;

$(document).ready(function() {
	values = counters();

	$('.counter1').counter({initial: values[0], clockNum: 0});
	$('.counter2').counter({initial: values[1], clockNum: 1});
	$('.counter3').counter({initial: values[2], clockNum: 2});
	
	$('#nav').affix({
		offset: {
			top: 120
		}
	});         
});

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

