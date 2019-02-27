# CSC 517 (601) - Object Oriented Design and Development

## Project 2: Ruby on Rails - Tour Management System
Tour Management System requirement specifications and assignment materials can be found [here](https://docs.google.com/document/d/1VZmRq2_u275v5eifWg9e1zEoKia_Sv9j60mFRJGQzGM/edit#heading=h.krv62guopnuq).

### Deployment Application
Tour Management System App is deployed onto [Heroku](https://cryptic-crag-14767.herokuapp.com/) Cloud Application Platform.

For reviewing and grading purposes refer to the above link.

### Configurations
* Credentials for preconfigured Admin user account:
```
Name:       Admin
Email:      ngtitov@ncsu.edu
Password:   AdminNCSU
```
* Other preconfigured user accounts or data: **NONE**

### How to ..
This section is about how to test certain functionalities that may appear missing or hard to find in the given User Interface.
Each functionality depends on the user type of the system. Below are the main functionalities for each user type.
#### As Admin I want to ..
* Login
  * Email: ngtitov@ncsu.edu
  * Password: AdminNCSU
* Edit my profile name
  * From home page go to "User Page"
  * Click Edit/Delete Profile
* Create/View/Edit/Delete Customer and Agent accounts
  * From home page go to "User Page"
  * Under "Users Section" click on Create/View/Edit/Delete Users
* Create/View/Edit/Delete/Cancel/Bookmark Tours
  * From home page go to "Tours Page"
* View/Edit/Delete All Reviews
  * From home page go to "View/Edit Reviews"
* Create Review for a particular Tour or View/Edit/Delete Review for a particular Tour
  * One condition must be met:
    
    a) Tour must have Status "Completed", meaning it has already taken place in the past (and it must not be Canceled by an Agent)
  * Reviews can only be written from Tour's page
  * If above condition is met, from home page go to "Tours Page" and click on "Details" of the Tour you want to write/view/edit/delete review
  * Scroll down to "Reviews" section and perform action you are interested in
* View a list of Users booked in a tour and their detailed information
  * From home page go to "Tours Page"
   
    a) Click "My Customers booked" link besides the Tour that you are interested in
    b) Click "Details" link, scroll down and click "Booked Customers"
* View a list of Users bookmarked a tour and their detailed information
    * From home page go to "Tours Page"
     
      a) Click "My Customers bookmarked" link besides the Tour that you are interested in
      b) Click "Details" link, scroll down and click "Bookmarked Customers"

#### As Agent I want to ..
* Edit my profile name
  * From home page go to "Agent Page"
  * Click Edit/Delete Profile
* Create/View/Edit/Delete/Cancel Tours
  * Agent may View all Tours in the system (not only his/her tours)
  * Agent may only Edit/Cancel/Delete Tours that he/she listed
  * Agent may not Edit/Cancel/Delete Tours that he/she did not list
  * Agent may Create any number of Tours
  * From home page go to "Tours Page"
* View all the Customers booked for any Tours listed by him/her
  * From home page under "My Customers Pages" click on "Booked My Tours"
  * Alternative: From home page go to "Tours Page" and at the bottom of the page click link "List All My Customers"
* View all the Customers bookmarked (interested) for any Tours listed by him/her
  * From home page under "My Customers Pages" click on "Bookmarked My Tours"
  * Alternative: From home page go to "Tours Page" and at the bottom of the page click link "List Customers With Bookmarks"
* View all Tours' Reviews
  * From home page go to "Reviews Page"
  * Agent may view all available Reviews for all Tours
  * Agent may see Customers' information who wrote Review only if he/she listed the Tour that Review belongs to
  * Agent may not see other Customers' information who wrote Review on Tours that he/she did not list

  
#### As Customer I want to ..
* Edit my profile name
  * From home page go to "Customer Page"
  * Click Edit/Delete Profile
* Write a review for a tour
  * Two conditions must be met. Only if both conditions are met, Customer may leave a review, no other way is possible.
    
    a) Tour must have Status "Completed", meaning it has already taken place in the past (and it must not be Canceled by an Agent)
    
    b) Customer must have at least 1 booked seat for that tour
    
  * Customer may create only 1 (one) review per a Tour
  * If above two conditions are met, from home page go to "Tours Page" and click on "Details" of the Tour you want to write/view/edit review
  * Scroll down to "Reviews" section and perform action you are interested in
* View all Reviews of any Tour
  * Customer may view all Reviews of all or any Tour(s)
  * From home page go to "Reviews Page"
* View/Edit/Delete Review of a Tour
  * Customer may Edit/Delete only his/her Review for a Tour (only iff Review already exists)
  * From home page go to "Tours Page"
  * Click on "Details" of the Tour that you want to view/edit/delete for
  * Scroll down to "Reviews" section and perform action you are interested in
  * Alternative: From home page go to "Reviews Page" in the list of Reviews if any reviews were created by you, you may Edit/Delete Review with provided links
* View all Tours
  * Customer may view all Tours regardless of Tours' status
* Book a Tour
  * Customer may only book a Tour iff Tour's status is "In Future"
  * Customer may not book the same Tour more than once
  * From home page go to "Tours Page" and click on "Book Tour" link besides the Tour that you want to book
  * Alternative: From home page go to "Tours Page" and click on "Details" of the Tour you want to book, scroll down and click Tour 
* View/Edit/Delete my Bookings
  * From home page go to "My Booking Page"
  * Choose the link next to a Booking to perform action you are interested in - "Details", "Edit Booking", "Delete Booking"
* Bookmark a Tour
  * Customer may bookmark any Tours in the System regardless of their Status
  * From home page go to "Tours Page" and mark check-boxes of Tours you want to bookmark
  * Click "Bookmark!"
* Undo Bookmark a Tour or View all my Bookmarked Tours
  * From home page go to "My Bookmarks Page"
  * Mark check-boxes of Tours you want to undo bookmark
  * Click "Undo bookmark"

### Application Development Environment
* Ubuntu 18.04.2 LTS
* Ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu]
* Rails 5.2.2
* Bundler version 2.0.1
* Sqlite3 3.22.0

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
      * If Customer does not want to proceed; cancel booking
      * If no seats are available, customer is redirected to the Wait List page where he/she can specify wha the number of seats to be placed in the Wait List
  * Delete a booking completely or delete a few seats from a booking done previously
  * If removed account or reduced number of seats provide additional spaces in the Tour, enrolls customers from the Wait List on a FIFO basis who are requesting no more seats than are currently available.
  * If a customer wants more seats than are available, it skips that customer and go on to the next customer on the Wait List
  * Submit a review for a tour that that customer has already taken
  * Edit or delete a review they previously submitted
  * Customer is able to delete his own account


### Source Code
Source code can be found/cloned/downloaded at the [GitHub](https://github.ncsu.edu/ngtitov) repository.

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

