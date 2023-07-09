from flask import Flask, render_template, request

app = Flask(__name__)

import mysql.connector
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Harvard2023*",
  database="Pharma"
)


@app.route('/')
def v0001():
    return render_template('v0001.html')

@app.route('/query1', methods=['POST'])
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

@app.route('/query2', methods=['POST'])
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

@app.route('/query3', methods=['POST'])
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

@app.route('/query4', methods=['POST'])
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

@app.route('/query5', methods=['POST'])
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

if __name__ == '__main__':
    app.run(debug=True)
