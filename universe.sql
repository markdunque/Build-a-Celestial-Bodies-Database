CREATE DATABASE universe;
\c universe

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(80) NOT NULL UNIQUE,
  galaxy_type VARCHAR(40) NOT NULL,
  discovered_year INT,
  is_observable BOOLEAN NOT NULL,
  description TEXT
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(80) NOT NULL UNIQUE,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
  mass_solar NUMERIC(8, 3) NOT NULL,
  surface_temperature_kelvin INT NOT NULL,
  is_main_sequence BOOLEAN NOT NULL
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(80) NOT NULL UNIQUE,
  star_id INT NOT NULL REFERENCES star(star_id),
  orbital_period_days INT NOT NULL,
  mean_radius_km NUMERIC(9, 2) NOT NULL,
  has_atmosphere BOOLEAN NOT NULL
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(80) NOT NULL UNIQUE,
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  diameter_km INT NOT NULL,
  is_tidally_locked BOOLEAN NOT NULL,
  surface_description TEXT
);

CREATE TABLE constellation (
  constellation_id SERIAL PRIMARY KEY,
  name VARCHAR(80) NOT NULL UNIQUE,
  hemisphere VARCHAR(20) NOT NULL,
  brightest_star_magnitude NUMERIC(4, 2) NOT NULL,
  is_zodiac BOOLEAN NOT NULL
);

INSERT INTO galaxy (name, galaxy_type, discovered_year, is_observable, description) VALUES
  ('Milky Way', 'Barred spiral', NULL, TRUE, 'The galaxy containing the Solar System.'),
  ('Andromeda', 'Spiral', 964, TRUE, 'The nearest major galaxy to the Milky Way.'),
  ('Triangulum', 'Spiral', 1654, TRUE, 'A member of the Local Group.'),
  ('Large Magellanic Cloud', 'Dwarf irregular', 964, TRUE, 'A satellite galaxy of the Milky Way.'),
  ('Small Magellanic Cloud', 'Dwarf irregular', 964, TRUE, 'A nearby satellite galaxy of the Milky Way.'),
  ('Whirlpool', 'Grand-design spiral', 1773, TRUE, 'A spiral galaxy interacting with NGC 5195.');

INSERT INTO star (name, galaxy_id, mass_solar, surface_temperature_kelvin, is_main_sequence) VALUES
  ('Sun', 1, 1.000, 5778, TRUE),
  ('Sirius', 1, 2.063, 9940, TRUE),
  ('Proxima Centauri', 1, 0.122, 3042, TRUE),
  ('Betelgeuse', 1, 16.500, 3600, FALSE),
  ('Vega', 1, 2.135, 9602, TRUE),
  ('Altair', 1, 1.790, 7550, TRUE);

INSERT INTO planet (name, star_id, orbital_period_days, mean_radius_km, has_atmosphere) VALUES
  ('Mercury', 1, 88, 2439.70, FALSE),
  ('Venus', 1, 225, 6051.80, TRUE),
  ('Earth', 1, 365, 6371.00, TRUE),
  ('Mars', 1, 687, 3389.50, TRUE),
  ('Jupiter', 1, 4333, 69911.00, TRUE),
  ('Saturn', 1, 10759, 58232.00, TRUE),
  ('Uranus', 1, 30687, 25362.00, TRUE),
  ('Neptune', 1, 60190, 24622.00, TRUE),
  ('Sirius b I', 2, 1200, 12000.00, FALSE),
  ('Proxima Centauri b', 3, 11, 7000.00, TRUE),
  ('Betelgeuse b', 4, 2100, 18000.00, TRUE),
  ('Vega b', 5, 300, 9000.00, TRUE);

INSERT INTO moon (name, planet_id, diameter_km, is_tidally_locked, surface_description) VALUES
  ('Moon', 3, 3475, TRUE, 'Heavily cratered rocky surface.'),
  ('Phobos', 4, 22, TRUE, 'Irregular, cratered surface.'),
  ('Deimos', 4, 12, TRUE, 'Small, dark, carbon-rich surface.'),
  ('Io', 5, 3643, TRUE, 'Volcanically active silicate surface.'),
  ('Europa', 5, 3122, TRUE, 'Icy crust covering a likely subsurface ocean.'),
  ('Ganymede', 5, 5268, TRUE, 'Mixture of bright ice and dark terrain.'),
  ('Callisto', 5, 4821, TRUE, 'Ancient, densely cratered surface.'),
  ('Mimas', 6, 396, TRUE, 'Icy surface marked by a large impact crater.'),
  ('Enceladus', 6, 504, TRUE, 'Bright ice with active water-ice plumes.'),
  ('Tethys', 6, 1062, TRUE, 'Icy surface with a vast impact basin.'),
  ('Dione', 6, 1123, TRUE, 'Icy terrain with bright fractures.'),
  ('Rhea', 6, 1528, TRUE, 'Water-ice surface with many craters.'),
  ('Titan', 6, 5150, TRUE, 'Thick atmosphere and lakes of liquid methane.'),
  ('Iapetus', 6, 1469, TRUE, 'Distinctive bright and dark hemispheres.'),
  ('Miranda', 7, 472, TRUE, 'Patchwork icy terrain with deep canyons.'),
  ('Ariel', 7, 1158, TRUE, 'Bright icy surface with extensive valleys.'),
  ('Umbriel', 7, 1169, TRUE, 'Dark, heavily cratered icy surface.'),
  ('Titania', 7, 1578, TRUE, 'Icy terrain crossed by large faults.'),
  ('Oberon', 7, 1523, TRUE, 'Old, cratered surface with dark deposits.'),
  ('Triton', 8, 2707, TRUE, 'Icy surface with active nitrogen geysers.');

INSERT INTO constellation (name, hemisphere, brightest_star_magnitude, is_zodiac) VALUES
  ('Orion', 'Both', 0.13, FALSE),
  ('Ursa Major', 'Northern', 1.79, FALSE),
  ('Scorpius', 'Southern', 0.96, TRUE);