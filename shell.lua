local shell = {}

function shell.cat(arquivo)
  file.open(arquivo,"r")
  print(file.read())
  file.close()
end

function shell.ls()
  for k,v in pairs(file.list()) do
    print(k,v)
  end
end

function shell.ip()
  print(wifi.sta.getip())
end

function shell.wifi(rede,senha)
  wifi.setmode(wifi.STATION)
  wifi.sta.config(rede,senha)
end

function shell.lswifi()
  function listap(t)
    for k,v in pairs(t) do
      print(k.." : "..v)
    end
  end
  wifi.sta.getap(listap)
end

function shell.rm(arquivo)
  file.remove(arquivo)
end

function shell.mv(org, dst)
  file.rename(org, dst)
end

function shell.cp(org, dst)
  file.open(org,"r")
  local conteudo = file.read()
  file.close()
  file.open(dst,"w")
  file.write(conteudo)
  file.close()
end

function shell.df()
  _r, _u, _t=file.fsinfo()
  print("Size\tUsed\tAvail\n".._t.."\t".._u.."\t".._r.."\n")
end

return shell
