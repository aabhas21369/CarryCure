from flask import Flask, render_template, request, redirect, url_for
import mysql.connector
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Harvard2023*",
  database="Pharma"
)

app = Flask(__name__)

@app.route('/')
def index():
  return render_template('v0003_0.html')

@app.route('/homepage', methods=['POST'])
def homepage():
  role = request.form['role']
  if role == 'seller':
    return render_template('v0003_2.html')
  elif role == 'user':
    return render_template('v0003_1.html')
  elif role == 'check':
    return render_template('v0003_10.html')


@app.route('/user_login', methods=['POST'])
def user_login():
  cursor = mydb.cursor()
  username = request.form['user_id']
  password = request.form['password']
  query = "SELECT * FROM Users WHERE user_id = %s AND user_password = %s"
  cursor.execute(query, (username, password))
  if cursor.fetchone() is not None:
    return render_template('v0003_5.html')
    # after login page
  else:
    return render_template('v0003_3.html')


@app.route('/user_signup', methods=['POST'])
def user_signup():
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

    return render_template('v0003_4.html')

@app.route('/return', methods=['POST'])
def return2():
  return render_template('v0003_0.html')

@app.route('/return2', methods=['POST'])
def return3():
  return render_template('v0003_0.html')

@app.route('/seller_signin', methods=['POST'])
def seller_signin():
  cursor = mydb.cursor()
  s_id = request.form['seller_id']
  query = "SELECT * FROM Seller WHERE seller_id = %s"
  cursor.execute(query, (s_id,))
  if cursor.fetchone() is not None:
    return render_template('v0003_6.html')
    # after login page
  else:
    return render_template('v0003_3.html')

@app.route('/add', methods=['POST'])
def add():
  p0 = request.form['p0']
  p1 = request.form['p1']
  p2 = request.form['p2']
  p3 = request.form['p3']
  p4 = request.form['p4']
  p5 = request.form['p5']
  p6 = request.form['p6']
  p7 = request.form['p7']
  cursor = mydb.cursor()
  cursor.execute("START TRANSACTION")
  add_product_query = "INSERT INTO Product (product_id, p_name, p_brand, p_info, p_constituents, p_cost, category_id) Values ('{}', '{}', '{}', '{}', '{}', {}, {})".format(p0, p1, p2, p3, p4, str(p5), str(p6))
  cursor.execute(add_product_query)
  mydb.commit()
  cursor.execute("START TRANSACTION")
  update_inventory_query = "INSERT INTO Inventory VALUES ('{}', {})".format(p0, p7)
  cursor.execute(update_inventory_query)
  cursor.execute("COMMIT")
  mydb.commit()
  cursor.close()
  return render_template('v0003_4.html')

@app.route('/update', methods=['POST'])
def update():
  pid = request.form['pid2']
  price = request.form['price']
  inventory = request.form['inventory']
  cursor = mydb.cursor()
  cursor.execute("START TRANSACTION")
  update_product_query = f'UPDATE Product SET p_cost = {price} WHERE product_id = "{pid}"'
  cursor.execute(update_product_query)
  cursor.execute("COMMIT")
  mydb.commit()
  cursor.close()
  return render_template('v0003_4.html')

@app.route('/delete', methods=['POST'])
def delete():
  pid = request.form['pid3']
  cursor = mydb.cursor()
  cursor.execute("START TRANSACTION")
  remove_inventory_query = "DELETE FROM Inventory WHERE product_id = %s"
  cursor.execute(remove_inventory_query, (pid,))
  cursor.execute("COMMIT")
  mydb.commit()
  cursor.close()
  return render_template('v0003_4.html')



@app.route('/user', methods=['POST'])
def user():
  role = request.form['role']
  if role == 'find':
    return render_template('v0003_7.html')
  elif role == 'buy':
    return render_template('v0003_8.html')
  elif role =='order':
    return render_template('v0003_9.html')
  

@app.route('/query2', methods=['POST'])
def query2():
    min_price = request.form['min_price']
    max_price = request.form['max_price']
    
    check = 0
    output = ()
    mycursor = mydb.cursor()
    mycursor.execute('START TRANSACTION')
    mycursor.execute("SELECT p_name FROM Product WHERE p_cost BETWEEN " + str(min_price) + " AND " + str(max_price) + "")
    myresult = mycursor.fetchall()
    for x in myresult:
        check = 1
        output += x

    if check == 0:
        output = "No products found in this price range"

    result = "List of Products in the price range {} to {} : {}".format(min_price,max_price,output)
    mycursor.execute("COMMIT")
    mydb.commit()
    return result

@app.route('/query1', methods=['POST'])
def query1():
    pincode = request.form['pincode']

    mycursor = mydb.cursor()
    mycursor = mydb.cursor()
    mycursor.execute('START TRANSACTION')
    mycursor.execute("""
        SELECT 
            CASE 
                WHEN COUNT(*) = 0 THEN 'Pincode not found'
                ELSE 'Pincode found'
            END
        FROM Seller 
        WHERE s_pincode = %s FOR UPDATE
    """, (pincode,))
    myresult = mycursor.fetchone()
    mycursor.execute("COMMIT")
    ans = myresult[0]
    return ans

@app.route('/query3', methods=['POST'])
def query3():
    coupon = request.form['q3']

    op = []
    opf = ''
    product_name = category_name = product_cost = "NA"
    mycursor = mydb.cursor()
    mycursor.execute('START TRANSACTION')
    mycursor.execute("SELECT Product.p_name AS Product_Name, Product.p_cost AS Cost_before_Coupon, (Product.p_cost*(100-Coupons.discount)/100) AS Cost_after_Coupon FROM Product, Coupons WHERE Coupons.coupon_id = '{}'".format(coupon))
    myresult = mycursor.fetchall()
    for x in myresult:
      op.append(x)

    opl = len(op)
    for i in range(0,opl):
      opf += "Product Name : {}; Cost before Coupon : {}; Cost after Coupon : {} \n".format(op[i][0],str(op[i][1]),str(op[i][2]))
    
    result = opf
    mycursor.execute("COMMIT")
    mydb.commit()
    return result


@app.route('/query4', methods=['POST'])
def query4():

    op = []
    opf = ''
    product_name = category_name = product_cost = "NA"
    mycursor = mydb.cursor()
    mycursor.execute('START TRANSACTION')
    mycursor.execute("SELECT Product.p_name AS Product_Name, Product.p_cost AS Cost FROM Product")
    myresult = mycursor.fetchall()
    for x in myresult:
      op.append(x)

    opl = len(op)
    for i in range(0,opl):
      opf += "Product Name : {}; Cost : {} \n".format(op[i][0],str(op[i][1]))
    
    result = opf
    mycursor.execute("COMMIT")
    mydb.commit()
    return result

@app.route('/query5', methods=['POST'])
def query5():
    username = request.form['username']

    output = ()
    check = 0
    mycursor = mydb.cursor()
    mycursor.execute('START TRANSACTION')
    mycursor.execute('SELECT Order_History.order_id FROM Order_History, Users WHERE Order_History.user_id = Users.user_id AND Users.user_name = "' + username + '"')
    myresult = mycursor.fetchall()
    for x in myresult:
        check = 1
        output += x

    if check == 0:
        output = "No orders found for this user or user not found"
    
    result = "Order history for user {} is as follows :- {}".format(username,output)
    mycursor.execute("COMMIT")
    mydb.commit()
    return result

@app.route('/query6', methods=['POST'])
def query6():
    order_id = request.form['order_id']
    
    mycursor = mydb.cursor()
    mycursor.execute('START TRANSACTION')
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
    mycursor.execute("COMMIT")
    mydb.commit()
    return result

@app.route('/query7', methods=['POST'])
def query7():
    order_id = request.form['q2']
    
    product_name = category_name = product_cost = "NA"
    mycursor = mydb.cursor()
    mycursor.execute('START TRANSACTION')
    mycursor.execute("SELECT Product.p_name AS Product_Name, Category.c_name AS Category_Name, Product.p_cost AS Product_Cost FROM Product, Category, Orders WHERE Orders.order_id = '{}' AND Orders.product_id = Product.product_id AND Category.category_id = Product.category_id".format(order_id))
    myresult = mycursor.fetchall()
    for x in myresult:
        product_name = x[0]
        category_name = x[1]
        product_cost = x[2]       

    result = "Product Name : {} \nCategory Name : {} \nProduct Cost : {}".format(product_name,category_name,product_cost)
    mycursor.execute("COMMIT")
    mydb.commit()
    return result


@app.route('/buy', methods=['POST'])
def buy():
  product_name = request.form['p0']
  delivery_address = request.form['p1']
  mode_of_payment = request.form['p2']
  user_id = request.form['p3']
  coupon_id = request.form['p4']

  cursor = mydb.cursor()
  cursor.execute('START TRANSACTION')
  query = "SELECT * FROM Product WHERE p_name = %s"
  cursor.execute(query, (product_name,))
  result = cursor.fetchone()

  if result:
      product_id = result[0]
      product_cost = float(result[5])

      query = "SELECT quantity FROM Inventory WHERE product_id = %s"
      cursor.execute(query, (product_id,))
      inventory_result = cursor.fetchone()

      if inventory_result:
          inventory_quantity = inventory_result[0]

          if inventory_quantity > 0:
              total_cost = product_cost
              if coupon_id != "":
                  query = "SELECT discount FROM Coupons WHERE coupon_id = %s AND user_id = %s AND usuability = 'Active' AND expiry > NOW()"
                  cursor.execute(query, (coupon_id, user_id))
                  coupon_result = cursor.fetchone()

                  if coupon_result:
                      coupon_discount = float(coupon_result[0])
                      total_cost = product_cost * (1 - coupon_discount)

                      query = "UPDATE Coupons SET usuability = 'Used' WHERE coupon_id = %s"
                      cursor.execute(query, (coupon_id,))

              query = "INSERT INTO Orders (order_id, user_id, product_id, quantity, delivery_address, total_cost) VALUES ('{}', '{}', '{}', {}, '{}', {})".format(user_id+product_id, user_id, product_id, 1, delivery_address, total_cost)
              cursor.execute('SET foreign_key_checks = 0')
              cursor.execute('COMMIT')
              cursor.execute(query)

              query = "INSERT INTO Billing_Details (billing_id, order_id, total_cost, mode_of_payment) VALUES ('{}', '{}', {}, '{}')".format(user_id+product_id+str(total_cost), user_id+product_id, total_cost, mode_of_payment)
              cursor.execute('COMMIT')
              mydb.commit()
              return ("Transaction completed successfully. Total cost: $%.2f" % total_cost)
          else:
              mydb.rollback()
              cursor.execute('COMMIT')
              return ("Transaction failed. The product is out of stock.")
      else:
          mydb.rollback()
          cursor.execute('COMMIT')
          return ("Transaction failed. The product is out of stock.")
  else:
      mydb.rollback()
      cursor.execute('COMMIT')
      return ("Transaction failed. The product does not exist.")
