import math

def uptime_percentage(total_runtime, total_downtime):
	print("\nAlright I will calculate how long your service was down for your process.\n")
	percentage = ((total_runtime - total_downtime)/total_runtime * 100) # calculation of the uptime checker
	return round(percentage, 2)
	
total_runtime = float(input("Punch in the total runtime of the process; ")) # prompt to enter total time the process was running
total_downtime = float(input("Punch in the downtime of the process; ")) # prompt to enter time the process was down

# passing the function to a variable so that it can be re-used
answer = uptime_percentage(total_runtime, total_downtime)

print(f"The uptime of your process is {answer}%")
