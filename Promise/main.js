var users = [{
        id: 1,
        name: 'Rambo'
    },
    {
        id: 2,
        name: 'ButCaoLanh'
    },
    {
        id: 3,
        name: 'Huyen2K4'
    }
];

var comments = [{
        id: 1,
        user_id: 1,
        content: 'Còn yêu Huyền không bụt ơi'
    },
    {
        id: 2,
        user_id: 2,
        content: 'Aisss,liên quan hông mày'
    },
    {
        id: 3,
        user_id: 3,
        content: 'Lam gi co dau troi ai anh khoa di hoai'
    }
];

//B1: Get comments
//B2: From comments, get user_id
//B3: From user_id, get Id 

//Fake API
function getComments() {
    return new Promise(function(resolve) {
        setTimeout(function() {
            resolve(comments)
        }, 1000);
    });
}

function getUsersByIds(userIds) {
    return new Promise(function(resolve) {
        var result = users.filter(function(user) {
            return userIds.includes(user.id)
        });
        setTimeout(function() {
            resolve(result);
        }, 1000)
    });
}

getComments()
    .then(function(comments) {
        var userIds = comments.map(function(comment) {
            return comment.user_id;
        });
        return getUsersByIds(userIds)
            .then(function(users) {
                return {
                    users: users,
                    comments: comments
                };
            });
    })
    .then(function(data) {
        var commentBlock = document.getElementById('comment-block');
        var html = '';
        data.comments.forEach(function(comment) {
            var user = data.users.find(function(user) {
                return user.id === comment.user_id;
            });
            html += `<li>${user.name} : ${comment.content}</li>`
        });

        commentBlock.innerHTML = html;
    });