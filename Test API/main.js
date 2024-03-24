// //Promise Example 
// var users = [{
//         id: 1,
//         name: 'Tung KeslyKomen',
//     },
//     {
//         id: 2,
//         name: 'Hanh Milo',
//     },
//     {
//         id: 3,
//         name: 'Hoang Kevin',
//     },
// ];

// var comments = [{
//         id: 1,
//         user_id: 1,
//         content: 'Ban co yeu to khong ???',
//     },
//     {
//         id: 2,
//         user_id: 2,
//         content: 'Yeu la yeu the nao ban oi:))',
//     },
//     {
//         id: 3,
//         user_id: 3,
//         content: 'Cac ban bi dien ak:(',
//     },
// ];

// //1. Lấy comments
// //2. Từ comments lấy ra user_id tương ứng
// //3. Từ User_id lấy ra user
// //Fake API
// function getComments() {
//     return new Promise(function(resolve) {
//         setTimeout(function() {
//             resolve(comments);
//         }, 1000);
//     });
// }

// //1.lọc filter = users via fake api users cho trước sau đó đối chiếu với user_id trên comments
// function getUsersByIds(userIds) {
//     return new Promise(function(resolve) {
//         var result = users.filter(function(user) {
//             return userIds.includes(user.id);
//         });
//         setTimeout(function() {
//             resolve(result);
//         }, 1000);
//     })
// }

// //2. Lấy ra comments lọc via map array để lấy user_id tổng hợp lại trong userIds
// getComments()
//     .then(function(comments) {
//         var userIds = comments.map(function(comment) {
//             return comment.user_id;
//         });

//         return getUsersByIds(userIds)
//             .then(function(users) {
//                 return {
//                     users: users,
//                     comments: comments,
//                 }
//             })
//     })
//     .then(function(data) {
//         var commentBlock = document.getElementById('comment-block');

//         var html = '';
//         data.comments.forEach(function(comment) {
//             var user = data.users.find(function(user) {
//                 return user.id === comment.user_id;
//             });
//             html += `<li>${user.name}: ${comment.content}</li>`;
//         });
//         commentBlock.innerHTML = html;
//     });

// //Example of fetch
// var postApi = 


// //stream from API to JSON
// fetch(postApi)
//     .then(function(response) {
//         return response.json();
//         //JSON.parse: JSON-> JS types
//     })
//     .then(function(posts) {
//         var htmls = posts.map(function(post) {
//             return `<li>
//             <h2>${post.title}</h2>
//             <p>${post.body}</p>
//             </li>`;
//         });
//         var html = htmls.join('');
//         document.getElementById('post-block').innerHTML = html;
//     })
//     .catch(function(err) {
//         alert('Something wrong @@@')
//     })


//Example courses
var courseApi = 'http://localhost:3000/Coding';

function start() {
    getCourse(renderCourse);

    handleCreateForm();
}

start();

//Function get courses then render to view
function getCourse(callback) {
    fetch(courseApi)
        .then(function(response) {
            return response.json();
        })
        .then(callback);
}

//Function create course to receive data from server
function createCourse(data, callback) {
    var options = {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
    };
    fetch(courseApi, options)
        .then(function(response) {
            return response.json();
        })
        .then(callback);
}

function handleDeleteCourse(id) {
    var options = {
        method: 'DELETE',
        headers: { 'Content-Type': 'application/json' },

    };
    fetch(courseApi + '/' + id, options)
        .then(function(response) {
            response.json();
        })
        .then(function() {
            var courseItem = document.querySelector('.course-item-' + id);
            if (courseItem) {
                courseItem.remove();
            }
        });
}

//Function render course to deal html to push
function renderCourse(courses) {
    var listCourseBlock = document.getElementById('courses-list');

    var htmls = courses.map(function(course) {
        return `
               <li class="course-item-${course.id}">
                     <h4>${course.name}</h4>
                     <p>${course.description}</p>
                     <button onclick="handleDeleteCourse(${course.id})">Delete</button>
                     <button onclick="handleUpdateCourse(${course.id})">Update</button>
               </li>
        `;
    });

    listCourseBlock.innerHTML = htmls.join('');
}

//this function to handle create new course
function handleCreateForm() {
    var createBtn = document.querySelector('#create');

    createBtn.onclick = function() {
        var idCourse = document.querySelector('input[name="id"]').value;
        var name = document.querySelector('input[name="name"]').value;
        var description = document.querySelector('input[name="description"]').value;

        var formData = {
            id: idCourse,
            name: name,
            description: description
        };

        createCourse(formData, function() {
            getCourse(renderCourse);
        });
    }
}

//Function handle Update course after that, return save button to render course data
function handleUpdateCourse(id, data) {
    var options = {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data),
    }
    fetch(courseApi + '/' + id, options)
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            console.log("Edited Successfully");
        })
        .catch(function(err) {
            alert('Something went wrong @*@');
        });
};

function handleUpdateCourseEvent(id) {
    var saveBtn = document.querySelector('#create')
    var courseItem = document.querySelector('.course-item-' + id)
    var name = document.querySelector('input[name="name"]').innerHTML;
    var description = document.querySelector('input[name="description"]').innerHTML;
    saveBtn.innerHTML = 'Save'



    document.querySelector('input[name="name"]').value = name;
    document.querySelector('input[name="description"]').value = description;
    saveBtn.onclick = function() {
        var nameEdited = document.querySelector('input[name="name"]').value;
        var descEdited = document.querySelector('input[name="description"]').value;


        var formData = {
            name: nameEdited,
            description: descEdited
        };

        //Request Method: PUT
        handleUpdateCourse(id, data);

        //Re-render
        courseItem.querySelector('input[name="name"]').innerHTML = data.name;
        courseItem.querySelector('input[name="description"]').innerHTML = data.description;

        //Clear Inputs Properties
        var inputEle = document.createElementAll('input');
        inputEle.forEach(function(input) {
            input.value = '';
        })

        saveBtn.innerHTML = 'Create'
    }



}