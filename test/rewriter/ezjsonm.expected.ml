[@@@warning "-32"]
let null = `Null
let true_ = `Bool true
let false_ = `Bool false
let string = `String "a"
let int = `Float 1
let float = `Float 1.2e+10
let empty_array = `A []
let array = `A [`Float 1; `Float 2; `Float 3]
let mixed_array = `A [`Bool true; `Float 1; `String "a"]
let record =
  `O [("a", (`Bool true)); ("b", (`Float 1)); ("c", (`String "a"))]
let complex =
  `O
    [("description", (`String "Some written thing"));
    ("authors",
      (`A
         [`O [("name", (`String "Kurt Cobain")); ("age", (`Float 27))];
         `O [("name", (`String "Jesus Christ")); ("age", (`Float 33))]]))]
let anti_quotation = `O [("a", (`String "a")); ("b", (`Float 1))]
