enum Coin {
    Alpha,
    Beta,
    Gamma, 
    Delta
}



fn associate(c: Coin) -> i32 {
    let result =
        match c {
            Coin::Alpha => 1,
            Coin::Beta => 2,
            Coin::Gamma => 3,
            Coin::Delta => 4,
    };
    result
}
fn main() {

    println!( "{}", associate(Coin::Alpha)  );
    println!( "{}", associate(Coin::Beta)   );
    println!( "{}", associate(Coin::Gamma)  );
    println!( "{}", associate(Coin::Delta)  );
}
