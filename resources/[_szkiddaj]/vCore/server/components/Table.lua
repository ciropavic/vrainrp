table.merge=function(a,b)for c,d in pairs(b)do if type(d)=='table'then a[c]=table.merge(a[c]or{},d)else if not a[c] then a[c]=d end end end;return a end
table.merge_keytbl=function(a,b)for c,d in pairs(b)do if type(d)=='table'then a[c]=table.merge_keytbl(a[c]or{},d)else if not a[c] then a[c]=d end end end;return a end
table.findIndex=function(a,b)for c=1,#a do if b(a[c],c)then return c end end;return false end
table.findIndex_keytbl=function(a,b)for c,d in pairs(a)do if b(d,c)then return c end end;return false end
table.find=function(a,b)for c=1,#a do if b(a[c],c)then return a[c]end end;return false end
table.find_keytbl=function(a,b)for c,d in pairs(a)do if b(d,c)then return d end end;return false end
table.map=function(a,b)local c={}for d=1,#a do c[d]=b(a[d],d,a)end;return c end 
table.map_keytbl=function(a,b)local c={}for d,e in pairs(a)do c[d]=b(e,d,a)end;return c end
table.filter=function(a,b)local c={}for d=1,#a do if b(a[d],d)then table.insert(c,a[d])end end;return c end 
table.copy=function(a)local b={}for c,d in pairs(a)do b[c]=d end;return b end 
table.compare_keytbl=function(a,b)for c,d in pairs(a)do if not b[c]or type(d)~=type(b[c])or d~=b[c]then return false end end;return true end