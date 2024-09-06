#[derive(Debug)]
struct Number {
    value: i32,
}

impl From<i32> for Number {
    fn from(n: i32) -> Number {
        Number {
            value: n,
        }
    }
}

impl From<char> for Number {
    fn from(c: char) -> Number {
        Number {
            value: (c as i32) * 2,
        }
    }
}

fn main() {
    let num = Number::from(30);
    assert_eq!(num.value, 30);

    // Automatically you get Into as well
    let num: Number = 30_i32.into();
    assert_eq!(num.value, 30);
    
    // Converting from a char
    let num: Number = 'A'.into();  // 'A' has an ASCII value of 65
    assert_eq!(num.value, 130); // 65 * 2 = 130

    let num = Number::from('B');  // 'B' has an ASCII value of 66
    assert_eq!(num.value, 132); // 66 * 2 = 132

    println!("{:?}", num);
}

