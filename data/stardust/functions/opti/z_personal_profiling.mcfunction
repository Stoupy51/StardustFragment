
##Personal function for '/perf start' command for profiling
##To determine which syntax is the most efficient
##Useful link: https://misode.github.io/report/

##To be taken with caution, example here:				1st report			2nd report
##execute if entity @e[type=player,distance=..9]		4.409 ms			4.274 ms
##execute if entity @a[distance=..9]					4.274 ms (best)		4.232 ms
##execute if entity @a[distance=..9.0]					4.290 ms			4.184 ms (best)
##execute if entity @e[type=player,distance=..9.0]		4.290 ms			4.195 ms
##Conclusion: they are equivalent in terms of efficiency, they are almost the same.
##You should use the 2nd one, because it is shorter and more readable.


execute if entity @e[type=player,distance=..9]
execute if entity @a[distance=..9]
execute if entity @a[distance=..9.0]
execute if entity @e[type=player,distance=..9.0]

