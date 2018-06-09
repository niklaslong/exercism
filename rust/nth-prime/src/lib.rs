pub fn nth(n: u32) -> Option<u32> {
    let mut counter: u32 = 0;
    let mut num: u32 = 0;

    while counter < n {
        num += 1;

        let prime: bool = test_primality(&num);

        if let true = prime {
            counter += 1;
        }
    }

    match n {
        0 => None,
        _ => Some(num)
    }
}

fn test_primality(num: &u32) -> bool {
    match num {
        0 => false,
        1 => false,
        2 => true,
        3 => true,
        _ => test_bignum(num),
    }
}

fn test_bignum(num: &u32) -> bool {
    let mut i: u32 = 2;
    let mut ret: bool = true;

    while i < *num && ret == true {
        if num % i == 0 {
            ret = false;
            i += 1;
        } else {
            i += 1;
        }
    }
    ret
}
