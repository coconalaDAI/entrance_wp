$(function(){

    //モーダル表示
    $('.btn-q').on('click', function(event) {
        event.preventDefault();
        var type = $(this).data('type');
        var $consulting = $('#modal-consulting');
        var $wrapping = $('#modal-wrapping');
        type === 'consulting' ? $consulting.show() : $consulting.hide();
        type === 'wrapping' ? $wrapping.show() : $wrapping.hide();
        $('.modal').modal('show');
    })

    //Topページ項目のIDを取得
    function getConfId($element) {
        return $element.attr('id') + '-conf';
    }

    //入力のクリア
    function clearInputs() {
        $('input, select, textarea').each(function(){
            $(this).val('');
        });

        $('.input-confirm').each(function(){
            $(this).html('');
        })
    }

    //送信ボタンを無効化
    function disableBtn(bool) {
        $('.bouton-contact').attr('disabled', bool);
    }

    //スムーズスクロール
    function smoothscroll() {
        var speed = 1000;
        var top = $('form').offset().top;
        $('html, body').animate({ scrollTop: top }, speed);
    }

    //selectタグを初期化
    $('select').prop('selectedIndex', -1);
});
