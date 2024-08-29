fn take_ownership(s: String) {
    println!("{}", s);
}

fn main() {
    let mut s = String::from("Hallo ");
    s.push_str("World");
    s.push('!');

    take_ownership(s.clone());

    assert_eq!(s, "Hallo World!");
    let str_ref: &str = &s;
    assert_eq!(str_ref, "Hallo World!");

    let slice: &str = &s[0..5];
    println!("{}", slice);

    assert_eq!(s, "Hallo World!");
}
