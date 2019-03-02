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
Email:      admin@ncsu.edu
Password:   admin!
```
* Other preconfigured user accounts or data:
```
Name:       Agent1
Email:      agent1@gmail.edu
Password:   Agent1

Name:       Customer1
Email:      customer1@gmail.edu
Password:   Customer1
```

### How to ..
This section is about how to test certain functionalities that may appear missing or hard to find in the given User Interface.
Each functionality depends on the user type of the system. Below are the main functionalities for each user type.
For reference, the [Home Page](https://cryptic-crag-14767.herokuapp.com/)
#### As Admin I want to ..
* Login
  * Email:      admin@ncsu.edu
  * Password:   admin!
* Edit my profile name
  * From home page follow "Admin and Users Page" link
  * Under "My Profile" click "Edit/Delete Profile"
* Create/View/Edit/Delete Customer and Agent accounts
  * From home page follow "Admin and Users Page" link
  * Under "Users Section" click on "Create/View/Edit/Delete Users"
  * *Note:* Admin user may edit other users' accounts including name, email, and role; however, Admin is unable to edit/change user's password due to security reasons
* Create/View/Edit/Delete/Cancel/Bookmark Tours
  * From home page follow "Tours Page" link
  * *Note:* Admin may edit/cancel/delete any listed tours
  * If tour's available seats are increased, the algorithm moves customers from wait list of a Tour into booked seats
  * Customers are moved from the wait list into booked in the following order:
    * Customers whose wait list seats <= tours available seats based on FIFO methodology
    * If there are still available seats remaining after the run, customer is partially (some seats) booked in the tour based on FIFO methodology, but still has requested seats remaining in the wait list of the tour
  * If tour's available seats are decreased, the algorithm does not kick any booked customers out of the tour
    * Number of available seats of a Tour will be shown as negative integer 
* View/Edit/Delete All Reviews
  * From home page follow "Reviews Page" link
* Create Review for a particular Tour or View/Edit/Delete Review for a particular Tour
  * One condition must be met:
    
    a) Tour must have Status "Completed", meaning it has already taken place in the past (and it must not be Canceled by an Agent)
  * Reviews may only be written from the Tour's page
  * If above condition is met, from home page follow "Tours Page" link and click on "Details" of the Tour you want to write/view/edit/delete review
  * Scroll down to "Reviews" section and perform action you are interested in ("Your Review", "Write Review", "Edit Review", "Delete")
* View a list of Users booked in any of my tours and their detailed information
  * From home page navigate to "My Customers Page" and follow "Who Booked My Tours" link
* View a list of Users booked in particular tour and their detailed information
  * From home page follow "Tours Page" link
   
    a) Follow "My Customers booked" link beside the Tour (links are located to the right of each tour) that you are interested in
    b) Alternative: Follow "Details" link of the Tour, scroll down and click "Booked Customers" button
* View a list of Users bookmarked any of my tours and their detailed information
  * From home page navigate to "My Customers Page" and follow "Who Bookmarked My Tours" link
* View a list of Users bookmarked particular tour and their detailed information
    * From home page follow "Tours Page" link
     
      a) Follow "My Customers bookmarked" link beside the Tour (links are located to the right of each tour) that you are interested in
      b) Alternative: Follow "Details" link of the Tour, scroll down and click "Bookmarked Customers" button

#### As Agent I want to ..
* Edit my profile name
  * From home page follow "Agent Page" link
  * Under "My Profile" and click "Edit/Delete Profile"
* Create/View/Edit/Delete/Cancel Tours
  * From home page follow "Tours Page" link
  * Agent may View all Tours in the system (not only his/her tours)
  * Agent may only Edit/Cancel/Delete Tours that he/she listed
  * Agent may not Edit/Cancel/Delete Tours that he/she did not list
  * Agent may Create any number of Tours
  * *Note:* Agent may edit/cancel/delete any tours strictly listed by him/her
  * If tour's available seats are increased, the algorithm moves customers from wait list of a Tour into booked seats
  * Customers are moved from the wait list into booked in the following order:
    * Customers whose wait list seats <= tours available seats based on FIFO methodology
    * If there are still available seats remaining after the run, customer is partially (some seats) booked in the tour based on FIFO methodology, but still has requested seats remaining in the wait list of the tour
  * If tour's available seats are decreased, the algorithm does not kick any booked customers out of the tour
    * Number of available seats of a Tour will be shown as negative integer 
* View all the Customers booked for any Tours listed by me
  * From home page navigate to "My Customers Pages" and follow "Who Booked My Tours" link
  * Alternative: From home page follow "Tours Page" link and at the bottom of the page follow "List All My Customers" link
* View all the Customers bookmarked (interested) for any Tours listed by me
  * From home page navigate to "My Customers Pages" and follow "Who Bookmarked My Tours" link
  * Alternative: From home page follow "Tours Page" link and at the bottom of the page follow "List Customers With Bookmarks" link
* View all Tours' Reviews
  * From home page follow "Reviews Page" link
  * Agent may view all available Reviews for all Tours
  * Agent may see Customers' information who wrote Review only if he/she listed the Tour that Review belongs to
  * Agent may not see other Customers' information who wrote Review on Tours that he/she did not list
* View particular Tour's Reviews
  * From home page follow "Tours Page" link
  * Follow "Details" link beside the Tour (links are located to the right of each tour) that you are interested in
  * Scroll down to "Reviews" section and click "View Reviews" button
  * *Note:* Reviews are only available IFF tour is in the "Completed" status and only customers who booked at least 1 (one) seat on the Tour may leave review

  
#### As Customer I want to ..
* Edit my profile name
  * From home follow "Customer Page" link
  * Under "My Profile" and click "Edit/Delete Profile"
* Write a review for a tour
  * Two conditions must be met. Only if both conditions are met, customer may leave a review, no other way is possible.
    
    a) Tour must have Status "Completed", meaning it has already taken place in the past (and it must not be Canceled by an Agent)
    
    b) Customer must have at least 1 booked seat for that tour
    
  * Customer may create only 1 (one) review per a Tour, but customer may edit or delete it
  * If above two conditions are met, from home page follow "Tours Page"
  * Follow "Details" link beside the Tour (links are located to the right of each tour) that you are interested in write/view/edit review
  * Scroll down to "Reviews" section and perform action you are interested in ("Your Review", "Write Review", "Edit Review", "Delete")
* View all Reviews of any Tour
  * From home page follow "Reviews Page" link
  * Customer may view all Reviews of all or any Tour(s)
* View/Edit/Delete Review of a Tour
  * Customer may Edit/Delete only IFF
  
    a) Customer has already submitted (written) a review (or review exists)
    
    b) Review was submitted by the customer

  * From home page follow "Tours Page" link
  * Follow "Details" link beside the Tour (links are located to the right of each tour) that you are interested in write/view/edit review
  * Scroll down to "Reviews" section and perform action you are interested in ("Your Review", "Edit Review", "Delete")
  * Alternative: From home page follow "Reviews Page" link and in the list of Reviews if any reviews were created by you, you may Edit/Delete Review with provided links ot the right of each review
* View all Tours
  * From home page follow "Tours Page" link
  * Customer may view all Tours regardless of Tours' status
* Book a Tour
  * From home page follow "Tours Page" link and follow "Book Tour" link beside the Tour (links are located to the right of each tour) that you want to book
  * Alternative: From home page go to "Tours Page" and click on "Details" of the Tour you want to book, scroll down and click Tour 
  * Customer may only book a Tour IFF following conditions are met:
  
    a) Tour's status is "In Future"
    
    b) Customer had not booked the same Tour previously
  
  * If above conditions are not met, Customer may not be able to book a tour. In that case the "Book" option will be hidden from the customer

* View/Edit/Delete my Bookings
  * From home page navigate to "My Reservations Pages" and follow "My Bookings Page" link
  * Choose the link next to a Booking to perform action you are interested in
    * "Details", "Edit Booking", "Delete Booking" options are all available to customer
* Bookmark Tours
  * From home page follow "Tours Page" link and mark check-boxes of Tours you want to bookmark
  * Click "Bookmark!" button
  * Customer may bookmark any Tours in the System regardless of their Status
* Undo Bookmark a Tour or View all my Bookmarked Tours
  * From home page navigate to "My Reservations Pages" and follow "My Bookmarks Page" link
  * Mark check-boxes of Tours you want to undo bookmark
  * Click "Undo bookmark" button
  
#### Search
Search can ONLY be done at one field at the time. For example, only one field at the time produces the search results
* Search by name
* Search by dates
* Search by price
* Search by availability
* Search by itinerary

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


### Assumptions
While developing an App I've made some assumptions on what my App would not be tested against:
* User of App may not navigate over the App using URL links (e.g. users/edit) as this may break role types among users (Customer may be available to see and act on pages for Agent's use and vice versa)
  * Please follow only links and buttons displayed strictly in the App


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

