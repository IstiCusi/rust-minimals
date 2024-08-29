fn main() {
    let mut counter = make_counter(10);

    println!("Counter: {}", counter()); // Ausgabe: Counter: 1
    println!("Counter: {}", counter()); // Ausgabe: Counter: 2
    println!("Counter: {}", counter()); // Ausgabe: Counter: 3
}

fn make_counter(a: i32) -> impl FnMut() -> i32 {

    let mut count = a;
    move || {
        count += 1;
        count
    }
}
