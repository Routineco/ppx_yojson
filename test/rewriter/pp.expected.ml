type json = Yojson.Safe.t
let null : json = `Null
let true_ : json = `Bool true
let false_ : json = `Bool false
let string : json = `String "a"
let int : json = `Int 1
let int_lit : json = `Intlit "4611686018427387904"
let float : json = `Float 1.2e+10
let empty_array : json = `List []
let array : json = `List [`Int 1; `Int 2; `Int 3]
let mixed_array : json = `List [`Bool true; `Int 1; `String "a"]
let record : json =
  `Assoc [("a", (`Bool true)); ("b", (`Int 1)); ("c", (`String "a"))]
let complex : json =
  `Assoc
    [("description", (`String "Some written thing"));
    ("authors",
      (`List
         [`Assoc [("name", (`String "Kurt Cobain")); ("age", (`Int 27))];
         `Assoc [("name", (`String "Jesus Christ")); ("age", (`Int 33))]]))]
let anti_quotation : json = `Assoc [("a", (`String "a")); ("b", (`Int 1))]
let int_64 : json = `Intlit "1"
let int_32 : json = `Intlit "1"
let native_int : json = `Intlit "1"
let patterns : json -> unit =
  ((function
    | `Null as _null -> ()
    | `Bool (true) as _true -> ()
    | `Bool (false) as _false -> ()
    | `String "a" as _string -> ()
    | `Int 1 as _int -> ()
    | `Intlit "4611686018427387904" as _int_lit -> ()
    | `Float 1.2e+10 as _float -> ()
    | `Int 1|`Int 2 as _or_pattern -> ()
    | `Int 1 as _s as _alias -> ()
    | `List ((`Int 1)::(`Int 2)::(`Int 3)::[]) as _array -> ()
    | `List ((`Bool (true))::(`Int 1)::(`String "a")::[]) as _mixed_array ->
        ()
    | `Assoc (("a", `Bool (true))::("b", `Int 1)::("c", `String "a")::[])
      |`Assoc (("a", `Bool (true))::("c", `String "a")::("b", `Int 1)::[])
      |`Assoc (("b", `Int 1)::("a", `Bool (true))::("c", `String "a")::[])
      |`Assoc (("b", `Int 1)::("c", `String "a")::("a", `Bool (true))::[])
      |`Assoc (("c", `String "a")::("a", `Bool (true))::("b", `Int 1)::[])
      |`Assoc (("c", `String "a")::("b", `Int 1)::("a", `Bool (true))::[]) as
        _object -> ()
    | `Assoc
        (("description", `String "Some written thing")::("authors",
                                                         `List
                                                           ((`Assoc
                                                               (("name",
                                                                 _kurt)::
                                                               ("age",
                                                                `Int 27)::[])
                                                             |`Assoc
                                                                (("age",
                                                                  `Int 27)::
                                                                ("name",
                                                                 _kurt)::[]))::(
                                                           `Assoc
                                                             (("name",
                                                               `String
                                                                 "Jesus Christ")::
                                                             ("age", _)::[])
                                                           |`Assoc
                                                              (("age", _)::
                                                              ("name",
                                                               `String
                                                                 "Jesus Christ")::[]))::[]))::[])
      |`Assoc
         (("authors",
           `List
             ((`Assoc (("name", _kurt)::("age", `Int 27)::[])
               |`Assoc (("age", `Int 27)::("name", _kurt)::[]))::(`Assoc
                                                                    (
                                                                    ("name",
                                                                    `String
                                                                    "Jesus Christ")::
                                                                    ("age",
                                                                    _)::[])
                                                                  |`Assoc
                                                                    (("age",
                                                                    _)::
                                                                    ("name",
                                                                    `String
                                                                    "Jesus Christ")::[]))::[]))::
         ("description", `String "Some written thing")::[])
        as _complex -> ()
    | `Intlit "1" as _int_64 -> ()
    | `Intlit "1" as _int_32 -> ()
    | `Intlit "1" as _native_int -> ()
    | _s as _var -> ()
    | _ as _any -> ())
  [@warning "-11"])
