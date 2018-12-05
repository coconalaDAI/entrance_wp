
(function ($) {
    "use strict";
    
    if(location.href.match(/sign_in/)){
        var color = '#6cbc2c';
        var colorBack = 'rgba(108, 188, 44, 0.9)';
        changeColor(color, colorBack);
        $('#h-register,#img-register').hide();
        $('#h-login,#img-login').show();
    }
    /*==================================================================
    [ Validate ]*/

    $('.validate-form').on('submit',function(){
        var check = true;
        var input = $(this).find('.validate-input .input100');
        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }
        }

        return check;
    });


    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

    function validate (input) {
        if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        }
        else {
            if($(input).val().trim() == ''){
                return false;
            }
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }
    
    $('#tab-register').on('click', function(){
        var idHSelf = '#h-register';
        var idHTarget = '#h-login';
        var idImgSelf = '#img-register';
        var idImgTarget = '#img-login';
        var color = '#846add';
        var colorBack = 'rgba(132, 106, 221, 0.9)';
        changeColor(color, colorBack);
        changeElements(idHTarget, idHSelf);
        changeElements(idImgTarget, idImgSelf);
    }); 

    $('#tab-login').on('click', function(){
        var idHSelf = '#h-login';
        var idHTarget = '#h-register';
        var idImgSelf = '#img-login';
        var idImgTarget = '#img-register';
        var color = '#6cbc2c';
        var colorBack = 'rgba(108, 188, 44, 0.9)';
        changeColor(color, colorBack);
        changeElements(idHTarget, idHSelf);
        changeElements(idImgTarget, idImgSelf);
    }); 

    function changeColor(color, colorBack) {
        $('.contact100-form-title a').css('background', color);
        $('.container-contact100').css('background', colorBack);
    }

    function changeElements(idTarget, idSelf) {
        $(idTarget).fadeOut(
            200,
            function(){
                $(idTarget).hide();
                $(idSelf).show(
                    0,
                    function() {
                        $(idSelf).fadeIn(200);
                    }
                );
            }
        );
    }

})(jQuery);