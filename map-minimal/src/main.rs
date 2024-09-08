
use std::num::ParseIntError;

fn multiply(n1_str: &str, n2_str: &str) -> Result<i32, ParseIntError> {
    n1_str
        .parse::<i32>()
        .and_then(|n1| n2_str.parse::<i32>().map (|n2| n1 * n2))
}


fn main() {
    let result = multiply("10", "20");
    println!("{}", result.unwrap());
}
