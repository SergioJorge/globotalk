var textarea = $('#talk_mais_sobre');
var maxLenght = 140;
var contador = $('.counter_sobre');

textarea.bind('keyup', function(event) {
    contador.html(textarea.val().length);
    if(textarea.val().length > maxLenght){
        textarea.css("border-color", "#FF0000");
    }
    else{
        textarea.css("border-color", "#CCC");
    }
});