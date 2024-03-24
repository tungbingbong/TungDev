function showPassword() {
    var password = document.getElementById('password');
    var eye = document.getElementById('eye');
    if (password.type === 'password') {
        password.type = "text";
        eye.classList.remove('fa-eye-slash');
        eye.classList.add('fa-eye');
    }
    else {
        password.type = "password";
        eye.classList.remove('fa-eye');
        eye.classList.add('fa-eye-slash');
    }
}

function login() {
    var loginButton = document.getElementById('login-button');
    var user = document.getElementById('email').value;
    var pass = password.value;
    if (user == 'hiashraful@gmail.com' && pass == 'password') {
        loginButton.setAttribute('href', 'main.html');
    }
    else {
        alert('Wrong username or password! Try Again!');
    }
}

function deposit() {
    var balance = parseInt(document.getElementById('balance-amount').innerHTML);
    var depositAmount = parseInt(document.getElementById('deposit-input').value);
    var currentDeposit = parseInt(document.getElementById('deposit-amount').innerHTML);
    if (depositAmount < 10 || isNaN(depositAmount)) {
        alert("Minimum deposit amount is $10");
    }
    else {
        document.getElementById('deposit-amount').innerHTML = currentDeposit + depositAmount;
        document.getElementById('balance-amount').innerHTML = balance + depositAmount;
        document.getElementById('deposit-input').value = "";
    }
}

function withdraw() {
    var balance = parseInt(document.getElementById('balance-amount').innerHTML);
    var withdrawAmount = parseInt(document.getElementById('withdraw-input').value);
    var currentWithdraw = parseInt(document.getElementById('withdraw-amount').innerHTML);
    if (balance <= 0 || withdrawAmount > balance) {
        alert("Insufficient Balance");
    }
    else if (withdrawAmount < 10 || isNaN(withdrawAmount)) {
        alert("Minimum withdraw amount is $10");
    }
    else {
        document.getElementById('withdraw-amount').innerHTML = currentWithdraw + withdrawAmount;
        document.getElementById('balance-amount').innerHTML = balance - withdrawAmount;
        document.getElementById('withdraw-input').value = "";
    }
}