## Terraform Console & Functions 

```
>  2 + 4 
6
> 10 -6 
4
> 5 * 3
15
> 30 /5 
6
> 

> 

> contains(tolist(["orange", "mango", "apple"]), "kiwi")
false
> contains(tolist(["orange", "mango", "apple"]), "mango")
true
> 

> 

> 

> length("a,b,c")
5
> length(split(",", "a,b,c"))
3
> length(tomap({"key"="Value1"}))
1
> 

> 

> merge(tomap({"key"="Value1"}), tomap({"key2"="Value2"}))
tomap({
  "key" = "Value1"
  "key2" = "Value2"
})
> 

> 

> max(5,17,19)
19
> min(5,17,19)
5
> timestamp()
"2024-10-16T04:57:32Z"
> formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
"16 Oct 2024 04:58 UTC"
> formatdate("DD MMM YYYY", timestamp())
"16 Oct 2024"
> formatdate("DD MMM", timestamp())
"16 Oct"
> 

> 

> 

> 

> lookup({a="Hello Terraform", b="How are you terraform"}, "a", "please use the right key")
"Hello Terraform"
> lookup({a="Hello Terraform", b="How are you terraform"}, "a", "please use the right key")
"Hello Terraform"
> lookup({a="Hello Terraform", b="How are you terraform"}, "a", "please use the right key")
"Hello Terraform"
> lookup({a="Hello Terraform", b="How are you terraform"}, "b", "please use the right key")
"How are you terraform"
> lookup({a="Hello Terraform", b="How are you terraform"}, "b", "please use the right key")
"How are you terraform"
> lookup({a="Hello Terraform", b="How are you terraform"}, "c", "please use the right key")
"please use the right key"
> lookup({a="Hello Terraform", b="How are you terraform"}, "1", "please use the right key")
"please use the right key"
> lookup({a="Hello Terraform", b="How are you terraform"}, "100", "please use the right key")
"please use the right key"
> 

> 

> 

> join(",", ["apple", "mango", "kiwi"])
"apple,mango,kiwi"
> join(" ", ["apple", "mango", "kiwi"])
"apple mango kiwi"
> join("-", ["apple", "mango", "kiwi"])
"apple-mango-kiwi"
> join("", ["apple", "mango", "kiwi"])
"applemangokiwi"
> 

> 

> replace("apple-mango-kiwi", "-", "+")
"apple+mango+kiwi"
> replace("apple-mango-kiwi", "-", "   ")
"apple   mango   kiwi"
> 

> upper("applemangokiwi")
"APPLEMANGOKIWI"
> lower("APPLEMANGOKIWI")
"applemangokiwi"
> 

> 

> base64encode("Welcome to the world of Terrafrom Functions")
"V2VsY29tZSB0byB0aGUgd29ybGQgb2YgVGVycmFmcm9tIEZ1bmN0aW9ucw=="
> base64decode("V2VsY29tZSB0byB0aGUgd29ybGQgb2YgVGVycmFmcm9tIEZ1bmN0aW9ucw==")
"Welcome to the world of Terrafrom Functions"
> exit 
```