Components = {};

local __ComponentsDefault = [[
    table = {
        insert = table.insert,
        remove = table.remove, 
        concat = table.concat, 
        sort = table.sort, 
        setn = table.setn,
        maxn = table.maxn,
        getn = table.getn,
        foreachi = table.foreachi,
        foreach = table.foreach,
        unpack = table.unpack,
    
        -- Add values from the source table to the target table
        merge_keytbl=function(a,b)local c={}for d,e in pairs(b)do if type(e)=='table'then c[d]=table.merge(a[d]or{},e)else c[d]=e end end;return c end,
        findIndex=function(a,b)for c=1,#a do if b(a[c],c)then return c end end;return false end,
        findIndex_keytbl=function(a,b)for c,d in pairs(a)do if b(d,c)then return c end end;return false end,
        find=function(a,b)for c=1,#a do if b(a[c],c)then return a[c]end end;return false end,
        find_keytbl=function(a,b)for c,d in pairs(a)do if b(d,c)then return d,c; end end;return false end,
        map=function(a,b)local c={}for d=1,#a do c[d]=b(a[d],d,a)end;return c end, 
        map_keytbl=function(a,b)local c={}for d,e in pairs(a)do local f,g=b(e,d,a)c[g~=nil and g or d]=f end;return c end,
        filter=function(a,b)local c={}for d=1,#a do if b(a[d],d)then table.insert(c,a[d])end end;return c end, 
        filter_keytbl=function(a,b)local c={}for d,e in pairs(a)do if b(e,d)then c[d]=e end end;return c end, 
        copy=function(a)local b={}for c,d in pairs(a)do b[c]=d end;return b end, 
        compare_keytbl=function(a,b)for c,d in pairs(a)do if not b[c]or type(d)~=type(b[c])or d~=b[c]then return false end end;return true end
    };

    string.split = function(a,b)if b==nil then b="%s"end;local c={}for d in string.gmatch(a,"([^"..b.."]+)")do table.insert(c,d)end;return c end
]];

function requireComponent(list)
    local str = __ComponentsDefault;

    if (type(list) == "string" and Components[list]) then 
        return Components[list];
    elseif (type(list) == "table") then 
        for id, comp in pairs(Components) do 
            str = str .. comp .. "\n\n";
        end 
    end 

    return str;
end 

load(assert(__ComponentsDefault))();
exports("require", requireComponent);