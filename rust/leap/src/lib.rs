pub fn is_leap_year(year: i32) -> bool {
    let div_by_4: bool = year % 4 == 0;
    let div_by_100: bool = year % 100 == 0;
    let div_by_400: bool = year % 400 == 0;

    if div_by_4 && div_by_100 && div_by_400 {
        true
    } else if div_by_4 && div_by_100 {
        false
    } else if div_by_4 {
        true
    } else {
        false
    }
}
