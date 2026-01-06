import matplotlib as plt
import cartopy.crs as ccrs
import cartopy.feature as cfeature
import pandas as pd

# Liste mit Orten von Geo-Koordinaten
orte = [
    {'name': 'Paris', 'lat': 48.8566, 'lon': 2.3522},
    {'name': 'Lyon', 'lat': 45.7589, 'lon': 4.8492},
    {'name': 'Marseille', 'lat': 43.2965, 'lon': 5.3698},
    {'name': 'Bordeaux', 'lat': 44.8378, 'lon': -0.5792},
]

# Liste von Reisen von Ort zu Ort inkl. Datum
reisen = [
    {'von': 'Paris', 'nach': 'Lyon', 'datum': '2022-01-01'},
    {'von': 'Lyon', 'nach': 'Marseille', 'datum': '2022-01-05'},
    {'von': 'Marseille', 'nach': 'Bordeaux', 'datum': '2022-01-10'},
    {'von': 'Bordeaux', 'nach': 'Paris', 'datum': '2022-01-15'},
]

# Erstellen einer Karte von Frankreich
fig = plt.figure(figsize=(10, 10))
ax = fig.add_subplot(1, 1, 1, projection=ccrs.PlateCarree())

# Hinzufügen von Karten-Features
ax.add_feature(cfeature.LAND)
ax.add_feature(cfeature.OCEAN)
ax.add_feature(cfeature.COASTLINE)
ax.add_feature(cfeature.BORDERS, linestyle='--')

# Hinzufügen von Orten
for ort in orte:
    ax.plot(ort['lon'], ort['lat'], 'bo', transform=ccrs.PlateCarree())
    ax.text(ort['lon'], ort['lat'], ort['name'], transform=ccrs.PlateCarree())

# Hinzufügen von Reisen
for reise in reisen:
    von_ort = next((o for o in orte if o['name'] == reise['von']), None)
    nach_ort = next((o for o in orte if o['name'] == reise['nach']), None)
    if von_ort and nach_ort:
        ax.plot([von_ort['lon'], nach_ort['lon']], [von_ort['lat'], nach_ort['lat']], 'r-', transform=ccrs.PlateCarree())
        ax.text((von_ort['lon'] + nach_ort['lon']) / 2, (von_ort['lat'] + nach_ort['lat']) / 2, reise['datum'], transform=ccrs.PlateCarree())

# Anpassen der Karten-Einstellungen
ax.set_extent([2, 10, 40, 52])
ax.set_title('Reisen in Frankreich')

# Anzeigen der Karte
plt.show()