// use std::net::IpAddr;

fn main() {

    struct Point(i32, i32, i32);
    let p: Point = Point(9,8,7);
    println!("{ }{ }{ }", p.0, p.1, p.2);

    let s = String::from("Hallo World"); // after __move__ not owner anymore
    let t = s; // __move__

    println!("{}", t);

    let _q = t.clone();
    let mut _o = some_function(_q);     // Takes ownership and hands it to _o
    // println!("{}", _q); // Therefore this will not work

    _o.push_str("!");
    println!("{}", _o); // _o is the new owner
    println!("{}", "hallo".len());

    let x = 31;
    let ptr = &x as *const i32;
    println!("Address of x: {:?}", ptr);
    smart();

    #[derive(Debug)]
    struct Person {
        name: String,
        age : Box<u8>
    }

    let person = Person {
        name:  dbg!(String::from("Alice")),
        age:    Box::new(20)
    };

    let Person {name, ref age} = person;
    println!("{} {}", age, name);


    enum IpAddrName {
        V4,
        V6
    }

    #[derive(Debug)]
    enum IpAddr {
        V4(String),
        V6(String)
    }

    let _home = IpAddr::V4(String::from("Hallo"));
    let _home2 = IpAddr::V6(String::from("Hallo"));
    let _homename = IpAddrName::V4;
    let _homename2 = IpAddrName::V6;
    println!("{:?}", _home);

    let opi = Some(5);




}

fn some_function(some_string : String) -> String {
    println!("{}", some_string);
    let mut mutti = some_string;
    let x = Box::new(3);
    mutti.push_str(" - you are fucked up ");
    mutti.push_str(&x.to_string());
    mutti.push_str(" times");
    mutti
}

fn smart() {
    let mut y: Box<i32> = Box::new(5);
    *y = 3;

    // Adresse des Pointers selbst (der Box) auf dem Stack
    let pointer_address = &y as *const Box<i32>;

    // Adresse des Objekts, auf das der Smart Pointer zeigt, auf dem Heap
    let object_address = &(*y) as *const i32; // () are not necessary / just for better insight

    println!("Value: {}", y);
    println!("Address of the Box pointer (on the Stack): {:?}", pointer_address);
    println!("Address of the object (on the Heap): {:?}", object_address);

}

fn useOption (a: Option<i32>) {

    match a {
        None => print!("None"), 
        Some(i) => print!("{}", i)
    }
}
