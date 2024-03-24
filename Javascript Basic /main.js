// DOM style 
var boxElement = document.querySelector(".box");
console.log(boxElement.style);
//Dom events
var butE = document.querySelector('button');
butE.onclick = (e) => {
    console.log(this);
    this.style.color = '#fff'
}

var inputElement = document.querySelector('input[type ="text"]');
var input1Element = document.querySelector('input[type ="checkbox"]');
var selectElement = document.querySelector('select');

// inputElement.onchange = (e) => {
//     console.log(e.target.value);
// }
inputElement.onkeyup = (e) => {
    console.log(e.which);
}


input1Element.onchange = (e) => {
    console.log(e.target.checked);
}

selectElement.onchange = (e) => {
    console.log(e.target.value);
}

document.onkeydown = (e) => {
    switch (e.which) {
        case 27:
            console.log('EXIT');
            break;
        case 13:
            console.log('SEND CHAT');
            break;
    }
}

//Prevent Default and Stop Propagation
var aELements = document.links;
for (var i = 0; i < aELements.length; ++i) {
    aELements[i].onclick = (e) => {
        if (!e.target.href.startsWith('http://f8.edu.vn')) {
            e.preventDefault();
        }
    }
}

var ulElements = document.querySelector('ul');
ulElements.onmousedown = (e) => {
        e.preventDefault();
    }
    //Stop Propagation
document.querySelector(".Prop").onclick = () => {
    console.log('DIV');
}

var buttonElement = document.querySelector('.btnProp');
buttonElement.onclick = (e) => {
    e.stopPropagation();
    console.log('Click Me');
}

// Event Listener
var btn = document.getElementById('btn');

function click(e) {
    e.stopPropagation();
    console.log('CLICK ME PLS:))')
}

btn.addEventListener('click', click);

//test tí JSON cho nhớ nhỉ;)0
var info = {
    name: 'Tran Tien Tung',
    age: 21,
    address: 'Nam Dinh',
    university: 'HANU'
}

var object = JSON.stringify(info);
console.log(object);

//Promise concept 
var promise = new Promise(
    //Executor
    function(resolve, reject) {
        //Logic
        //When promise success: resolve()
        //When promise failed: reject()
        //Noted: Should be existed at least one of 2 function above, if not => memory leaked
        //Fake call API
        resolve([{
            id: 1,
            name: 'Javascript'
        }])
        reject('Co loi')
    }
);

//Promise has 3 status: 
//1. Pending promise
//2. Fulfilled promise
//3. Reject promise

promise
    .then(function(courses) {
        console.log(courses);
    })
    .catch(function(error) {
        console.log(error);
    })
    .finally(function() {
        console.log('Done !!!');
    })

//Example about promise to deal with callback hell
function sleep(ms) {
    return new Promise(
        function(resolve) {
            setTimeout(resolve, ms);
        })
}

sleep(1000)
    .then(function() {
        console.log('I')
        return sleep(1000);
    })
    .then(function() {
        console.log('love')
        return sleep(1000);
    })
    .then(function() {
        console.log('you');
    })
var promise3 = Promise.resolve('success');
//Promise.resolve
promise3.then(function(success) {
        console.log('success: ' + success);
    })
    //Promise.reject
promise3.then(function(error) {
        console.log('error: ' + error);
    })
    //Promise all
var promise1 = new Promise(
    function(resolve) {
        setTimeout(function() {
            resolve([1]);
        }, 1000)
    })

var promise2 = new Promise(
    function(resolve) {
        setTimeout(function() {
            resolve([2, 3]);
        }, 2000)
    })
Promise.all([promise1, promise2])
    .then(function([result1, result2]) {
        console.log(result1.concat(result2))
    });
//Promise Example 
var users = [{
        id: 1,
        name: 'Tung KeslyKomen',
    },
    {
        id: 2,
        name: 'Hanh Milo',
    },
    {
        id: 3,
        name: 'Hoang Kevin',
    },
];

var comments = [{
        id: 1,
        user_id: 1,
        content: 'Ban co yeu to khong ???',
    },
    {
        id: 2,
        user_id: 2,
        content: 'Yeu la yeu the nao ban oi:))',
    },
];

//1. Lấy comments
//2. Từ comments lấy ra user_id tương ứng
//3. Từ User_id lấy ra user
//Fake API
function getComments() {
    return new Promise(function(resolve) {
        setTimeout(function() {
            resolve(comments);
        }, 1000);
    });
}

//1.lọc filter = users via fake api users cho trước sau đó đối chiếu với user_id trên comments
function getUsersByIds(userIds) {
    return new Promise(function(resolve) {
        var result = users.filter(function(user) {
            return userIds.includes(user.id);
        });
        setTimeout(function() {
            resolve(result);
        }, 1000);
    })
}

//2. Lấy ra comments lọc via map array để lấy user_id tổng hợp lại trong userIds
getComments()
    .then(function(comments) {
        var userIds = comments.map(function(comment) {
            return comment.user_id;
        });

        return getUsersByIds(userIds)
            .then(function(users) {
                return {
                    users: users,
                    comments: comments,
                }
            })
    })
    .then(function(data) {
        var commentBlock = document.getElementById('comment-block');

        var html = '';
        data.comments.forEach(function(comment) {
            var user = data.users.find(function(user) {
                return user.id === comment.user_id;
            });
            html += `${user.name} ${comment.content}`;
        });
        commentBlock.innerHTML = html;
    });

//Example of fetch
var postApi = 'https://jsonplaceholder.typicode.com/posts';

//stream from API to JSON
fetch(postApi)
    .then(function(response) {
        return response.json();
        //JSON.parse: JSON-> JS types
    })
    .then(function(posts) {
        var htmls = posts.map(function(post) {
            return `<li>
            <h2>${post.title}</h2>
            <p>${post.body}</p>
            </li>`;
        });
        var html = htmls.join('');
        document.getElementById('post-block').innerHTML = html;
    })
    .catch(function(err) {
        alert('Something wrong @@@')
    })

import logger from './logger/index.js';
import * as constants from './constants.js';

console.log(constants);
// logger('Test message ', 'warn');