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

    //Topページに文字列を挿入
    $('input, select, textarea').on('change', function(){
        $this = $(this);
        var id = getConfId($this);
        $('#' + id).html($this.val().replace(/\n/g, '<br>'));
    });

    //送信時の判定
    $('.bouton-contact').on('click', function(){
        $('.input-confirm, input, select, textarea').each(function(){
            $(this).toggleClass('border-red', false);
        });

        var empty;
        $('input, select, textarea').each(function(){
            var $this = $(this);
            if ($this.hasClass('form-required') && !$this.val()) {
                $this.toggleClass('border-red', true);
                var id = getConfId($this);
                $('#' + id).toggleClass('border-red', true);
                empty = true;
            }
        });

        $('#sendmessage').hide();
        $('#errormessage').hide();
        if (empty) {
            $('#emptymessage').show();
            smoothscroll();
        } else {
            $('#emptymessage').hide();

            /* ページ遷移なし */
            sendFormData();

            /* ページ遷移あり */
            // $('form').submit();
        }
    });

    //フォームデータの送信
    function sendFormData(){
        disableBtn(true);
        var formData = new FormData();  
        var $form = $('form');
        $form.find('input, select, textarea').each(function(){
            var $this = $(this);
            var value = $this.val();
            if (!value) value = '';
            formData.append($this.attr('name'), value);
        });

        $.ajax({
            url  : $form.attr('action'),
            type : $form.attr('method'),
            data : formData,
            cache       : false,
            contentType : false,
            processData : false,
        })
        .done(function(data, textStatus, jqXHR){

            //通信成功時の処理
            $('#sendmessage').show();
            clearInputs();
            disableBtn(false);
            smoothscroll();
        })
        .fail(function(jqXHR, textStatus, errorThrown){

            //エラー時の処理
            $('#errormessage').show();
            clearInputs();
            disableBtn(false);
            smoothscroll();
        });
    }

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
