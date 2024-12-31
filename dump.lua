function dump(o, indent)
   indent = indent or 0
   local indentStr = string.rep("  ", indent)
   if type(o) == 'table' then
      local s = '{\n'
      for k, v in pairs(o) do
         if type(k) ~= 'number' then k = '"' .. k .. '"' end
         s = s .. indentStr .. '  [' .. k .. '] = ' .. dump(v, indent + 1) .. ',\n'
      end
      return s .. indentStr .. '}'
   else
      return tostring(o)
   end
end
