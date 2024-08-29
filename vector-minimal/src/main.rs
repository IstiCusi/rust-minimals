#[derive(Debug)]




enum Letter {
    Alpha,
    Beta,
    Gamma, 
    Delta,
}
fn main() {

    let mut my_vec = vec![Letter::Alpha, Letter::Beta, Letter::Delta];
    for elem in &my_vec {
        println!("{:?}", elem);
    }

    println!("-----------------------------------------------------");
    my_vec.push(Letter::Gamma);
    for elem in &my_vec {
        println!("{:?}", elem);
    }
}
