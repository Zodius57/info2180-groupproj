$(document).ready(function(){
    $("form").submit(function(event) {
        event.preventDefault();
    });

    $(".login-btn").click(function(event) {
        event.preventDefault();

        const email = $('#email').val();
        const password = $('#password').val();

        $.ajax({url: "http://localhost/info2180-groupproj/login-page/index.php",type: "POST",data: {email: email, password:password}})
        .done(function(result) {
            console.log("pressed");
            if(result == email){
                window.location.href = "http://localhost/info2180-groupproj/dashboard/dashboard.html";
            }else{
                alert("There is an issue with the email or password");
            }
        })
        .fail(function() {
            alert("There seems to be an error.");
        });
    });
});