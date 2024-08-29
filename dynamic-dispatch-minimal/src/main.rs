use libc::{pthread_attr_t, pthread_getattr_np, pthread_self, size_t};
use std::ptr;

// Function to get the base address and size of the current thread's stack
fn get_stack_info() -> (*mut u8, size_t) {
    let mut attr: pthread_attr_t = unsafe { std::mem::zeroed() };
    let mut stackaddr: *mut u8 = ptr::null_mut();
    let mut stacksize: size_t = 0;

    unsafe {
        pthread_getattr_np(pthread_self(), &mut attr);
        libc::pthread_attr_getstack(&attr, &mut stackaddr as *mut *mut u8 as *mut *mut libc::c_void, &mut stacksize);
        libc::pthread_attr_destroy(&mut attr); // Fix: use `&mut attr` instead of `&attr`
    }

    (stackaddr, stacksize)
}



/*
 * Definitions and Memory Layout of Trait Objects in Rust
 *
 * 1. `dyn`
 *    - Definition: A keyword in Rust used to create trait objects for dynamic dispatch.
 *
 * 2. Trait
 *    - Definition: A collection of method signatures that can be implemented by different types to define shared behavior.
 *
 * 3. Trait Object
 *    - Definition: An instance of a trait that can be used polymorphically at runtime, typically using the `dyn` keyword.
 *
 * Memory Layout of a Trait Object
 *
 * A trait object in memory consists of two main components:
 *
 * 1. Data Pointer: A pointer to the actual data of the concrete type implementing the trait.
 * 2. vtable Pointer (virtual table): A pointer to a table that contains the addresses of the methods implemented for the trait.
 *
 * This structure allows dynamic dispatch, where the method is called at runtime via the vtable.
 *
 * Visualization:
 *
 * Trait Object (Box<dyn Animal>)
 * +------------------+
 * | Data Pointer     | ---> +---------------+
 * | (Pointer to      |      | Concrete      |
 * |  Dog or Cat)     |      | Object (Dog)  |
 * +------------------+      +---------------+
 * | vtable Pointer   | ---> +---------------+
 * | (Pointer to      |      | vtable for Dog|
 * |  methods)        |      +---------------+
 * +------------------+
 *
 * Usage of `dyn` Keyword
 *
 * - The `dyn` keyword is primarily used in Rust to create trait objects, which enable dynamic dispatch.
 * - It can be used in various contexts, such as:
 *   - `Box<dyn Trait>`: Store a trait object on the heap.
 *     Example: `let animal: Box<dyn Animal> = Box::new(Dog);`
 *   - `&dyn Trait`: Create a reference to a trait object.
 *     Example: `let animal: &dyn Animal = &Dog;`
 *   - `Rc<dyn Trait>`: Use a reference-counted pointer to a trait object.
 *     Example: `let animal: Rc<dyn Animal> = Rc::new(Dog);`
 * - When the compiler encounters the `dyn` keyword, it:
 *   1. Interprets the type as a trait object.
 *   2. Ensures that method calls on the trait object are resolved at runtime using the vtable.
 *   3. Manages the necessary memory layout to support dynamic dispatch.
 */

fn print_type_of<T>(_: &T) {
    println!("{}", std::any::type_name::<T>());
}

trait Animal {
    fn speak(&self);
}

struct Dog;

impl Animal for Dog {
    fn speak(&self) {
        println!("Woof!");
    }
}

struct Cat;

impl Animal for Cat {
    fn speak(&self) {
        println!("Meow!");
    }
}


fn main() {


    let my_animal_trait_object_looking_on_dog: Box<dyn Animal> = Box::new(Dog);
    let my_animal_trait_object_looking_on_cat: Box<dyn Animal> = Box::new(Cat);


    // Boxes themself live on the stack;  but Dog Object is on heap
    
    let c = &my_animal_trait_object_looking_on_cat;
    println!("pointer of the box object : {:p}", c);


    println!("pointer of the box object : {:p}", &*my_animal_trait_object_looking_on_dog);
    
    let animals: Vec<Box<dyn Animal>> = vec![   my_animal_trait_object_looking_on_dog, 
                                                my_animal_trait_object_looking_on_cat];

    //  animals itself lives on the stack. 

    //  In case you wanted to have it on the heap
    //  itself, you need to box it as well.
    // let boxed_animals = Box::new(animals);
    
    // or with

    // let boxed_animals: Box<Vec<Box<dyn Animal>>> = Box::new(vec![
    //     my_animal_trait_object_looking_on_dog,
    //     my_animal_trait_object_looking_on_cat,
    // ]);


    let a = &animals;
    let b = &animals;

    // The references point to the address of it on the stack ; therefore all of them have the same
    // address as the animals object itself

    println!("Address of animals of ALL references point to the stack pointer of the object : {:p}", a);
    println!("Address of animals of ALL references point to the stack pointer of the object : {:p}", b);

    // The vector object itself points to a buffer on the heap. The buffer beginning can be 
    // read by:

    println!("Value of the pointer object (that is an address): {:p}", &a[0] as *const _);
    println!("Address of animals : {:p}", animals.as_ptr());


    for animal in &animals {    // & => Avoid Consumption of the animal list and therefore also its
                                // elements (because the the animals vector still refers to the
                                // elements, even if the refernence animal: &Box<dyn Animal> goes
                                // out of scope in the for loop)

        println!("----------------------------------------------------------------------");
        print_type_of(&animal);
        println!("Address of &animal reference on stack (Box<dyn Animal>): {:p}", &animal);
        println!("----------------------------------------------------------------------");
        print_type_of(animal);
        println!("Value of the animal reference (pointing to an address):   {:p}", animal);
        println!("----------------------------------------------------------------------");
        animal.speak();         // Automatic dereferencing of the trait object: You could also write
                                // explicitly (*animal).speak() 
    }

    let (stack_base, stack_size) = get_stack_info();
    let stack_top = unsafe { stack_base.add(stack_size) };

    println!("Stack base address: {:p}", stack_base);
    println!("Stack size: {}", stack_size);
    println!("Stack top address: {:p}", stack_top);



}

