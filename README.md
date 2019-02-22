# CSC 517 (601) - Object Oriented Design and Development

## Project 2: Ruby on Rails - Tour Management System
Tour Management System requirement specifications and assignment materials can be found [here](https://docs.google.com/document/d/1VZmRq2_u275v5eifWg9e1zEoKia_Sv9j60mFRJGQzGM/edit#heading=h.krv62guopnuq).

### Deployment Application
Tour Management System App is deployed onto [Heroku](https://project2-toursapp.herokuapp.com/) Cloud Application Platform.

For reviewing and grading purposes refer to the above link.

### Application Development Environment
* Ubuntu 18.04.2 LTS
* Ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu]
* Rails 5.2.2
* Bundler version 2.0.1
* Sqlite3 3.22.0

### Configurations
* Credentials for preconfigured Admin user account:
```
Name:       Admin
Email:      ngtitov@ncsu.edu
Password:   AdminNCSU
```
* Other preconfigured user accounts or data: **NONE**

### Usage
There are three (3) types of users in the system:
* Admin
* Agents
* Customers

#### Admin
* Preconfigure Admin account is set up
* An admin is capable of performing all operations performed by Agent or Customer
* Admin account cannot be deleted
* Admin is be able to:
  * Log in with an email and password
  * Upon Logging in, Admin user is greeted with Welcome Page
  * From the welcome page Admin can navigate to following links and perform the following tasks:
    * Edit profile
    * Create agent and customer accounts (users)
    * View the list of all users and their profile details (except password)
    * View the list of all tours, along with detailed information
    * View all fields of reviews (defined below) from customers
    * Edit or delete users (agents or customers)/tours/reviews from the system
    * Bookmark/Create/Book/Edit/Cancel/Delete Tours
      * Tour can be canceled only if Tour status is In Future
      * Tour can be booked with number of N seats only if there are available seats
      * Otherwise, it jumps into Book/Wait List page where Admin may choose how many seats he/she wants to reserve now and how many to wait list
 
#### Agent
Anyone is able to Sign Up as an agent using their email, name and password. After Sign Up, they can perform the following tasks:
* Login with email and password
* Upon Logging in, Agent user is greeted with Welcome Page
* From the welcome page Admin can navigate to following links and perform the following tasks:
  * Create a tour
  * Edit/update/delete/cancel tours that they have posted
  * Cannot edit tours posted by other agents
  * View all tours (including those listed by others)
  * Upload and delete pictures of tours that they themselves have listed
  * View list of all customers who have bookmarked a tour (created by agent)
  * View list of all customers who have booked a tour (created by agent)
  * View reviews of a tour
  * Agent is able to delete his/her own account
* If agent is deleted from the system, his/her tours that were created remain in the system

#### Customer
Anyone is able to Sign Up as a customer using their email, name and password. After Sign Up, they can perform the following tasks:
* Log in with email and password
* Upon Logging in, Customer is greeted with Welcome Page
* From the welcome page Customer can navigate to following links and perform the following tasks:
  * Bookmark tours they are interested in
  * View information about tours
  * Book N seats on a tour
    * If enough seats requested are available, it adds the customer to list of customers who have booked
    * If some, but not enough, seats are available: 
      * Informs customer that enough seats are not available by redirecting it to the Wait List page
      * Customer is able to choose how many seats he/she wants to book now and how many seats can be placed at the Wai List
      * If Customer wants to wait till enough seats are available, it adds a customer to Wait List along with requested seats
      * If customer does not want to proceed; cancel transaction
      * If no seats are available, customer is redirected to the Wait List page where he/she can specify wha the number of seats to be placed in the Wait List
  * Delete a booking completely or delete a few seats from a booking done previously
  * If removed account or reduced number of seats provide additional spaces in the Tour, enrolls customers from the Wait List on a FIFO basis who are requesting no more seats than are currently available.
  * If a customer wants more seats than are available, it skips that customer and go on to the next customer on the Wait List
  * Submit a review for a tour that that customer has already taken
  * Edit or delete a review they previously submitted
  * Customer is able to delete his own account


### Source Code
Source code can be found/cloned/downloaded at the [GitHub](https://github.ncsu.edu/ngtitov) repository.

### Acknowledgment
Please be aware that 90% (refer to the [GitHub](https://github.ncsu.edu/ngtitov) commits history) of the work has been done by me
* Nikolay G. Titov (ngtitov@ncsu.edu)

Due to the lack of any help whatsoever, heavy load of designing, implementing and testing tasks, and steep learning curve, I could not finish this project even working more than 8 hours per day.

Please be acknowledged that I've dedicated over 120 hours for this project.  

Therefore, I was not able to test all of the implemented functionalities, features and edge-case scenarios.

### Team
* EarlyBird (not really sure what it means)
* Team of 3 contributors
   * **Nikolay G Titov** (ngtitov@ncsu.edu) - Software Engineer, Architect, Developer and Tester 
   * **Yuhan Chen** (ychen239@ncsu.edu)
   * **Huan Chang** (hchang15@ncsu.edu)
   
### Refernces
* [https://api.rubyonrails.org/](https://api.rubyonrails.org/)
* [https://guides.rubyonrails.org/](https://guides.rubyonrails.org/)
* [https://stackoverflow.com/](https://stackoverflow.com/)

