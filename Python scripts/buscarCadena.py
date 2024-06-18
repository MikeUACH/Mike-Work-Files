# Make a function that looks for a certain string, and when it finds it, replaces that string with the new strin.

arr1= ['DirSummary.txt|@&88|@&AMIoil17GasOnLineCartersville Reactor Siemens_D418200 MT|@&Cartersville Reactor Siemens_D418200 MT|@&GasOnLine|@&06/11/2024 4:59:03|@&'
       , 'DirSummary.txt|@&88|@&AMIoil17GasOnLineCartersville Reactor Siemens_D418200 LTC|@&Cartersville Reactor Siemens_D418200 LTC|@&GasOnLine|@&06/11/2024 4:59|@&']

arr2= ['DirSummary.txt|@&88|@&AMIoil17GasOnLineCartersville Reactor Siemens_D418200 MT| @&Cartersville Reactor Siemens_D418200 MT|@&GasOnLine|@&06/10/2024 16:59:03|@&'
       ,'DirSummary.txt|@&88|@&AMIoil17GasOnLineCartersville Reactor Siemens_D418200 LTC|@&Cartersville Reactor Siemens_D418200 LTC|@&GasOnLine|@&06/09/2024 20:56:04|@&' ]
"""
This function is designed to replace a specific string in a list of strings.

Parameters:
arr (list): A list of strings where the replacement operation will be performed.
old_str (str): The string to be replaced.
new_str (str): The string to replace the old_str.

Returns:
list: A new list with the replaced strings.

Example:
>>> replace_string(['Hello, world!', 'Hello, AI!'], 'world', 'AI')
['Hello, AI!', 'Hello, AI!']
"""
def replace_string(arr, old_str, new_str):
    return [s.replace(old_str, new_str) for s in arr]

print(f'String replaced {replace_string(arr1, "strin", "string")}')