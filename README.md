# tablify

Ever want those super pretty old-school UNIX style tables in your program's
output? Do you have tables or paragraphs you want to gussy up for a night on
the town? Then Tablify is your jam. Use it.

Make an array of hashes into something truly beautiful:

    ruby> foo = [{foo: 1, bar: 2}, {foo: 11, bar: 22, baz: 42}, {foo: 111, bar: 222}]
    ruby> puts Tablify(foo)
    +-----+-----+-----+
    | foo | bar | baz |
    +-----+-----+-----+
    |   1 |   2 |     |
    |  11 |  22 |  42 |
    | 111 | 222 |     |
    +-----+-----+-----+

What's that? You didn't want that `baz` column in there after all? Jam this
into your input pipe and smoke it:

    ruby> puts Tablify(foo).omit(:baz)
    +-----+-----+
    | foo | bar |
    +-----+-----+
    |   1 |   2 |
    |  11 |  22 |
    | 111 | 222 |
    +-----+-----+

or...

    ruby> puts Tablify(foo).include(:foo, :bar)
    +-----+-----+
    | foo | bar |
    +-----+-----+
    |   1 |   2 |
    |  11 |  22 |
    | 111 | 222 |
    +-----+-----+

## Contributing to tablify
 
  * Check out the latest master to make sure the feature hasn't been
    implemented or the bug hasn't been fixed yet.
  * Check out the issue tracker to make sure someone already hasn't requested
    it and/or contributed it.
  * Fork the project.
  * Start a feature/bugfix branch.
  * Commit and push until you are happy with your contribution.
  * Make sure to add tests for it. This is important so I don't break it in a
    future version unintentionally.
  * Please try not to mess with the Rakefile, version, or history. If you want
    to have your own version, or is otherwise necessary, that is fine, but
    please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2013 Max Thom Stahl. See LICENSE.txt for
further details.

