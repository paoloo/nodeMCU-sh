led = function(estado) -- estado = true ou false/nil
  gpio.mode(0, gpio.OUTPUT) -- pino #0, nos nodeMCUs chineses que usamos
  if estado then gpio.write(0, gpio.LOW) else gpio.write(0, gpio.HIGH) end
end
