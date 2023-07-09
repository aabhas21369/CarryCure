I have made a complete Pharmacy Database and Application System using front-end on HTML, CSS and back-end on Python and mySQL with using Flask Connections.
The v0001 and v0002 are for Deadline 5 and v0003 is for deadline 6.
To run the application on a develpement server,
Go to terminal and EXPORT FLASK_APP=v0003.py and FLASK RUN
This will work provided we have the mysql database setup with the correct userids and passwords, along with setting up flask.

The application is a complete Pharmacy Management System with the following features:
1. Login and Signup as User
2. Login as Seller
3. Add, update, delete products by seller
4. Buy product by user
5. See list of products by users with various filters.
6. View order history by user with various filters.


All this have been done by using multiple mySQL transaction, there are over 10 transaction, all of them listed in readme_transactions.md

We have taken multiple sets of at least two transactions, and made a schedule which is conflict serializable, and for the same schedule, made a schedule which is not a conflict serializable.

The same can be found in schedules.py and explation for the same in readme_schedules.md