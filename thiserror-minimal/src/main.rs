use thiserror::Error;
use std::num::ParseIntError;

#[derive(Debug, Error)]
enum MyErrorWithThisError {
    #[error("Failed to parse: {0}")]
    ParseError(#[from] ParseIntError),
    
    #[error("Division by zero")]
    DivisionByZero,
}

fn divide_with_thiserror(numerator: &str, denominator: &str) -> Result<i32, MyErrorWithThisError> {
    let numerator: i32 = numerator.parse()?;
    let denominator: i32 = denominator.parse()?;

    if denominator == 0 {
        return Err(MyErrorWithThisError::DivisionByZero);
    }

    Ok(numerator / denominator)
}

#[derive(Debug)]
enum MyErrorManual {
    ParseError(ParseIntError),
    DivisionByZero,
}

impl std::fmt::Display for MyErrorManual {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            MyErrorManual::ParseError(e) => write!(f, "Failed to parse: {}", e),
            MyErrorManual::DivisionByZero => write!(f, "Division by zero"),
        }
    }
}

impl From<ParseIntError> for MyErrorManual {
    fn from(e: ParseIntError) -> Self {
        MyErrorManual::ParseError(e)
    }
}

fn divide_manual(numerator: &str, denominator: &str) -> Result<i32, MyErrorManual> {
    let numerator: i32 = numerator.parse()?;
    let denominator: i32 = denominator.parse()?;

    if denominator == 0 {
        return Err(MyErrorManual::DivisionByZero);
    }

    Ok(numerator / denominator)
}

fn main() {
    match divide_with_thiserror("10", "0") {
        Ok(result) => println!("Result (thiserror): {}", result),
        Err(e) => println!("Error (thiserror): {}", e),
    }

    match divide_manual("10", "0") {
        Ok(result) => println!("Result (manual): {}", result),
        Err(e) => println!("Error (manual): {}", e),
    }
}

