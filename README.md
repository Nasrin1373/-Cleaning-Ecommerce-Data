# -Cleaning-Ecommerce-Data
Overview

This repository contains a sample ecommerce dataset that includes information about customers, orders, products and employees. The dataset is structured into four main categories: Customer Information, Order Details, Product Information and Employees Information. Each category provides valuable insights for analysis and can be used for various data analysis and business intelligence applications.This is the classic Ecommerce dataset uploaded originally in the Microsoft datasts.
In this project, I performed comprehensive data cleaning with SQL, and created insightful visualizations with Power BI. 


Dataset Features

Customer Information

Contact Title:Title or designation of the contact person.Categorical

Address: Street address of the customer.Text

City:City where the customer is located.Categorical

Region:Region or state information.Categorical

Postal Code:Postal code of the customer's location.Numerical

Country:Country where the customer is based.Categorical

Converted Phone:Phone number of the customer. Text

Converted Fax:Fax number of the customer.Text



Order Details

Order ID:Unique identifier for each order. Numerical

Customer ID:Unique identifier for each customer.Numerical

Employee ID:Identifier for the employee associated with the order. Numerical

Order Date:Date when the order was placed.Date/Time

Required Date:Date when the order is required. Date/Time

Shipped Date: Date when the order was shipped.Date/Time

Ship Via:Shipping method or company used for the order. Categorical

Freight:Cost of shipping for the order.Numerical

Ship Name:name of the entity to which the order is shipped.Text

Ship Address:Street address of the shipping location.Text

Ship City:City of the shipping location.Categorical

Ship Region:
Region or state of the shipping location.Categorical

Ship Postal Code: Postal code of the shipping location.Numerical

Ship Country:Country of the shipping location.Categorical

Charge:Charge associated with the order.Categorical (e.g., Low Charge, Medium Charge)





Product Information

Product ID:Unique identifier for each product.Numerical

Product Name: Name of the product. Text

Supplier ID:Identifier for the supplier of the product. Numerical

Category ID: Identifier for the category to which the product belongs. Numerical

Quantity Per Unit:Quantity and unit description for the product. Text

Unit Price:Price per unit of the product.Numerical

Units In Stock: Number of units currently in stock.Numerical

Units On Order: Number of units on order but not yet received. Numerical

Reorder Level:Minimum quantity of the product that should trigger a reorder. Numerical

Discontinued: Binary indicator of whether the product is discontinued. Boolean

When To Restock:Recommendation for when to restock the product. Categorical (e.g., Restock Now, Restock in 6 Months, Ask Manager


Employees

EmployeeID: A unique identifier for each employee.

LastName: The last name of the employee.

FirstName: The first name of the employee.

Title: The job title or position of the employee within the company.

TitleOfCourtesy: The formal title of courtesy used when addressing the employee (e.g., Mr., Ms., Mrs., Dr.).

ConvertedBirthDate: The birthdate of the employee, possibly converted into a standardized format.

ConvertedHireDate: The date when the employee was hired, possibly converted into a standardized format.

Address: The street address of the employee.

City: The city where the employee is located.

Region: The region or state where the employee is located.

PostalCode: The postal code of the employee's address.

Country: The country where the employee is located.

HomePhone: The phone number of the employee's residence.

Extension: The extension number or code for the employee.

ReportsTo: The EmployeeID of the person to whom the employee reports.
















