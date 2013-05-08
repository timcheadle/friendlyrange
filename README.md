# FriendlyRange

FriendlyRange makes it easy to parse and compose ranges of numbers in a human friendly way.

It allows you to easily accept multiple ranges as input, like `1-4, 9,
15-19`. Just make sure ranges use hyphens and commas.

### Usage

To parse a human-input range of numbers:

```
range = FriendlyRange.new('1-4, 9, 11-13')
```

Now just use the range as an array:

```
range.to_a  #=> [1, 2, 3, 4, 9, 11, 12, 13]
```

Or, you can transform it back to a string:

```
range.to_s  #=> "1-4, 9, 11-13"
```

### Fun Stuff

You can even take ranges in weird orders:

```
range = FriendlyRange.new('5-9, 1, 3')

range.to_a  #=> [1, 3, 5, 6, 7, 8, 9]
range.to_s  #=> "1, 3, 5-9"
```

It will even reconcile "bad" input, with overlapping numbers. It will
deduplicate any numbers automatically.

```
range = FriendlyRange.new('1, 1-4, 4')

range.to_a  #=> => [1, 2, 3, 4]
range.to_s  #=> "1-4"
```

### Feedback

I'd love any feedback. Just file an issue or pull request.