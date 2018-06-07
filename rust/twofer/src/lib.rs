pub fn twofer(name: &str) -> String {
    let output = match name {
        "" => "you",
        _ => name,
    };

    format!("One for {}, one for me.", output)
}
