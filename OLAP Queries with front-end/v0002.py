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
def v0002():
    return render_template('v0002.html')

@app.route('/query1', methods=['POST'])
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

@app.route('/query2', methods=['POST'])
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

@app.route('/query3', methods=['POST'])
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

@app.route('/query4', methods=['POST'])
def query4():

    op = ()
    mycursor = mydb.cursor()
    mycursor.execute("SELECT DISTINCT user_pincode FROM Users LEFT JOIN Seller ON Users.user_pincode = Seller.s_pincode WHERE Seller.s_pincode IS NULL;")
    myresult = mycursor.fetchall()
    for x in myresult:
      op += x
    
    result = "Here's a list of pincodes where there are users but no sellers : \n{}".format(op)

    return result

@app.route('/query5', methods=['POST'])
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

if __name__ == '__main__':
    app.run(debug=True)
