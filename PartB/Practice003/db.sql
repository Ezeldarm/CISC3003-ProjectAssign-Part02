CREATE TABLE profiles (
    profiles_id int NOT NULL AUTO_INCREMENT,
    profiles_about TEXT NOT NULL,
    profiles_introtitle TEXT NOT NULL,
    profiles_introtext TEXT NOT NULL,
    users_id int,
    PRIMARY KEY (profiles_id),
    FOREIGN KEY (users_id) REFERENCES users(users_id)
);