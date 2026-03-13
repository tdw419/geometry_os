import python_to_geoasm

with open("demo_counter.py", "r") as f:
    source = f.read()

geoasm_code = python_to_geoasm.transpile(source)
print(geoasm_code)
