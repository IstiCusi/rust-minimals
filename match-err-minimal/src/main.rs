use std::num::ParseIntError;

fn without_question_mark() -> Result<i32, ParseIntError> {
    let number_str : &str = "10";
    let number = match number_str.parse::<i32>() {
        Ok(number) => number,
        Err(e) => return Err(e),
    };
    Ok(number)
}

fn main() -> Result<(),ParseIntError> {

    // Match Variant 
    let result = without_question_mark();
    println!("{}", result.unwrap());

    // ? Variant -- short  hand
    let number_str : &str = "10";
    let number = number_str.parse::<i32>()?;
    println!("{}", number);
    Ok(())
}
