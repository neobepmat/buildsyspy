from buildSystemConfiguration import BuildSystemConfiguration

pippo = BuildSystemConfiguration("11-4-U.ini")
pippo.Read_Ini()
pippo.print_func()

pippo = BuildSystemConfiguration("11-10-U.ini")
pippo.Read_Ini()
pippo.print_func()