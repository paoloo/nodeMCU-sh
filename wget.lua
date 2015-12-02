-- tentativa de fazer um wget. Funciona para pequenos arquivios,tentar corrigir para qualquer tamanho

wget = function(endereco,caminho,saida,porta)
    porta = porta or 80
    saida = saida or "output-wget"
    print("salvando "..endereco..":"..porta..caminho.." em "..saida.."!")
    file.open(saida, "w")
    s=net.createConnection(net.TCP, 0)
    s:on("receive", function(sck, c) file.write(c) file.flush() end )
    s:on("disconnection", function(c) c = nil; file.close() end)
    s:connect(porta, endereco)
    s:send("GET "..caminho.." HTTP/1.1\r\n"..
           "Host: "..endereco.."\r\n"..
           "Connection: keep-alive\r\n"..
           "User-Agent: uPNP/1.0\r\n"..
           "Accept-Charset: utf-8\r\n"..
           "Accept: */*\r\n\r\n"
          )
end
