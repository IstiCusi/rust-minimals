// Code fails by purpose -- lifetime 'a' of param shorter than of return

fn longest<'a>(x: &'a str, _y: &'a str) -> &'a str {
    x
}

fn main() {
    let string1 = String::from("Hello");

    let result;

    {
        let string2 = String::from("World!"); 
        result = longest(&string1, &string2); 
    }

    println!("The longest string is {}", result); // 
}
