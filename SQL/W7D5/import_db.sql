CREATE TABLE Cats
(
    id serial PRIMARY KEY,
    Name VARCHAR(50),
    Color VARCHAR(50),
    Breed VARCHAR(100)
);

CREATE TABLE Toys
(
    id SERIAL PRIMARY KEY,
    price float,
    color VARCHAR(50),
    name VARCHAR(100)
);

CREATE TABLE CatToys
(
    id SERIAL PRIMARY KEY,
    cat_id INTEGER REFERENCES Cats(id),
    toy_id INTEGER REFERENCES Toys(id)
);

INSERT INTO Cats
    (Name, Color, Breed)
VALUES
    ('Tom', 'Brown', 'Tomcat');

INSERT INTO Cats
    (Name, Color, Breed)
VALUES
    ('Tim', 'Black', 'Bombay');

INSERT INTO Cats
    (Name, Color, Breed)
VALUES
    ('Archie', 'Orange', 'Tabby');

INSERT INTO Cats
    (Name, Color, Breed)
VALUES
    ('Lady', 'Gray', 'Maine Coon');

INSERT INTO Cats
    (Name, Color, Breed)
VALUES
    ('Hildy', 'White', 'Persian');

INSERT INTO Toys
    (Price, Color, Name)
VALUES
    (3.99, 'Gray', 'Fake Mouse');

INSERT INTO Toys
    (Price, Color, Name)
VALUES
    (1.99, 'Green', 'Yarn Ball');

INSERT INTO Toys
    (Price, Color, Name)
VALUES
    (44.99, 'Tan', 'Cat Tree');

INSERT INTO Toys
    (Price, Color, Name)
VALUES
    (2.99, 'Gray', 'Fake Fish');

INSERT INTO Toys
    (Price, Color, Name)
VALUES
    (5.99, 'Orange', 'Plush Sushi');

INSERT INTO CatToys
    (toy_id, cat_id)
VALUES
    (5, 1);

INSERT INTO CatToys
    (toy_id, cat_id)
VALUES
    (4, 2);

INSERT INTO CatToys
    (toy_id, cat_id)
VALUES
    (3, 3);

INSERT INTO CatToys
    (toy_id, cat_id)
VALUES
    (2, 4);

INSERT INTO CatToys
    (toy_id, cat_id)
VALUES
    (1, 5); 
