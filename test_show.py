import mysql.connector
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Harvard2023*",
  database="Pharma"
)
p0 = 'aaa11'
p1 = 'aaaa'
p2 = 'aaaa'
p3 = 'aaaa'
p4 = 'aaaa'
p5 = 10
p6 = 148546117
p7 = 100
cursor = mydb.cursor()
cursor.execute('START TRANSACTION')
add_product_query = "INSERT INTO Product (product_id, p_name, p_brand, p_info, p_constituents, p_cost, category_id) Values ('{}', '{}', '{}', '{}', '{}', {}, {})".format(p0, p1, p2, p3, p4, str(p5), str(p6))
print(add_product_query)
update_inventory_query = "INSERT INTO Inventory VALUES ({}, {})".format(p0, p7)
print(update_inventory_query)
cursor.execute(add_product_query)
cursor.execute(update_inventory_query)
mydb.commit()
cursor.close()

# will give error