import math

def uptime_percentage (total_runtime, total_downtime):
	input("Alright I will calculate how long your service was down for your process.\n")
	percentage = ((total_runtime / total_downtime) * 100)
	answer = round(percentage, 2)
	

print(f"The uptime of your process is {answer}")
