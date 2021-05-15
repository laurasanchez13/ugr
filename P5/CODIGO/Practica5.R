library (tuneR)
library(seewave)
library (audio)

#Path de trabajo
setwd("C:/Users/laura/Desktop/UNIVERSIDAD/2cuatrimestre/PDIH/Practica5")


#Cargamos los sonidos
mario <- readWave("MARIOBROSS.wav")
juego <- readWave("JUEGODETRONOS.wav")


#Los escuchamos
listen (mario)
listen (juego)


#Dibujamos sus ondas
mario
plot( extractWave(mario, from = 1, to = 142953) )

juego
plot( extractWave(juego, from = 1, to = 152111) )


#Los mezclamos
mezcla <- pastew(mario, juego, output="Wave")
listen(mezcla)


#Dibujamos la onda de la mezcla
mezcla
plot( extractWave(mezcla, from = 1, to = 295064) )


#Eliminamos las frecuencias entre 10000Hz y 20000Hz
f <- mezcla@samp.rate
mezclasinfrecuencia <- bwfilter(mezcla,f=f, channel=1, n=1, from=1000,
                  to=2000, bandpass=TRUE, listen = FALSE, output = "Wave")
listen(mezclasinfrecuencia,f=f)


#Almacenamos la señal resultante
writeWave(mezclasinfrecuencia, file.path("mezcla.wav") )


#Cargamos otro sonido
rana <- readMP3 ("RANA.mp3")
listen (rana)

#Le aplicamos eco
rana
ranaECO <- echo(rana,f=44100,amp=c(0.9,0.3,0.1),delay=c(1,2,3),
                 output="Wave")
ranaECO@left <- 10000 * ranaECO@left
listen(ranaECO)


#Le damos la vuelta al sonido
alreves <- revw(ranaECO, output="Wave")
listen (alreves)


#Almacenamos la señal
writeWave(alreves, file.path("alreves.wav") )





