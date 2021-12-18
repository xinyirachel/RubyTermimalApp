# Domimo Pizza
------

## Link to Github
- [Github [LINK]](https://github.com/xinyirachel/RubyTermimalApp)

## Purpose and scope of this application

This app is a pizza ordering system for a single user to make a single order. The app provide many choices for pizza. With this pizza app, people don’t have to order pizza on the phone. Traditionally, people call store to order pizza and speak about the details about the pizza they want, and the person who answer they on the phone will record this details. However,  express ordering details on the phone is not always convince. The store need to hired someone to answer and take order and it is not easy for them to work 24hrs like an app on the phone. The people who record order can make mistake, and this will be the store’s fault. It’s hard for socially awkward people to give a call, and they will prefer to use an app to make order. With Domimo Pizza App, pizza store can save budget by hiring less employee or letting employee work less time. Ordering details can be recorded in a way with more accuracy and efficiency. People feel more comfortable to order pizza, they can do it anytime and they don’t have to talk to strangers. The app can help people order reasonable pricing pizza and customize the pizza they like to eat in a better way. The app targeting on lower middle class and middle class income group. These incomes groups often order pizza on party or they order one when they are too busy to cook (or they just want something tasty but unhealthy). The price of the pizza on this app is reasonable enough for them to buy. The user will choose the type of the pizza, the options are Hawaiian, Meat, Vegie and Seafood, these pizza are usually popular. Then they will see a list of toppings show up for them to choose to add any of them or not. Next, they can choose the kind of sauce they like to add, BBQ, tomato sauce or white sauce. Finally they will choose pizza base. Of course they need to enter their name and address for Domimo to deliver the pizza. User can get all the ordering details in the end, the information include the pizza details, total price and the customer information they entered. 

##  features that will be included in the application
### Choosing pizza type

Open the program, the first thing user see is the text “Welcome to Domimo”, they can hit any button to continue. Then they see the text saying “What pizza do you want? Please choose from Hawaiian, Meat, Vegie, Seafood”. They need to enter any pizza name on the list (only choose one), what they enter is case insensitive. 4 types of pizza stored in an array. The while loop will loop though all the four pizzas name to check which item in array match with the pizza name customer entered. Message "Invalid pizza name. Please enter a valid pizza name" will show if nothing in array match input. If match, “Pizza”, the designed class, will be instantiated, the object pizza will store information of pizza type name and the price. 

### Adding more topping

On the toppings menu screen, the app will ask user if they want to add topping. If customer enter yes (case insensitive), app will ask customer do they want do add a certain kind of topping or not one by one. The while loop will check if user entered a valid answer. The hash with keys (topping name), and values (topping’s price) stored in a json file. The questions for asking user to input quantity for each topping iterate all pairs in the hash. The input will stored in the instantiated “Topping” class. The while loop will check if user entered a valid answer, they should enter integer from 0 to 3.

### Display total amount

Display order screen will show your choices before. This is a sum up of everything. The designed class “Toppings” and “Pizza” help app to achieve it. The method called “calculate_total_price” in “Pizza” calculates the total price of pizza by adding price of the type of the pizza customer choose and the prize of the added toppings together.  The information input by customer like pizzabase, sauce, customer names and address will also show up here. The screen also list all the topping you choose. This feature achieved by each method of iteration. All the topping stored in the instantiated Toppings class will be printed out here.

## the user interaction and experience for the application
User find out how to interact with each feature by read displayed instructons. There message list the options they can enter. If what they entered is not valid, they have to enter again. If the the app cannot find json file, a rescue information show up saying "File not found." 

## Control flow

## Trello board

## Help document
### Steps to install the application 
- Install Ruby on your computer
- Download and unzip this file
- Open termial, navigate to the src folder
- Instal the bundle gem
- Ask bundle to instal the gems that use for the program
- input the below command line
```
 > ruby main.rb
```
### Any dependencies required by the application to operate
- Ruby (3.0.3)
- Bundle gem
### Any system/hardware requirements
- MAC OS or Windows




