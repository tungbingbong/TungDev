// 1. Practice Callback

// 1.1 MyMap

/*
Array.prototype.map2 = function (callback) {
  var output = [];
  var courseLength = this.length;

  for (var i = 0; i < courseLength; ++i) {
    var result = callback(this[i], i);
    output.push(result);
  }

  return output;
};

var courses = ["Javascript", "Node JS", "Java"];

var htmls = courses.map2(function (course) {
  return `<h2>${course}</h2>`;
});

*/

// 1.2 MyForEach

/*
var courses = ["Javascript", "Node JS", "Java"];

Array.prototype.forEach2 = function (callback) {
  for (var index in this) {
    if (this.hasOwnProperty(index)) {
      callback(this[index], index, this);
    }
  }
};

var htmls = courses.forEach2(function (course, index, array) {
  console.log(course, index, array);
});

*/

// 1.3 MyFilter
/*
    -Chú ý ở phần này phương thức filter sẽ trả lại tất cả kết quả thoả mãn điều kiện
    -Trong khi với find()sẽ trả về kết quả đầu tiên thoả mãn
*/

/*
Array.prototype.filter2 = function (callback) {
  var output = [];
  for (var index in this) {
    if (this.hasOwnProperty(index)) {
      var result = callback(this[index], index, this);
      if (result) {
        output.push(this[index]);
      }
    }
  }

  return output;
};

var courses = [
  {
    name: "Javascript",
    coin: 700,
  },
  {
    name: "NextJS",
    coin: 900,
  },
  {
    name: "Java",
    coin: 750,
  },
];

var filterCourses = courses.filter2(function (course, index, array) {
  return course.coin > 500;
});

*/

// 1.4 MySome()
/* 
- Nhắc lại 1 chút về 2 hàm some và every thì chúng đều return về kết quả boolean dùng để kiểm tra điều kiện 
- Tuy nhiên phân biệt rõ ràng hàm every() yêu cầu đảm bảo tất cả điều kiện đưa ra phải thoả mãn
- Trong khi hàm some thì chỉ cần 1 trong số các đó thoả mãn điều kiện thì hàm sẽ return true
*/

/* 
Array.prototype.some2 = function (cb) {
  var output = false;
  for (var i in this) {
    if (this.hasOwnProperty(i)) {
      if (cb(this[i], i, this)) {
        output = true;
        break;
      }
    }
  }
  return output;
};

var courses = [
  {
    name: "Javascript",
    coin: 700,
    isFinish: false,
  },
  {
    name: "NextJS",
    coin: 900,
    isFinish: false,
  },
  {
    name: "Java",
    coin: 750,
    isFinish: false,
  },
];

var result = courses.some2(function (course) {
  return course.isFinish;
});

*/

// 1.5 MyEvery()

/*
Array.prototype.every2 = function (callback) {
  var output = true;

  for (var i in this) {
    if (this.hasOwnProperty(i)) {
      var result = callback(this[i], i, this);
      if (!result) {
        output = false;
        break;
      }
    }
  }

  return output;
};

var courses = [
  {
    name: "Javascript",
    coin: 700,
    isFinish: true,
  },
  {
    name: "NextJS",
    coin: 900,
    isFinish: true,
  },
  {
    name: "Java",
    coin: 750,
    isFinish: true,
  },
];

var result = courses.every2(function (course) {
  return course.coin > 800;
});

*/

// 1.6 MyReduce()

/*
VD1: 
Array.prototype.reduce2 = function (cb) {
  var total = 0;
  var courseLength = this.length;

  for (var i = 0; i < courseLength; i++) {
    total = cb(total, this[i]);
  }

  return total;
};

var courses = [1, 2, 3, 4, 5];

var htmls = courses.reduce2(function (accumulator, initial) {
  return accumulator + initial;
});

VD2:
function arrToObj(array) {
  return array.reduce(function (newArr, item) {
    newArr[item[0]] = item[1];
    console.log(item);
    return newArr;
  }, {});
}


var arr = [
  ["name", "Sơn Đặng"],
  ["age", 18],
];

console.log(arrToObj(arr)); 

*/

// 2. Practice DOM

// 2.1 DOM events

/**
var inputValue;

var inputElement = document.querySelector('input[type="text"]');

inputElement.oninput = function (e) {
  inputValue = e.target.value;
};
*/

/**

var inputElement = document.querySelector('input[type="checkbox"]');

inputElement.onchange = function (e) {
  console.log(e.target.checked);
};

*/

/**

var inputElement = document.querySelector("select");

inputElement.onchange = function (e) {
  console.log(e.target.value);
};

*/

/**
var inputElement = document.querySelector('input[type="text"]');

inputElement.onkeyup = function (e) {
  console.log(e.which);

  switch (e.which) {
    case 27:
      console.log("U wanna be exit!");
      break;
  }
};
*/

/**
document.onkeydown = function (e) {
  switch (e.which) {
    case 27:
      console.log("U wanna be exit!");
      break;
    case 13:
      console.log("Send chat");
      break;
  }
};
*/

// 2.2 Prevent Default & Stop Propagation

// 2.2.1 preventDefault()

/*
var linkElements = document.links;

for (var i = 0; i < linkElements.length; ++i) {
  linkElements[i].onclick = function (e) {
    if (!e.target.href.startsWith("https://fullstack.edu.vn/")) {
      e.preventDefault();
    }
  };
}
*/

/*
var ulElement = document.querySelector("ul");

ulElement.onmousedown = function (e) {
  e.preventDefault();
};

ulElement.onclick = function (e) {
  console.log(e.target);
};

*/

// 2.2.2 stopPropagation()

/*
document.querySelector("div").onclick = function () {
  console.log("Hello, Go Go");
};

document.querySelector("button").onclick = function (e) {
  e.stopPropagation();
  console.log("Hello, button click");
};
*/

// 2.3 Event Listener

// 2.3.1 JSON

// 2.3.2 Promise

/*
function hell(value, cb) {
  cb(value);
}

// Không sử dụng Promise dẫn đến tạo ra callback hell :<

hell(1, function (valueFromA) {
  console.log(valueFromA);
  hell(valueFromA + 1, function (valueFromB) {
    hell(valueFromB + 1, function (valueFromC) {
      console.log(valueFromB);
      hell(valueFromC + 1, function (valueFromD) {
        console.log(valueFromC);
        console.log(valueFromD);
        console.log(valueFromD + 1);
      });
    });
  });
});
*/

/*


function notHell(value) {
  return new Promise(function (resolve) {
    resolve(value);
  });
}

notHell(1)
  .then(function (value) {
    return value + 1;
  })
  .then(function (value) {
    return value + 1;
  })
  .then(function (value) {
    return value + 1;
  })
  .then(function (value) {
    console.log(value + 1);
  });

*/

// 2.3.2 Promise Example: Xây dựng fake comment

/*
var users = [
  {
    id: 1,
    name: "Tung",
  },
  {
    id: 2,
    name: "Nam",
  },
  {
    id: 3,
    name: "Huy",
  },
];

var comments = [
  {
    id: 1,
    user_id: 1,
    content: "Mr.Hoang does not upload the newest video?",
  },
  {
    id: 2,
    user_id: 2,
    content: "There's will be released soon",
  },
  {
    id: 3,
    user_id: 3,
    content: "The new course will taken charge, sir?",
  },
  {
    id: 1,
    user_id: 1,
    content:
      "Of course, maybe takes more time for the system to fix and sends to everyone the notification",
  },
];

// Fake API
// B1: Lấy API comments

function getComments() {
  return new Promise(function (resolve) {
    setTimeout(function () {
      resolve(comments);
    }, 1000);
  });
}

// Từ comments so sánh đối chiếu với user_id với id của API user

function getUsersByIds(userIds) {
  return new Promise(function (resolve) {
    var result = users.filter(function (user) {
      return userIds.includes(user.id);
    });
    setTimeout(function () {
      resolve(result);
    }, 1000);
  });
}

getComments()
  .then(function (comments) {
    var userIds = comments.map(function (comment) {
      return comment.user_id;
    });

    return getUsersByIds(userIds).then(function (users) {
      return {
        users: users,
        comments: comments,
      };
    });
  })
  .then(function (data) {
    var commentBlock = document.getElementById("comment-block");
    var html = "";

    data.comments.forEach(function (comment) {
      var user = data.users.find(function (user) {
        return user.id === comment.user_id;
      });
      html += `<li>${user.name}: ${comment.content}</li>`;
    });
    commentBlock.innerHTML = html;
  });

*/

// 2.4 Fetch Example:

/*
Ex1: 

var postApi = "https://jsonplaceholder.typicode.com/posts";

fetch(postApi)
  .then(function (response) {
    return response.json();
  })
  .then(function (posts) {
    var htmls = posts.map(function (post) {
      return `<li>
                            <h2>${post.title}</h2>
                            <p>${post.body}</p>
              </li>`;
    });

    var html = htmls.join("\n");
    document.getElementById("comment-block").innerHTML = html;
  });

*/

/*
Ex2: 

var courseApi = "http://localhost:3000/courses";

fetch(courseApi)
  .then(function (response) {
    return response.json();
  })
  .then(function (course) {
    console.log(course);
  });
*/

var courseApi = "http://localhost:3000/courses";
//get course
function getCourses(callback) {
  fetch(courseApi)
    .then((response) => {
      return response.json();
    })
    .then(callback);
}
function handleCreateCourse(data, callback) {
  var options = {
    method: "POST",
    body: JSON.stringify(data),
  };
  fetch(courseApi, options)
    .then((response) => {
      response.json();
    })
    .then(callback);
}
//delete course
function handleDeleteCourse(id) {
  var options = {
    method: "DELETE",
  };
  fetch(courseApi + "/" + id, options)
    .then((response) => {
      response.json();
    })
    .then(function () {
      var courseItem = document.querySelector(".course-id-" + id);
      if (courseItem) {
        courseItem.remove();
      }
    });
}
//update course
function handleUpdateCourse(data, id, callback) {
  var options = {
    method: "PUT",
    body: JSON.stringify(data),
  };
  fetch(courseApi + "/" + id, options)
    .then((response) => {
      return response.json();
    })
    .then(callback);
}
//change-edit course
function handleEditCourse(id, name, description) {
  document.querySelector('input[name="name"]').value = name;
  document.querySelector('input[name="description"]').value = description;
  document.querySelector("#create").style.display = "none";
  document.querySelector("#update").style.display = "inline";
  document.querySelector("#cancel").style.display = "inline";
  document.querySelector("#update").setAttribute("data-id", id);
}
//render course
function renderCourses(courses) {
  var listCourseBlock = document.querySelector("#list-courses");
  var htmls = courses.map((course) => {
    return `<li class="course-id-${course.id}">
                    <h4>${course.name}</h4>
                    <p>${course.description}</p>
                    <button onclick="handleDeleteCourse('${course.id}')">Delete</button>
                    <button onclick="handleEditCourse('${course.id}', '${course.name}', '${course.description}')">Change</button>
                </li>`;
  });
  listCourseBlock.innerHTML = htmls.join("");
}
//CRUD form
function createForm() {
  var createBtn = document.querySelector("#create");
  var updateBtn = document.querySelector("#update");
  var cancelBtn = document.querySelector("#cancel");
  updateBtn.style.display = "none";
  cancelBtn.style.display = "none";
  createBtn.onclick = function () {
    var name = document.querySelector('input[name="name"]').value;
    var description = document.querySelector('input[name="description"]').value;
    var formData = {
      name: name,
      description: description,
    };
    handleCreateCourse(formData, function () {
      getCourses(renderCourses);
    });
  };
  updateBtn.onclick = function () {
    var name = document.querySelector('input[name="name"]').value;
    var description = document.querySelector('input[name="description"]').value;
    var idCourse = document.querySelector("#update").getAttribute("data-id");
    handleUpdateCourse({ name, description }, idCourse, function () {
      getCourses(renderCourses);
      updateBtn.style.display = "none";
      cancelBtn.style.display = "none";
      createBtn.style.display = "inline";
    });
  };
  cancelBtn.onclick = function () {
    updateBtn.style.display = "none";
    cancelBtn.style.display = "none";
    createBtn.style.display = "inline";
  };
}
function start() {
  getCourses(renderCourses);
  createForm();
}
start();
