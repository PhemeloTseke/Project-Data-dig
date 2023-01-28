/* Querying Data! */

CREATE TABLE badges (
    date TEXT,
    badge_type TEXT,
    badge_name TEXT,
    energy_points INTEGER
);

INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 04/12", "Sun", "Oracle", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 04/28", "Earth", "Incredible Inspiration", 5000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 01/29", "Challenge Patch", "Intro to JS: Drawing & Animation Mastery", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2014, 12/05", "Meteorite", "Thumbs Up", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 04/28", "Moon", "1000 Kelvin", 1000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 04/25", "Earth", "299,792,458 Meters per Second", 5000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 03/20", "Sun", "Da Vinci", 200000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 03/02", "Sun", "Newton", 150000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 03/02", "Sun", "Hypatia", 125000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 02/24", "Sun", "Kepler", 125000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 02/24", "Sun", "Copernicus", 80000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 02/07", "Sun", "Sally Ride", 35000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 01/06", "Sun", "Magellan", 30000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 02/24", "Earth", "Guru", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2014, 12/29", "Earth", "Work Horse", 14000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2014, 10/20", "Moon", "Redwood", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2013, 10/20", "Meteorite", "Cypress", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 03/18", "Sun", "Millionaire", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 02/27", "Earth", "Five Times Ten to the Fifth", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 04/04", "Earth", "Investigator", 0);

/*Querying the data*/

SELECT * FROM badges;

/*How many days did we have certain points = 9days we didnt get any points*/

SELECT COUNT(*), date, energy_points,
CASE
    WHEN energy_points <= 0 THEN "No Points"
    WHEN energy_points <= 20000 THEN "Low Points"
    WHEN energy_points <= 40000 THEN "Medium Points"
    WHEN energy_points <= 60000 THEN "Good Points"
    WHEN energy_points <= 80000 THEN "High Points"
    WHEN energy_points <= 100000 THEN "Excellent Points"
    WHEN energy_points <= 1200000 THEN "Magnificent Points"
    WHEN energy_points <= 1400000 THEN "Top Archiever"
    ELSE "Great Perfomance"
    END "Perfomance Rate"
FROM badges
GROUP BY "Perfomance Rate" ORDER BY energy_points DESC;

/*How many accumulated points we have of each badge_type*/

SELECT badge_type, SUM(energy_points) as "Accumulated_Points"
FROM badges GROUP BY badge_type ORDER BY "Accumulated_Points";

/*Only show badge_types that have points allocated to them with how many badge_names are allocated to a specific badge_type*/

SELECT COUNT(*), badge_name, badge_type FROM badges WHERE badge_type IN("Moon", "Earth", "Sun") GROUP BY badge_type ORDER BY badge_type;

/*Only show badge_names which we've earned points for & dates we earned those points*/

SELECT date, badge_name, energy_points,

/*Cant wait to learn to create functions to call this CASE multiple-times or do something similar without having to re-write it multiple times*/

CASE
    WHEN energy_points <= 0 THEN "No Points"
    WHEN energy_points <= 20000 THEN "Low Points"
    WHEN energy_points <= 40000 THEN "Medium Points"
    WHEN energy_points <= 60000 THEN "Good Points"
    WHEN energy_points <= 80000 THEN "High Points"
    WHEN energy_points <= 100000 THEN "Excellent Points"
    WHEN energy_points <= 1200000 THEN "Magnificent Points"
    WHEN energy_points <= 1400000 THEN "Top Archiever"
    ELSE "Great Perfomance"
    END "Perfomance_Rate"

FROM badges WHERE energy_points > 0 ORDER BY energy_points;
