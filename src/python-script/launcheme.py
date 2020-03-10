# launcher per test purposes
import buildSystemConfiguration as b

t = b.BuildSystemConfiguration('11-4-U.ini')
t.Read_Ini()
t.print_func()

print "--------------------------------------"


t = b.BuildSystemConfiguration('11-4-U-R.ini')
t.Read_Ini()
t.print_func()