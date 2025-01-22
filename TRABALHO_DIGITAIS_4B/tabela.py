def decimal_to_bcd(n):
    bcd = f"{n:04d}"
    return ''.join([f"{int(d):04b}" for d in bcd])

print("bcd_table_type := (")
for i in range(256):
    bcd = decimal_to_bcd(i)
    print(f"    {i:3d} => \"{bcd}\",")
print(");")
