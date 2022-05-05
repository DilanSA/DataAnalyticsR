require(pacman)
pacman::p_load(raster, rgdal, rgeos, gtools, tidyverse,rnaturalearth,rnaturalearthdata,
               sf, reticulate,maptools,maps, ggplot2 ,ggspatial, rgeos, ggmap , leaflet,
               reticulate,colorspace, ghibli, cartography,png, broom, leaflet.extras, leaflet.providers, 
               leafem, htmlwidgets, sp,readxl, mapview,  RColorBrewer, viridis, Rgb, rmarkdown,
               maps, ggthemes, stringr, cowplot, ggpubr, ggpatial, viridisLite, viridis, openxlsx, ggrepel)
library(pacman)
world        <- ne_countries(scale= "medium", returnclass = "sf")           
world.SA     <- subset(world, continent=="South America")   
mapa_peru <- getData('GADM', country='Peru', level=1) %>% st_as_sf() #level=1 -> Regiones
mapa_peru_2 <- getData('GADM', country='Peru', level=2) %>% st_as_sf() #level=2 -> Provincias
mapa_peru_3 <- getData('GADM', country='Peru', level=3) %>% st_as_sf() #level=3 -> Distritos

########## MAPA IFI LIMA-CALLAO ##################

png(filename = "lima_callao_IFI.png", width=21, height=29, units="cm", res = 900)
ggplot() +
  geom_sf(data = mapa_peru %>% filter(NAME_1=="Lima"), fill = "beige") +
  geom_sf(data = mapa_peru_3 %>% filter(NAME_1=="Lima Province"),lwd=0.2, fill= "gray99", color="gray58",alpha = 1, linetype = 1) +
  geom_sf(data = mapa_peru %>% filter(NAME_1=="Lima Province"),lwd=0.8, fill= NA, color="gray32",alpha = 1, linetype = 1) +
  geom_sf(data = mapa_peru_3 %>% filter(NAME_1=="Callao"),lwd=0.2, fill= "gray99", color="gray58",alpha = 1, linetype = 1) +
  geom_sf(data = mapa_peru %>% filter(NAME_1=="Callao"),lwd=0.8, fill= NA, color="gray32",alpha = 1, linetype = 1) +
  annotate(geom = "point", x = -77.125736, y = -12.06371, size = 5, color= "red") +
  annotate(geom = "point", x = -77.01693007, y = -12.18246924, size = 5, color= "red") +
  labs(x = 'Longitud', y = 'Latitud') +
  coord_sf(xlim = c(-77.26,-76.61), ylim = c(-12.53,-11.56),expand = FALSE) +
  theme_bw() +
  theme(legend.position = 'bottom',
        panel.background = element_rect(fill = "lightblue1"))
dev.off()
