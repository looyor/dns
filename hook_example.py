import json,sys
req=json.load(sys.stdin)
host=req.get('host',''); path=req.get('path','')
print(f"<!doctype html><meta charset=utf-8><h1>Hooked {host}</h1><p>{path}</p>")