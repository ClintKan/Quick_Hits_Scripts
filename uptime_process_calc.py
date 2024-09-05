import math

def uptime_percentage(total_runtime, total_downtime):
	print("Alright I will calculate how long your service was down for your process.\n")
	percentage = ((total_runtime - total_downtime)/total_runtime * 100)
	return round(percentage, 2)
	
total_runtime = float(input("Punch in the total runtime of the process; "))
total_downtime = float(input("Punch in the downtime of the process; "))

print(f"The uptime of your process is {uptime_percentage(total_runtime, total_downtime)}%")
