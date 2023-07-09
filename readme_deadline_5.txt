- Here are the 5 embedded sql queries used :-

1.

def query1():
    pincode = request.form['pincode']
    
    op = "No"

    mycursor = mydb.cursor()
    mycursor.execute("SELECT seller_name FROM Seller WHERE s_pincode = " + str(pincode) + "")
    myresult = mycursor.fetchall()
    for x in myresult:
        if x == pincode:
            op = "Yes"
    
    result = "Is the {} pincode servicable : {}".format(pincode,op)
    return result

2.

def query2():
    min_price = request.form['min_price']
    max_price = request.form['max_price']
    
    check = 0
    output = ()
    mycursor = mydb.cursor()
    mycursor.execute("SELECT p_name FROM Product WHERE p_cost BETWEEN " + str(min_price) + " AND " + str(max_price) + "")
    myresult = mycursor.fetchall()
    for x in myresult:
        check = 1
        output += x

    if check == 0:
        output = "No products found in this price range"

    result = "List of Products in the price range {} to {} : {}".format(min_price,max_price,output)
    return result

3.

def query3():
    username = request.form['username']

    output = ()
    check = 0
    mycursor = mydb.cursor()
    mycursor.execute('SELECT Order_History.order_id FROM Order_History, Users WHERE Order_History.user_id = Users.user_id AND Users.user_name = "' + username + '"')
    myresult = mycursor.fetchall()
    for x in myresult:
        check = 1
        output += x

    if check == 0:
        output = "No orders found for this user or user not found"
    
    result = "Order history for user {} is as follows :- {}".format(username,output)
    return result

4.

def query4():
    order_id = request.form['order_id']
    
    mycursor = mydb.cursor()
    mycursor.execute("SELECT total_cost FROM Billing_Details WHERE order_id = " + str(order_id) + "")
    myresult = mycursor.fetchall()
    for x in myresult:
        o1 = x

    mycursor = mydb.cursor()   
    mycursor.execute("SELECT mode_of_payment FROM Billing_Details WHERE order_id = " + str(order_id) + "")
    myresult = mycursor.fetchall()
    for x in myresult:
        o2 = x

    o3 = 0
    mycursor = mydb.cursor()
    mycursor.execute("SELECT delivery_options FROM Delivery WHERE order_id = " + str(order_id) + "")
    myresult = mycursor.fetchall()
    for x in myresult:
        o3 = x
    
    if o3 == 0:
        o3 = "NA currently"

    result = "For the given order {}, the total cost is {}, mode of payment is {} and the delivery option is {}".format(order_id,o1,o2,o3)

    return result

5.

def query5():
    user_id = request.form['q51']
    name = request.form['q52']
    password = request.form['q53']
    email = request.form['q54']
    address = request.form['q55']
    pincode = request.form['q56']
    phone = request.form['q57']
    
    entry = ()
    entry = (user_id,name,password,email,address,pincode,phone)

    mycursor = mydb.cursor()
    mycursor.execute("INSERT INTO Users VALUES (%s,%s,%s,%s,%s,%s,%s)",entry)
    mydb.commit()

    result = "User {} added successfully".format(name)

    return result





- Here are the 5 OLAP queries used :-

1.

def query1():
    pincode = request.form['q1']
    product_name = request.form['q1b']
    
    op = "No"
    mycursor = mydb.cursor()
    mycursor.execute("SELECT Seller.seller_id FROM Product, Seller WHERE Product.p_name = '{}' AND Product.product_id = Seller.product_id AND Seller.s_pincode = '{}'".format(product_name,pincode))
    myresult = mycursor.fetchall()
    for x in myresult:
      op = "Yes"

    result = "Is the product {} available in the pincode {} : {}".format(product_name,pincode,op)

    return result

2.

def query2():
    order_id = request.form['q2']
    
    product_name = category_name = product_cost = "NA"
    mycursor = mydb.cursor()
    mycursor.execute("SELECT Product.p_name AS Product_Name, Category.c_name AS Category_Name, Product.p_cost AS Product_Cost FROM Product, Category, Orders WHERE Orders.order_id = '{}' AND Orders.product_id = Product.product_id AND Category.category_id = Product.category_id".format(order_id))
    myresult = mycursor.fetchall()
    for x in myresult:
        product_name = x[0]
        category_name = x[1]
        product_cost = x[2]       

    result = "Product Name : {} \nCategory Name : {} \nProduct Cost : {}".format(product_name,category_name,product_cost)

    return result

3.

def query3():
    coupon = request.form['q3']

    op = []
    opf = ''
    product_name = category_name = product_cost = "NA"
    mycursor = mydb.cursor()
    mycursor.execute("SELECT Product.p_name AS Product_Name, Product.p_cost AS Cost_before_Coupon, (Product.p_cost*(100-Coupons.discount)/100) AS Cost_after_Coupon FROM Product, Coupons WHERE Coupons.coupon_id = '{}'".format(coupon))
    myresult = mycursor.fetchall()
    for x in myresult:
      op.append(x)

    opl = len(op)
    for i in range(0,opl):
      opf += "Product Name : {}; Cost before Coupon : {}; Cost after Coupon : {} \n".format(op[i][0],str(op[i][1]),str(op[i][2]))
    
    result = opf

    return result

4.

def query4():

    op = ()
    mycursor = mydb.cursor()
    mycursor.execute("SELECT DISTINCT user_pincode FROM Users LEFT JOIN Seller ON Users.user_pincode = Seller.s_pincode WHERE Seller.s_pincode IS NULL;")
    myresult = mycursor.fetchall()
    for x in myresult:
      op += x
    
    result = "Here's a list of pincodes where there are users but no sellers : \n{}".format(op)

    return result

5.

def query5():
    c_name = request.form['q5']


    op = 'NA'
    mycursor = mydb.cursor()
    mycursor.execute("SELECT AVG(Product.p_cost) as avg_price FROM Product JOIN Category ON Product.category_id = Category.category_id WHERE Category.c_name = '{}'".format(c_name))

    myresult = mycursor.fetchall()
    for x in myresult:
      op = x[0]
    
    result = "The average price of items in the given category {} is {}".format(c_name,op)
    return result




- Here are the 3 triggers that have been used :-

1.

CREATE DEFINER = CURRENT_USER TRIGGER `Pharma`.`Cart_AFTER_DELETE` AFTER DELETE ON `Cart` FOR EACH ROW
BEGIN
UPDATE Inventory
SET Inventory.quantity = Inventory.quantity + Cart.quantity
WHERE Inventory.product_id = Cart.product_id;
END

2.

CREATE DEFINER = CURRENT_USER TRIGGER `Pharma`.`Cart_AFTER_INSERT` AFTER INSERT ON `Cart` FOR EACH ROW
BEGIN
UPDATE Inventory
SET Inventory.quantity = Inventory.quantity - Cart.quantity
WHERE Inventory.product_id = Cart.product_id;
END

3.

CREATE DEFINER = CURRENT_USER TRIGGER `Pharma`.`Inventory_AFTER_UPDATE` AFTER UPDATE ON `Inventory` FOR EACH ROW
BEGIN
DELETE FROM Product
WHERE Product.product_id = Inventory.product_id and Inventory.quantity = 0;
DELETE FROM Inventory
WHERE Inventory.quantity = 0;
END