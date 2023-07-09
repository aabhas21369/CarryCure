-- creating a new user
use pharma;
insert into Users( user_id, user_name, user_password, user_email, user_address, user_pincode, user_phno) values('45', 'Pete_hannigan', 'jjgugu', 'petehann1995@gmail.com', '7767 Alley street', '767853', '8975689655');

-- updating the quantity of a product
use pharma;
UPDATE Inventory SET quantity = '7' Where product_id = 'a';

-- deleting a category
use pharma;
Delete from Category Where category_id = '1';

-- finding the medicine that is very cheap
use pharma;
Select min(p_cost) from Product;

-- filtering the medicines within a certain range
use pharma;
Select * from Products where p_cost between 0 and 1000;

-- finding the all available pharmacies according to their location
use pharma;
Select seller_pincode from Seller;

-- viewing all the available categories at the pharmacies
use pharma;
Select * from Category;

-- viewing the expiry date of coupons;
use pharma;
Select expiry, user_id, coupon_id from Coupons;

-- viewing contents of the cart
use pharma;
Select * from Cart;

-- checking order history of a customer
use pharma;
Select * from Order_Histroy
Where user_id = '122';
