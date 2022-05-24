function distance = calcs_distance(citylat1,citylon1,citylat2,citylon2)
    R = 6378.137;
    dLat = citylat1 * pi / 180 - citylat2  * pi / 180;
    dLon = citylon1 * pi / 180 - citylon2 * pi / 180;
    a = sin(dLat/2) * sin(dLat/2) + cos(citylat1 * pi/ 180) ...
       * cos(citylat2 * pi / 180) * sin(dLon/2) * sin(dLon/2);
    c = 2 * atan2(sqrt(a), sqrt(1-a));
    distance = R * c;
end