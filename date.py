# A script that simulates a guy's on a date with his wife and 2 kids

# The script will capture the names of the party and what they can eat

# The script will capture how much the person paying can spend for the night

# While tallying the total cost, the script will commence with the party ushered into the
# restaurant with appetizers (Apps) and a drink each.


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
            # If value isn't a dictionary, key + value to be printed on the same line 
            print("  " * indent + f"{key}: {value}")

# Call the function to print the entire nested dictionary
print("\nC5-KURA RESTAURANT")
print("==================\n")

guest_name = str(input("Please input who we have the chance of serving tonight\n\n"))

print(f"\nWelcome to C5-Kura Restaurant, {guest_name}")

print(f"\nHere, {guest_name}, is the menu to choose from...")

print_foodmenu(food_menu) #printing the restaurant's food menu.

guest_wallet = float(input("\nPer policy, please let us know of how much you atleast intend to spend tonight.\n"))

print(f"\nGotcha. We understand you intend to spend atleast ${guest_wallet} tonight.\n")


night_total = float(0)
total1 = float(0)
total2 = float(0)
total3 = float(0)
total4 = float(0)

# Taking the guest(s) order
print("\nWith that, allow me take your order, now - if you're ready...")

time.sleep(1) #for drammatic effect

# Taking the guest(s) drinks order
drinks_response = str(input("\nWant any drinks? Please enter yes or no.\n"))

if drinks_response.lower() == 'yes':
    drinks = str(input("\nWhat will it be; Water, Soda or Fresh Juice; that is Passion Juice, Apple Juice, Melon Juice ?\n"))
    drinks_qty = int(input("\nHow many would you like?\n"))

    if drinks.lower() == "water":
        total1 = total1 + (food_menu["Beverages"]["Water"]["Price"] * drinks_qty)
    elif drinks.lower() == "soda":
        total1 = total1 + (food_menu["Beverages"]["Soda"]["Price"] * drinks_qty)
    elif drinks.lower() == "passion juice" or drinks.lower() == "apple juice" or drinks.lower() == "melon juice":
        total1 = total1 + (food_menu["Beverages"]["Fresh_juice"]["Price"] * drinks_qty)
    else:
        print("The selection you made is unfortunately not part of the drinks options")
        
elif drinks_response.lower() == 'no':
    print("\nGot it. Let us know if you'd like anything else.\n")

else:
    print("An improper response was input. Please try again if you like.\n")

if total1 > guest_wallet:
    print(f"Per policy, you've so far used ${round(total1, 2)}, leaving you with a balance of ${round((guest_wallet - total1), 2)}")
else:
    print(f"Per policy, you've so far used ${round(total1, 2)}, leaving you with a balance of ${abs(round((guest_wallet - total1), 2))}")


# Taking the guest(s) appetizers' order
time.sleep(2)
apps_response = str(input("\nWant any appetizers? Please enter yes or no.\n"))

if apps_response.lower() == 'yes':
    appetizers = str(input("\nWhat will it be; Samosas, Nachos or Spring Rolls?\n"))

    if appetizers.lower() == "samosas":
        samosas_qty = int(input("\nHow many would you like?\n"))
        total2 = total2 + food_menu["Apps"]["Samosas"]["Price"] * samosas_qty
    elif appetizers.lower() == "nachos":
        nachos_qty = int(input("\nHow many would you like?\n"))
        total2 = total2 + food_menu["Apps"]["Nachos"]["Price"] * nachos_qty
    elif appetizers.lower() == "spring rolls":
        rolls_qty = int(input("\nHow many would you like?\n"))
        total2 = total2 + (food_menu["Apps"]["Spring Rolls"]["Price"] * rolls_qty)
    else:
        print("The selection you made is unfortunately not part of the appetizer options")

elif apps_response.lower() == "no":
    print("Got it. I'll give you a few and I'll return to take your entrees\n")

else:
    print("An improper response was input. Please try again if you like.\n")

if (total1 + total2) < guest_wallet:
    print(f"Per policy, you've so far used ${round((total1 + total2), 2)}, leaving you with a balance of ${round((guest_wallet - total1 - total2), 2)}")
else:
    print(f"Per policy, you've so far used ${round((total1 + total2), 2)}. Meaning you've exceeded your night's buget by ${abs(round((guest_wallet - total1 - total2), 2))}")


time.sleep(2)
 

# Taking the guest(s) maincourse order
time.sleep(3)

maincourse_qn = str(input("\nAre you ready to place your Entree and a side order or should I return later? Please enter 'yes' or 'no'\n"))
if maincourse_qn.lower() == "yes":

    entree_qty = int(input("\nHow many entree orders tonight?\n"))
    print("Chicken, Steak, Wings, Pasta or Seafood Platter")
    for order_no in range(1, (entree_qty + 1)):
        
        entree_order = input(f"\nWhat is order #{order_no}?\n")
        if entree_order.lower() == "chicken":
            total3 = total3 + food_menu["Entrees"]["Chicken"]["Price"]
            side_qn = str(input("\nAnd a what side with it, please? We've got Fries, Veggies or Mashed Potatoes\n"))
            if side_qn.lower() == "fries":
                print("\nFries it is!! So Chicken & Fries\n")
                total3 = total3 + food_menu["Sides"]["Fries"]["Price"]
            elif side_qn.lower() == "mashed potatoes":
                print("\nGot it. So Chicken & Mashed Potatoes\n")
                total3 = total3 + food_menu["Sides"]["Mashed_potatoes"]["Price"]
            elif side_qn.lower() == "veggies":
                print("\nVeggies, huh!. So Chicken & Veggies\n")
                total3 = total3 + food_menu["Sides"]["Veggies"]["Price"]
            else:
                print("The selection you made is unfortunately not part of the Entree options")
        elif entree_order.lower() == "wings":
            total3 = total3 + food_menu["Entrees"]["Wings"]["Price"]
            side_qn = str(input("And a what side with it, please? We've got Fries, Veggies or Mashed Potatoes\n"))
            if side_qn.lower() == "fries":
                print("\nFries it is!! So Wings & Fries\n")
                total3 = total3 + food_menu["Sides"]["Fries"]["Price"]
            elif side_qn.lower() == "mashed potatoes":
                print("\nGot it. So Wings & Mashed Potatoes\n")
                total3 = total3 + food_menu["Sides"]["Mashed_potatoes"]["Price"]
            elif side_qn.lower() == "veggies":
                print("\nVeggies, huh!. So Wings & Veggies\n")
                total3 = total3 + food_menu["Sides"]["Veggies"]["Price"]
            else:
                print("The selection you made is unfortunately not part of the Entree options")
        elif entree_order.lower() == "pasta":
            total3 = total3 + food_menu["Entrees"]["Pasta"]["Price"]
            side_qn = str(input("And a what side with it, please? We've got Fries, Veggies or Mashed Potatoes\n"))
            if side_qn.lower() == "fries":
                print("\nFries it is!! So Pasta & Fries\n")
                total3 = total3 + food_menu["Sides"]["Fries"]["Price"]
            elif side_qn.lower() == "mashed potatoes":
                print("\nGot it. So Pasta & Mashed Potatoes\n")
                total3 = total3 + food_menu["Sides"]["Mashed_potatoes"]["Price"]
            elif side_qn.lower() == "veggies":
                print("\nVeggies, huh!. So Pasta & Veggies\n")
                total3 = total3 + food_menu["Sides"]["Veggies"]["Price"]
            else:
                print("The selection you made is unfortunately not part of the Entree options")
        elif entree_order.lower() == "seafood platter":
            total3 = total3 + food_menu["Entrees"]["Seafood_Platter"]["Price"]
            side_qn = str(input("And a what side with it, please? We've got Fries, Veggies or Mashed Potatoes\n"))
            if side_qn.lower() == "fries":
                print("\nFries it is!! So Seafood Platter & Fries\n")
                total3 = total3 + food_menu["Sides"]["Fries"]["Price"]
            elif side_qn.lower() == "mashed potatoes":
                print("\nGot it. So Seafood Platter & Mashed Potatoes\n")
                total3 = total3 + food_menu["Sides"]["Mashed_potatoes"]["Price"]
            elif side_qn.lower() == "veggies":
                print("\nVeggies, huh!. So Seafood Platter & Veggies\n")
                total3 = total3 + food_menu["Sides"]["Veggies"]["Price"]
            else:
                print("The selection you made is unfortunately not part of the Entree options")
        elif entree_order.lower() == "steak":
            total3 = total3 + food_menu["Entrees"]["Seafood_Platter"]["Price"]
            side_qn = str(input("And a what side with it, please? We've got Fries, Veggies or Mashed Potatoes\n"))
            if side_qn.lower() == "fries":
                print("\nFries it is!! So Steak & Fries\n")
                total3 = total3 + food_menu["Sides"]["Fries"]["Price"]
            elif side_qn.lower() == "mashed potatoes":
                print("\nGot it. So Steak & Mashed Potatoes\n")
                total3 = total3 + food_menu["Sides"]["Mashed_potatoes"]["Price"]
            elif side_qn.lower() == "veggies":
                print("\nVeggies, huh!. So Steak & Veggies\n")
                total3 = total3 + food_menu["Sides"]["Veggies"]["Price"]
            else:
                print("The selection you made is unfortunately not part of the Entree options")
        else:
            print("The selection you made is unfortunately not part of the Entree options")
    
elif maincourse_qn.lower() == "no":
    print("Got it. I'll give you a few and I'll return to take your dessert order\n")

else:
    print("An improper response was input. Please try again if you like.\n")


if (total1 + total2 + total3) < guest_wallet:
    print(f"Per policy, you've so far used ${round((total1 + total2 + total3), 2)}, leaving you with a balance of ${round((guest_wallet - total1 - total2 - total3), 2)}")
else:
    print(f"Per policy, you've so far used ${round((total1 + total2 + total3), 2)}. Meaning you've exceeded your night's buget by ${abs(round((guest_wallet - total1 - total2 - total3), 2))}")


time.sleep(3)


# Taking the guest(s) dessert order

print("\nWould you want any dessert? We've got; Ice Cream, Brulle, Cake or Youghurt.\n")
dessert_qn = str(input("Please enter 'yes' or 'no'\n"))
if dessert_qn.lower() == "yes":
    dessert_qty = int(input("\nHow many dessert orders tonight?\n"))
    for order_no in range(1, (dessert_qty + 1)):

        dessert_order = str(input(f"\nWhat is order #{order_no}?\n"))
        if dessert_order.lower() == "ice cream":
            total4 = total4 + food_menu["Desserts"]["Ice_Cream"]["Price"]
        elif dessert_order.lower() == "cake":
            total4 = total4 + food_menu["Desserts"]["Cake"]["Price"]
        elif dessert_order.lower() == "youghurt":
            total4 = total4 + food_menu["Desserts"]["Youghurt"]["Price"]
        else:
            print("The selection you made is unfortunately not part of the appetizer options")
    
elif dessert_qn.lower() == "no":
    print("Got it. I'll get you the check now...")

else:
    print("\nAn improper response was input. Please try again if you like.\n")

if (total1 + total2 + total3 + total4) < guest_wallet:
    print(f"Per policy, you've so far used {round((total1 + total2 + total3 + total4), 2)}, leaving you with a balance of", round((guest_wallet - total1 - total2 - total3 - total4), 2))
else:
    print(f"Per policy, you've so far used {round((total1 + total2 + total3 + total4), 2)}. Meaning you've exceeded your night's buget by ${abs(round((guest_wallet - total1 - total2 - total3 - total4), 2))}")



print("I'll get you the check now...")

time.sleep(5)

if guest_wallet > (total1 + total2 + total3 + total4):
    print(f"\nYou still have a balance with us of ${(guest_wallet - (total1 + total2 + total3 + total4))}\n")
else:
    print(f"\nIt appears you have exceeded the credit you had with us, now you owe ${abs(guest_wallet - (total1 + total2 + total3 + total4))}")
    owe_qn = input("\nHow do you intend to pay; cash or credit?")

    if owe_qn in [ "cash", "credit", "Cash", "Credit"]:
        print("\nThanks for your payment")
    else:
        print("\nIt appears you don't have the means to clear the bill")
        time.sleep(2)
        print("\nI'm afraid as per business policy we will have to call the cops")
        print("\nOr you'll have to do the assist with the closing activities of the business. Your pick ;-)")
        
