# A script that simulates a guy's on a date with his wife and 2 kids

# The script will capture the names of the party and what they can eat
# While tallying the total cost, the script will capture how much the person paying can spend for the night
# script will then tally if the guy can or cannot pay - if not he figures out a way.

# Menu of the restaurant

import time

food_menu = {
    "Apps": {
        "Samosas": {"Price": 3.00, "Ingredients": ["Flour", "Peas", "Oil"], "Dietary_Notes": "Vegan"},
        "Nachos": {"Price": 8.00, "Ingredients": ["Flour", "Sauces", "Oil"], "Dietary_Notes": "Vegan"},
        "Spring Rolls": {"Price": 3.50, "Ingredients": ["FLour", "Potatoes", "Veggies", "Oil"], "Dietary_Notes": "Vegan"},
           },
    "Entrees": {
        "Chicken": {"Price": 6.50, "Ingredients": ["Chicken", "Spices", "Oil"], "Dietary_Notes": "Non-Vegan"},
        "Steak": {"Price": 12.00, "Ingredients": ["Beef", "Spices", "Oil"], "Dietary_Notes": "Non-Vegan"},
        "Wings": {"Price": 8.50, "Ingredients": ["Chicken", "Flour", "Eggs", "Oil", "Sauce"], "Dietary_Notes": "Non-Vegan"},
        "Pasta": {"Price": 8.50, "Ingredients": ["Flour", "Eggs", "Oil"], "Dietary_Notes": "Vegan"},
        "Seafood_Platter": {"Price": 15.50, "Ingredients": ["Sea_food", "Eggs", "Greens", "Oil"], "Dietary_Notes": "Vegan"},
               },
    "Sides": {
        "Fries": {"Price": 4.50, "Ingredients": ["Potatoes", "Oil"], "Dietary_Notes": "Vegan"},
        "Mashed_potatoes": {"Price": 4.95, "Ingredients": ["Potatoes"], "Dietary_Notes": "Vegan"},
        "Veggies": {"Price": 5.50, "Options": ["Brocolli", "Cauliflower", "String_beans", "Asparagus"], "Dietary_Notes": "Non-Vegan"},
             },
    "Beverages": {
        "Water": {"Price": 1.75, "Options": ["Distilled_water", "Bottled_water"], "Dietary_Notes": "Vegan"},
        "Soda": {"Price": 2.75, "Options": ["Coke", "Sprite", "GingerAle"], "Dietary_Notes": "Non-Vegan"},
        "Fresh_juice": {"Price": 5.50, "Options": ["Passion", "Apple", "Melon"], "Dietary_Notes": "Vegan"},
                 },
    "Desserts": {
        "Ice_Cream": {"Price": 4.50, "Ingredients": ["Milk", "Sugar", "Food_color"], "Dietary_Notes": "Non-Vegan"},
        "Brulle": {"Price": 8.00, "Ingredients": ["Flour", "Eggs", "Milk", "Sugar"], "Dietary_Notes": "Non-Vegan"},
        "Cake": {"Price": 4.50, "Ingredients": ["Flour", "Eggs", "Milk", "Sugar", "Food_color"], "Dietary_Notes": "Non-Vegan"},
        "Youghurt": {"Price": 3.50, "Ingredients": ["Potatoes", "Oil"], "Dietary_Notes": "Non-Vegan"}
                },
            }

# Printing the menu with indentattion;
def print_foodmenu(d, indent=0):
    for key, value in d.items():
        if isinstance(value, dict): # checking if the first value is a dictionary
            print("  " * indent + str(key) + ":") # If, yes printing the key value as a string
            # Recursively print the nested dictionary
            print_foodmenu(value, indent + 1)
        else:
            # if the value is not a dictionary, to print on the same line
            print("  " * indent + f"{key}: {value}")

# Call the function to print the entire nested dictionary
print("\nC5-KURA RESTAURANT")
print("==================")
print("\n ")

print("\nWelcome to C5-Kura Restaurant, Mr. & Mrs. Clark Kent")
guest_name = "Mr. & Mrs. Clark Kent"

print(f"\nHere, {guest_name}, is the menu to choose from...")

print_foodmenu(food_menu) #printing the restaurant's food menu.

print("\nWe understand you have a credit of $85.00 with us that you intend to only use.")
guest_wallet = 85

# Taking the guest(s) order
print("\nWith that, allow me take your order, now - if you're ready...")
time.sleep(1)

# Taking the guest(s) drinks order
drinks_response = input("\nWant any drinks? Please enter yes or no.\n")

if drinks_response == 'yes' or drinks_response == 'Yes':
    drinks = input("\nWhat will it be; Water, Soda or Fresh Juice; that is Passion Juice, Apple Juice, Melon Juice ?\n")
    drinks_qty = int(input("\nHow many would you like?\n"))

    if drinks == "Water":
        guest_wallet = guest_wallet - (food_menu["Beverages"]["Water"]["Price"] * drinks_qty)
    elif drinks == "Soda":
        guest_wallet = guest_wallet - (food_menu["Beverages"]["Soda"]["Price"] * drinks_qty)
    elif drinks == "Passion Juice" or drinks == "Apple Juice" or drinks == "Melon Juice":
        guest_wallet = guest_wallet - (food_menu["Beverages"]["Fresh_juice"]["Price"] * drinks_qty)
    else:
        print("The selection you made is unfortunately not part of the drinks options")
        
elif drinks_response == 'no' or drinks_response == 'No':
    print("\nGot it. Let us know if you'd like anything else.\n")

else:
    print("An improper response was input. Please try again if you like.\n")


# Taking the guest(s) appetizers' order
time.sleep(2)
apps_response = input("\nWant any appetizers? Please enter yes or no.\n")

if apps_response == 'yes' or apps_response == 'Yes':
    appetizers = input("\nWhat will it be; Samosas, Nachos or Spring Rolls?\n")
    samosas_qty = int(input("\nHow many would you like?\n"))

    if appetizers == "Samosas":
        guest_wallet = guest_wallet - (food_menu["Apps"]["Samosas"]["Price"] * samosas_qty)
    elif appetizers == "Nachos":
        guest_wallet = guest_wallet - food_menu["Apps"]["Samosas"]["Price"]
    elif appetizers == "Spring Rolls":
        guest_wallet = guest_wallet - food_menu["Apps"]["Spring Rolls"]["Price"]
    else:
        print("The selection you made is unfortunately not part of the appetizer options")

elif apps_response == "no" or apps_response == "No":
    print("Got it. I'll give you a few and I'll return to take your entrees\n")

else:
    print("An improper response was input. Please try again if you like.\n")


time.sleep(2)
 

# Taking the guest(s) maincourse order
time.sleep(3)

maincourse_qn = input("\nAre you ready to place your Entree and a side orders or should I return later? Please enter 'yes' or 'no'\n")
if maincourse_qn == "yes" or maincourse_qn == "Yes":
    entree_qty = int(input("\nHow many entree orders tonight?\n"))
    for order_no in range(1, (entree_qty + 1)):
        #Chicken,Steak, Wings, Pasta, Seafood Platter
        entree_order = input(f"\nWhat is order #{order_no}\n")
        if entree_order == "Chicken":
            guest_wallet = guest_wallet - food_menu["Entrees"]["Chicken"]["Price"]
        elif entree_order == "Wings":
            guest_wallet = guest_wallet - food_menu["Entrees"]["Wings"]["Price"]
        elif entree_order == "Pasta":
            guest_wallet = guest_wallet - food_menu["Entrees"]["Pasta"]["Price"]
        elif entree_order == "Seafood Platter":
            guest_wallet = guest_wallet - food_menu["Entrees"]["Seafood_Platter"]["Price"]
        else:
            print("The selection you made is unfortunately not part of the appetizer options")
    
elif maincourse_qn == "no" or maincourse_qn == "No":
    print("Got it. I'll give you a few and I'll return to take your dessert order\n")

else:
    print("An improper response was input. Please try again if you like.\n")

time.sleep(5)


# Taking the guest(s) dessert order

print("\nStill got space for dessert? We've got; Ice Cream, Brulle, Cake or Youghurt.\n")
dessert_qn = input("\nPlease enter 'yes' or 'no'\n")
if dessert_qn == "yes" or dessert_qn == "Yes":
    dessert_qty = int(input("\nHow many dessert orders tonight?\n"))
    for order_no in range(1, (dessert_qty + 1)):

        dessert_order = input(f"\nWhat is order #{order_no}\n")
        if dessert_order == "Ice Cream":
            guest_wallet = guest_wallet - food_menu["Desserts"]["Ice_cream"]["Price"]
        elif dessert_order == "Brulle":
            guest_wallet = guest_wallet - food_menu["Desserts"]["Brulle"]["Price"]
        elif dessert_order == "Cake":
            guest_wallet = guest_wallet - food_menu["Desserts"]["Cake"]["Price"]
        elif dessert_order == "Youghurt":
            guest_wallet = guest_wallet - food_menu["Desserts"]["Youghurt"]["Price"]
        else:
            print("The selection you made is unfortunately not part of the appetizer options")
    
elif dessert_qn == "no" or dessert_qn == "No":
    check_qn = input("Got it. I'll get you the check now...")

else:
    print("\nAn improper response was input. Please try again if you like.\n")

print("I'll get you the check now...")
time.sleep(5)
if guest_wallet > 0:
    print(f"\nYou still have a balance with us of ${guest_wallet}\n")
else:
    print(f"\nIt appears you have exceeded the credit you had with us, that you owe ${guest_wallet}")
    owe_qn = input("\nHow do you intend to pay; cash or credit?")

    if owe_qn in [ "cash", "credit", "Cash", "Credit"]:
        print("Thanks for your payment")
    else:
        print("It appears you don't have means to clear the bill")
        time.sleep(2)
        print("I'm afraid as per business policy we will have to call the cops")
        print("Or you'll have to do the assist with the closing activities of the business. You pick")
        
