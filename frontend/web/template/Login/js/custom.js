$(document).ready(function() {
    $('.tooltip').tooltipster({
        theme: 'tooltipster-punk',
        contentCloning: true,
        contentAsHTML: true,
        interactive: true
    });

$.validator.addMethod(
            "regex",
            function(value, element, regexp) 
            {
                if (regexp.constructor != RegExp)
                    regexp = new RegExp(regexp);
                else if (regexp.global)
                    regexp.lastIndex = 0;
                return this.optional(element) || regexp.test(value);
            },
            "Please check your input."
    );

    $('#form-login').validate({
        errorElement: "span",
        ////GỬi dữ liệu khi đã true////

        submitHandler: function(form) {
            $("#loading").removeAttr('style');
            var type_login = $('#type_login').val();
            var email = $('#email').val();
            var password = $('#password').val();
            $.post("Ajax/Login/", {
                type_login: type_login,
                email: email,
                password: password
            }).done(function(data) {
                $("#thongbao").empty();
                $("#thongbao").show();
                $("#thongbao").append(data);
                $("#loading").css('display', 'none');

            });
        }
    });

    $('#form-register').validate({
        rules: {
                subdomain: {
                    regex: /^[A-Za-z0-9_]{2,30}$/,
                },
                confirm_password: {
                    equalTo: "#password"
                }
            },
            messages: {
                subdomain: {
                    regex: "Chỉ được gồm chữ và số"
                },
                confirm_password: {
                    equalTo: "Mật khẩu không khớp"
                }
            },
        errorElement: "span",
        ////GỬi dữ liệu khi đã true////

        submitHandler: function(form) {
            $("#loading").removeAttr('style');
            var subdomain = $('#subdomain').val();
            var shopname = $('#shopname').val();
            var email = $('#email').val();
            var telephone = $('#telephone').val();
            var address = $('#address').val();
            var password = $('#password').val();
            var confirm_password = $('#confirm_password').val();

            $.post("Ajax/Register/", {
                subdomain: subdomain,
                shopname: shopname,
                email: email,
                telephone: telephone,
                address: address,
                password: password,
                confirm_password: confirm_password
            }).done(function(data) {
                $("#thongbao").empty();
                $("#thongbao").show();
                $("#thongbao").append(data);
                $("#loading").css('display', 'none');

            });
        }
    });

    var height = $(window).height();
    $('form#form-login').css({
        "height": height + "px"
    });


    $("#admin").click(function() {
        $(this).addClass('active');
        $("#mod").removeClass('active');
        $('#type_login').val('');
        $('#type_login').val('1');
    });
    $("#mod").click(function() {
        $(this).addClass('active');
        $("#admin").removeClass('active');
        $('#type_login').val('');
        $('#type_login').val('2');
    });

});