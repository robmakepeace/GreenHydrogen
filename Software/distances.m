citylat(1) = -23;
citylon(1) = 133;
citylat(2) = 0;
citylon(2) = 28;
citylat(3) = 49;
citylon(3) = 10;
citylat(4) = 42;
citylon(4) = 104;
citylat(5) = 38;
citylon(5) = -100;
citylat(6) = -14;
citylon(6) = -58;
locations = {'Oceania', 'Africa','Europe','Asia','North America','South America'}

R = 6378.137;
for x = 1:6
    for y = (x+1):6
        dLat = citylat(x) * pi / 180 - citylat(y)  * pi / 180;
        dLon = citylon(x) * pi / 180 - citylon(y) * pi / 180;
        a = sin(dLat/2) * sin(dLat/2) + cos(citylat(x) * pi/ 180) ...
            * cos(citylat(y) * pi / 180) * sin(dLon/2) * sin(dLon/2);
        c = 2 * atan2(sqrt(a), sqrt(1-a));
        d = R * c;
        disp(strcat(locations(x)," - ",locations(y),": ",string(d)," km"))
    end
end
