# 过程宏介绍
过程宏接收 Rust 代码作为输入，在这些代码上进行操作，然后产生另一些代码作为输出，而非像声明式宏那样匹配对应模式然后以另一部分代码替换当前代码。

定义过程宏的函数接受一个 TokenStream 作为输入并产生一个 TokenStream 作为输出。这也就是宏的核心：宏所处理的源代码组成了输入 TokenStream，同时宏生成的代码是输出 TokenStream。如下：
```rust
use proc_macro;
#[some_attribute]
pub fn some_name(input: TokenStream) -> TokenStream {
}
```

过程宏中的derive宏   
```rust
fmt::Display trait
#[derive(Debug)]
struct A {
	a : i32,
}
```

说明：在 `hello_macro_derive` 函数的实现中，syn 中的 `parse_derive_input` 函数获取一个 TokenStream 并返回一个表示解析出 Rust 代码的 DeriveInput 结构体（对应代码syn::parse(input).unwrap();）。该结构体相关的内容大体如下：
```rust
DeriveInput {
    // --snip--

    ident: Ident {
        ident: "Pancakes",
        span: #0 bytes(95..103)
    },
    data: Struct(
        DataStruct {
            struct_token: Struct,
            fields: Unit,
            semi_token: Some(
                Semi
            )
        }
    )
}
```

# 类属性宏
类属性宏与自定义派生宏相似，不同于为 derive 属性生成代码，它们允许你创建新的属性。

例子：
可以创建一个名为 route 的属性用于注解 web 应用程序框架（web application framework）的函数：
```rust
#[route(GET, "/")]
fn index() {}
```

#[route] 属性将由框架本身定义为一个过程宏。其宏定义的函数签名看起来像这样：
#[proc_macro_attribute]
pub fn route(attr: TokenStream, item: TokenStream) -> TokenStream {

说明：类属性宏其它工作方式和自定义derive宏工作方式一致。

# 类函数宏
类函数宏定义看起来像函数调用的宏。类似于 `macro_rules!`，它们比函数更灵活。
例子：
如sql！宏，使用方式为：
`let sql = sql!(SELECT * FROM posts WHERE id=1);`
则其定义为：
```rust
#[proc_macro]
pub fn sql(input: TokenStream) -> TokenStream {}
```

# 宏的资料推荐
https://danielkeep.github.io/tlborm/book/mbe-macro-rules.html
