#!/bin/bash

echo "Starting script to set up ICT Soil Moisture Dendrometer Probe with Streambed"

lora type add soil-dendrometer-data-up-mac-payload "ICT Soil Moisture and Dendrometer Station"

streambed observation-type add vwc-count-data-up-json \
  --name 'ICT VWC Count Observations' \
  --secret-path secrets.plant-vwc-count.key \
  --view - < ../soil-moisture/observation-types/vwc-count-data-up-json/main/view.js

streambed observation-type add temperature-data-up-json \
  --name 'ICT Temperature Observations' \
  --secret-path secrets.plant-temperature.key \
  --view - < ../soil-moisture/observation-types/temperature-data-up-json/main/view.js

streambed observation-type add ec-data-up-json \
  --name 'ICT EC Observations' \
  --secret-path secrets.plant-ec.key \
  --view - < ../soil-moisture/observation-types/ec-data-up-json/main/view.js

streambed observation-type add vwc-data-up-json \
  --name 'ICT VWC Observations' \
  --secret-path secrets.plant-vwc.key \
  --view - < ../soil-moisture/observation-types/vwc-data-up-json/main/view.js

streambed observation-type add stem-diameter-data-up-json \
  --name 'ICT Stem Diameter Observations' \
  --secret-path secrets.plant-stem-diameter.key \
  --view - < ../dendrometer/observation-types/stem-diameter-data-up-json/main/view.js

streambed observation-type add stem-temperature-data-up-json \
  --name 'ICT Stem Diameter Observations' \
  --secret-path secrets.plant-stem-temperature.key \
  --view - < ../dendrometer/observation-types/stem-temperature-data-up-json/main/view.js

streambed secret add secrets.plant-vwc-count.key 3B7E151628AED2A6ABF7158809CF4F3A
streambed secret add secrets.plant-temperature.key 3B7E151628AED2A6ABF7158809CF4F3A
streambed secret add secrets.plant-ec.key 3B7E151628AED2A6ABF7158809CF4F3A
streambed secret add secrets.plant-vwc.key 3B7E151628AED2A6ABF7158809CF4F3A
streambed secret add secrets.plant-stem-diameter.key 3B7E151628AED2A6ABF7158809CF4F3A
streambed secret add secrets.plant-stem-temperature.key 3B7E151628AED2A6ABF7158809CF4F3A

lora end-device add soil-dendrometer-data-up-mac-payload v1 abp \
  --dev-eui 0081C343189D832A \
  --dev-addr 189D832A \
  --app-s-key 6D5E58EF92BBCE878894497271BA90ED \
  --nwk-s-key F82D9DA9EA6E88EA9DC40A98E6B90DAA \
  --pos "-33.890304,151.1931904" \
  --name "My ICT Soil Moisture Dendrometer Sensor"

streambed transformer add \
  --name 'My ICT Soil Moisture Dendrometer Transformer' \
  --inlet-topic soil-dendrometer-data-up-mac-payload \
  --outlet-topic stem-diameter-data-up-json stem-temperature-data-up-json vwc-count-data-up-json temperature-data-up-json ec-data-up-json vwc-data-up-json \
  --source - < ./transformers/main/source.js

streambed mqtt add down \
  tutorial-soil-dendrometer \
  /tutorial/soil-dendrometer/app2dev/data \
  soil-dendrometer-data-up-mac-payload \
  --data-is-binary

streambed dashboard add --name 'Soil Moisture' --source - < ../soil-moisture/dashboards/main/source.js
streambed dashboard add --name 'Dendrometer' --source - < ../dendrometer/dashboards/main/source.js