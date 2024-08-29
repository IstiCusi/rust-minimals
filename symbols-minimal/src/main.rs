fn main() {
    // 1. Objects and Variables
    let x = 5; // `x` is a variable holding an integer object with the value 5
    println!("Value of x: {}", x);

    // 2. Mutable Variable
    let mut y = 10; // `y` is a mutable variable holding an integer object with the value 10
    println!("Initial value of y: {}", y);
    y = 15; // Modify the value of `y`
    println!("Modified value of y: {}", y);

    // 3. References
    let z = 20; // `z` is a variable holding an integer object with the value 20
    let ref_z = &z; // `ref_z` is an immutable reference to `z`
    println!("Value of z through ref_z: {}", ref_z);

    // 4. Mutable References
    let mut a = 25; // `a` is a mutable variable holding an integer object with the value 25
    let ref_a = &mut a; // `ref_a` is a mutable reference to `a`
    *ref_a = 30; // Modify the value of `a` through `ref_a`
    println!("Modified value of a through ref_a: {}", a);

    // 5. Shadowing
    let b = 35; // `b` is a variable holding an integer object with the value 35
    println!("Value of b: {}", b);
    let b = b + 5; // `b` is shadowed, now holding the value 40
    println!("Shadowed value of b: {}", b);

    // 6. Borrowing References
    let numbers = vec![1, 2, 3, 4, 5]; // `numbers` is a vector holding integers
    let first = &numbers[0]; // `first` is an immutable reference to the first element of the vector
    println!("First element of numbers: {}", first);

    // 7. Slices
    let slice = &numbers[1..3]; // `slice` is a slice of the vector, referencing elements 2 and 3
    println!("Slice of numbers: {:?}", slice);
}

