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

Here are some screenshots from the application :-

<img width="1440" alt="Screenshot 2023-07-09 at 7 10 39 PM" src="https://github.com/dwivediishivam/carrycure/assets/97196010/f61c8e16-9771-4212-911f-dd182a980f4a">

<img width="1440" alt="Screenshot 2023-07-09 at 7 10 32 PM" src="https://github.com/dwivediishivam/carrycure/assets/97196010/2d8cbf83-b66c-4aa7-9524-aee5ad740dd4">

<img width="1440" alt="Screenshot 2023-07-09 at 7 10 24 PM" src="https://github.com/dwivediishivam/carrycure/assets/97196010/f3c29551-af37-4230-a2c3-2c0f5d5ee650">

<img width="1440" alt="Screenshot 2023-07-09 at 7 10 19 PM" src="https://github.com/dwivediishivam/carrycure/assets/97196010/9e1d14f9-f60d-4c5c-a84b-8b97a0d8d354">
