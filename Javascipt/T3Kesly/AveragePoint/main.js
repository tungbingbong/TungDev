usersApi = 'http://localhost:3000/users';
var cnt = 1;
function start() {
    getUsers(renderUsers);
    handleCreateForm();
    handleDeleteUser();
}

start();

// function

function getUsers(callback) {
    fetch(usersApi)
        .then((response) => {
            return response.json()
        })
        .then(callback);
}

function handleCreateUser(dataForm) {
    options = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(dataForm)
    }
    fetch(usersApi, options)
        .then((response) => {
            return response.json()
        })
        .then(() => {
            getUsers(renderUsers);
        });
}

function handleCreateForm() {
    var createBtn = document.getElementById('create-btn');
    createBtn.onclick = () => {
        var dataForm = getDataForm();
        if (dataForm.name === '') {
            alert('Mời bạn nhập họ và tên');
        } else
            handleCreateUser(dataForm);
        resetInput('name');
        resetInput('math');
        resetInput('physics');
        resetInput('chemistry');

    }
}

function deleteUser(userId) {
    options = {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json'
        },
    }
    fetch(usersApi + '/' + userId, options)
        .then((response) => {
            return response.json()
        })
        .then(function () {
            getUsers(renderUsers)
        });
}

function handleDeleteUser() {
    var inputDelete = document.getElementById('input-delete');
    var deleteBtn = document.getElementById('delete-btn');

    deleteBtn.onclick = () => {
        var sttUser = +inputDelete.value + 1;
        if (sttUser > 1) {
            var user = document.querySelector(`#table-average tr:nth-child(${sttUser})`);
            var userId = user.classList.value.split('-')[2]; // get id from user class list
            console.log(userId);

            resetInput('input-delete');

            deleteUser(userId);
        }
    }
}

function renderUsers(users) {
    var tableAverage = document.getElementById('table-average');
    var htmls = `<tr>
            <th>STT</th>
            <th>Họ và tên</th>
            <th>Toán</th>
            <th>Lý</th>
            <th>Hóa</th>
            <th>Điểm trung bình</th>
        </tr>`;
    users.forEach((user, index) => {
        htmls += `<tr class="user-id-${user.id}">
        <th>${index + 1}</th>
        <th>${user.name}</th>
        <th>${user.math}</th>
        <th>${user.physics}</th>
        <th>${user.chemistry}</th>
        <th>${user.averagePoint}</th>
    </tr>`
    });

    tableAverage.innerHTML = htmls;

}

function getDataForm() {
    var name = document.getElementById('name').value;
    var math = +document.getElementById('math').value;
    var physics = +document.getElementById('physics').value;
    var chemistry = +document.getElementById('chemistry').value;
    var averagePoint = ((math + physics + chemistry) / 3).toFixed(2);

    return {
        name: name,
        math: math,
        physics: physics,
        chemistry: chemistry,
        averagePoint: averagePoint,
    }

}

function resetInput(inputId) {
    var input = document.getElementById(inputId);
    input.value = '';

}