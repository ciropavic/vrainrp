function AsdJSONInsert(databasename, needinsert)
local loadFile= LoadResourceFile(GetCurrentResourceName(), databasename)
local extract = {}
extract = json.decode(loadFile)
table.insert(extract, needinsert)
SaveResourceFile(GetCurrentResourceName(), databasename, json.encode(extract), -1)
end

function AsdJSONSelectAll(databasename)
local loadFile= LoadResourceFile(GetCurrentResourceName(), databasename)
local extract = {}
extract = json.decode(loadFile)
return extract
end

function AsdJSONDeleteWhere(databasename, wheretable)
local extract = AsdJSONSelectAll(databasename)
for _2,v2 in pairs(extract) do
	for _,v in pairs(wheretable) do
		print(v, v2[_], _2)
		if v == v2[_] and v == v2 then
			print(_2)
			table.remove(extract, _2)
		end
	end
end	
SaveResourceFile(GetCurrentResourceName(), databasename, json.encode(extract), -1)	
end
	