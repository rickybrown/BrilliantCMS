icons = new Skycons('color': '#73879C')
list = [
  'clear-day'
  'clear-night'
  'partly-cloudy-day'
  'partly-cloudy-night'
  'cloudy'
  'rain'
  'sleet'
  'snow'
  'wind'
  'fog'
]
i = undefined
i = list.length
while i--
  icons.set list[i], list[i]
icons.play()