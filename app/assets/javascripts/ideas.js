function start(){      
$('#participante').click(function () {
    for (i = 2; i < 4; i++)     
        if($("#p_"+i+"").length == 0) 
        { 
        $('#participantesForm').append("<div id=\"p_"+i+"\">" 
        +"<div class=\"form-group col-lg-6\"> "
        +"<label for=\"idea_author"+i+"\">Nome</label>"
        +" <input class=\"form-control\" type=\"text\" name=\"idea[author"+i+"]\" id=\"idea_author"+i+"\">"
        +"</div>"
        +" <div class=\"form-group col-lg-6\">"
        +" <label for=\"idea_email"+i+"\">Email</label>"
        +"  <input class=\"form-control\" type=\"text\" name=\"idea[email"+i+"]\" id=\"idea_email"+i+"\">"
        +" </div>" 
        +"</div>");   
        return;
        }   
});
    $('#participanteRem').click(function () {  
        for (i = 3; i >=2; i--)  
        if($("#p_"+i+"").length == 1) {
             $("#p_"+i+"").remove();
            return;
        }     
});
};
$(start);
        
       