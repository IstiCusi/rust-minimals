fn main() {
    let my_array: [i32;4] = 
        [1, 2, 3, 4];
    let mut sum: i32 = 0;
    for i in my_array {
        println!("{}", i);
        sum  += i;
    }
    println!("{}", sum);
    println!("{}", my_array[0]);
}
