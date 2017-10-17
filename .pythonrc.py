# this is not working
#try:
    #import readline
#except ImportError:
    #print("Module readline not available.")
#else:
    #import rlcompleter
    #readline.parse_and_bind("tab: complete")

# Python auto complete in OSX
# https://rayed.com/wordpress/?p=1372
import readline
import rlcompleter
if 'libedit' in readline.__doc__:
    readline.parse_and_bind("bind ^I rl_complete")
else:
    readline.parse_and_bind("tab: complete")
