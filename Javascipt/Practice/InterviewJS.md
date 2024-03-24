2. Promise
   Question: Khái niệm về Promise?

-> Promise chính là khái niệm được sinh ra để xử lý các thao tác bất đồng bộ, trước khi có promise chúng ta thường sử dụng callback, callback xảy ra vấn đề callback hell (trường hợp code phức tạp khi lạm dụng quá đà callback functions lồng nhau), Promise sinh ra để giải quyết vấn đề này
-> Để tạo ra 1 promise chúng ta sẽ khởi tạo nó với từ khoá: new với Promise, trong Promise() chúng ta sẽ sử dụng executer function, trong executer function chúng ta sẽ nhận vào 2 tham số dạng hàm (resolve, reject), resolve được gọi khi xử lý thao tác thành công, reject được gọi khi xử lý thao tác thất bại
-> Khi sử dụng promise, cta sử dụng qua phương thức then (resolve) hoặc catch(reject) - đều nhận callback functions
