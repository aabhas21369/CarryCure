import mysql.connector
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Harvard2023*",
  database="Pharma"
)

cursor = mydb.cursor()

def part1():
    #transaction 1
    t1 = "UPDATE Product SET p_cost = 10 WHERE product_id = 'delectus'"
    t1_2 = "SELECT p_cost FROM Product WHERE product_id = 'delectus'"

    #transaction 2
    t2 = "UPDATE Product SET p_cost = 15 WHERE product_id = 'delectus'"
    t2_2 = "SELECT p_cost FROM Product WHERE product_id = 'delectus'"

    cursor.execute("START TRANSACTION")
    cursor.execute(t1)
    cursor.execute(t2)
    cursor.execute(t1_2)
    result = cursor.fetchone()
    print(result[0])
    cursor.execute(t2_2)
    result = cursor.fetchone()
    print(result[0])
    cursor.execute("COMMIT")
    mydb.commit()

    cursor.execute("START TRANSACTION")
    cursor.execute(t1)
    cursor.execute(t1_2)
    result = cursor.fetchone()
    print(result[0])
    cursor.execute("COMMIT")
    cursor.execute(t2)
    cursor.execute(t2_2)
    result = cursor.fetchone()
    print(result[0])
    cursor.execute("COMMIT")
    mydb.commit()

def part2():

    #transaction 1
    t1_1 = "START TRANSACTION"
    t1_2 = "INSERT INTO Product (product_id, p_name, p_brand, p_info, p_constituents, p_cost, category_id) VALUES ('1212', 'Aspirin', 'Bayer', 'Pain Relief', 'Acetylsalicylic Acid', 999, '18768')"
    t1_3 = "COMMIT"

    #transaction 2
    t2_1 = "START TRANSACTION"
    t2_2 = "UPDATE Product SET p_cost=499 WHERE product_id='1212'"
    t2_3 = "DELETE FROM Product WHERE p_brand='Bayer'"
    t2_4 = "COMMIT"

    #schedule 1
    cursor = mydb.cursor()
    cursor.execute(t1_1)
    cursor.execute(t1_2)
    cursor.execute(t2_1)
    cursor.execute(t2_2)
    cursor.execute(t2_3)
    cursor.execute(t1_3)
    cursor.execute(t1_3)


    #schedule 2
    cursor = mydb.cursor()
    cursor.execute(t1_1)
    cursor.execute(t2_1)
    cursor.execute(t2_2)
    cursor.execute(t1_2)
    cursor.execute(t2_3)
    cursor.execute(t1_3)
    cursor.execute(t2_4)

print("Part 1")
part1()
print('''Both transactions update the cost of a product with ID 'delectus' in the 'Product' table and retrieve the updated cost using a SELECT statement.

The first transaction updates the cost to 10 and the second transaction updates the cost to 15.

The code then executes both transactions in two different orders and retrieves the updated cost values for each order.

The first execution order starts transaction 1, updates the cost to 10, updates the cost to 15, retrieves the updated cost value (which is 15), retrieves the updated cost value again (which is still 15), and commits the transaction.

The second execution order starts transaction 1, updates the cost to 10, retrieves the updated cost value (which is 10), commits the transaction, starts transaction 2, updates the cost to 15, retrieves the updated cost value (which is 15), and commits the transaction.

The first execution order is conflict serializable because the transactions can be reordered without changing the final result. Specifically, if the update statement in transaction 2 is executed before the update statement in transaction 1, then the final result will still be that the cost of 'delectus' is 15.

However, the second execution order is not conflict serializable because if the transactions are reordered, then the final result will change. Specifically, if the update statement in transaction 2 is executed before the SELECT statement in transaction 1, then the final result will be that the cost of 'delectus' is 10.

This violation of conflict serializability occurs because transaction 2 reads a value that transaction 1 has updated but not yet committed, and then transaction 2 updates that value. This creates a conflict that can lead to different final results depending on the order of execution.''')

print("Part 2")
part2()
print('''In the first transaction, a new product is inserted into the table with some details, including its cost. In the second transaction, the cost of the same product is updated, and then the product is deleted from the table.

The code then executes two different schedules, each containing the same set of transactions but in a different order.

Schedule 1 starts transaction 1, inserts a new product, starts transaction 2, updates the cost of the product, deletes the product, commits transaction 1, and then commits transaction 2.

Schedule 2 starts transaction 1, starts transaction 2, updates the cost of the product, inserts a new product, deletes the product, commits transaction 1, and then commits transaction 2.

Schedule 1 is conflict serializable because transactions 1 and 2 do not conflict with each other. Transaction 1 inserts a new product, which is not related to the product updated and deleted by transaction 2. Therefore, the order of execution of transactions 1 and 2 can be interchanged without affecting the final outcome.

Schedule 2 is not conflict serializable because transactions 1 and 2 conflict with each other. Transaction 1 inserts a new product with ID '1212' and cost 999, which is updated by transaction 2 to a cost of 499. Therefore, if transaction 1 is executed after transaction 2, the final outcome will be that the new product has a cost of 499 instead of 999. This violates conflict serializability, as the outcome depends on the order of execution of the transactions.''')
