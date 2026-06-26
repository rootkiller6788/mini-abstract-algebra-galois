# expander
import os
BASE = "F:/nano-everything/mini-everything-math/4. mini-abstract-algebra-galois/mini-group-action-sylow/MiniGroupActionSylow"
def a(p,c):
 p2=os.path.join(BASE,p)
 os.makedirs(os.path.dirname(p2),exist_ok=True)
 with open(p2,"a",encoding="utf-8") as f: f.write(c)
 print(p,len(c.split(chr(10))))
print("ready")
