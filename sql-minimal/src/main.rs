use rusqlite::{params, Connection, Result};

fn main() -> Result<()> {
    let conn = Connection::open("example.db")?;

    conn.execute(
        "CREATE TABLE person (
                  id     INTEGER PRIMARY KEY,
                  name   TEXT NOT NULL,
                  age    INTEGER
                  )",
        [],
    )?;

    conn.execute(
        "INSERT INTO person (name, age) VALUES (?1, ?2)",
        params!["Alice", 30],
    )?;

    conn.execute(
        "INSERT INTO person (name, age) VALUES (?1, ?2)",
        params!["Bob", 25],
    )?;

    let mut stmt = conn.prepare("SELECT id, name, age FROM person")?;

    let person_iter = stmt.query_map([], |row| {
        Ok(Person {
            id: row.get(0)?,
            name: row.get(1)?,
            age: row.get(2)?,
        })
    })?;

    for person in person_iter {
        println!("Found person {:?}", person.unwrap());
    }
    Ok(())
}

#[derive(Debug)]
struct Person {
    id: i32,
    name: String,
    age: i32,
}
