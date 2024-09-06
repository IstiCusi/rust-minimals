fn div(a: f32, b: f32) -> Result<f32, &'static str> {
    if b == 0.0 {
        return Err("Division by Zero");
    }
    Ok(a / b)
}

fn main() {
    let result = div(4.0, 0.0);
    match result {
        Ok(val) => println!("Result: {}", val),
        Err(e) => println!("Error: {}", e),
    }
}

