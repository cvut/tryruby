require_relative 'tutorial'
require 'fileutils'

module Tryruby
  # Levels and challenges form tryruby.org
  class DefaultLevels < Tutorial
    level do
      challenge do
        help <<-EOF
#{title 'Got 15 minutes? Give Ruby a shot right now!'}

Ruby is a programming language from Japan (available at ruby-lang.org) which is
revolutionizing the web. The beauty of Ruby is found in its balance between
simplicity and power.

Try out Ruby code in the prompt. In addition to Ruby's built-in methods, the
following commands are available:

  * #{inverse 'help'} → Repeat last instructions.
  * #{inverse 'next'} → Allows you to skip to the next section of a lesson.
  * #{inverse 'back'} → Allows you to return to the previous section of a \
lesson.
        EOF
      end

      challenge do
        help <<-EOF
#{title 'Using the Prompt'}

The prompt below is a Ruby prompt.

Here you'll be able to type a line of Ruby code, hit #{inverse 'Enter'}, and \
watch it run!

For your first bit of Ruby, try typing some math, like: #{result '2 + 6'}
        EOF
        test { |result| result == 8 }
      end

      challenge do
        help <<-EOF
Great! You did a little bit of math.

See how the answer was returned? Ruby uses a fat arrow for responses to your
entries.

Ruby recognizes numbers and mathematics operators. You could also try some other
math like:

  * #{result '4 * 10'}
  * #{result '5 - 12'}
  * #{result '40 / 4'}

Even though we've placed a space between the numbers and the operators above,
it's not required. For now, stick with these basic operations; we'll try a few
others later.

When you're finished experimenting, type #{result 'next'} to move to the next \
lesson when
you're finished.
        EOF
      end

      challenge do
        help <<-EOF
#{title 'Say Your Name'}

Welp, we already know that computers are handy and fast for math.

But what about something really useful. Like, say, seeing the letters of your
name reversed!

To do that super-cool task, let's first get you familiar with text in Ruby. Type
your first name in quotes, like this: #{result '"Jimmy"'}
        EOF
        test { |res| res.is_a?(String) && res.length > 0 }
      end

      challenge do
        help <<-EOF
#{title 'Say Your Name Reversed'}

Perfect, you've formed a #{inverse 'string'} from the letters of your name. \
A string is an
ordered set of characters that the computer can process.

Imagine the letters are on a string of laundry line and the quotes are
clothespins holding the ends. The quotes mark the beginning and the end of the
string, and are required.

Now, let's get to reversing your name.

Type: #{result '"Jimmy".reverse'}, using your own name where the string goes. \
(Don't forget
the dot!)
        EOF
        test { |res| res.is_a?(String) && res.length > 0 }
      end

      challenge do
        help <<-EOF
#{title 'Counting the Letters'}

You have used the #{inverse 'reverse'} method on your name!

By enclosing your name in quotes, you made a string. Next, you used a dot to
access a hidden list of methods that belong to all strings. In this case, you
then called the #{inverse 'reverse'} method, which works on strings to flip \
the order of the
string’s characters. Cool, huh?

Now, let's use a different option which will show us how many letters are in
your name. Try typing #{result '"Jimmy".length'} using your name where the \
string goes.
        EOF
        test { |res| res.is_a?(Fixnum) && res > 0 }
      end

      challenge do
        help <<-EOF
#{title 'On Repeat'}

Now, maybe you're wondering what any of this is actually good for. Have you ever
encountered a website that yelled at you for choosing a password that was too
short? Turns out, the #{inverse 'length'} property is often what that site \
uses to check for
a correct length.

Let's get crazy now, and multiply your name by 5. Follow the following format:
#{result '"Jimmy" * 5'}
        EOF
        test { |res| res.is_a?(String) && res.length > 0 }
      end
    end

    level do
      challenge do
        help <<-EOF
#{title 'Hey, Whoa, Level #2 Already'}

Let's look at what you've learned in the first minute.

  * #{bold 'The prompt'}. Typing code into the prompt gives you an answer.
  * #{bold 'Numbers and strings'} are Ruby's math and text objects.
  * #{bold 'Methods'}. You've used English-language methods like \
#{inverse 'reverse'} and symbolic
    methods like #{inverse '*'} (the multiplication method.) Methods are \
actions!

This is the essence of your learning. Taking simple things, toying with them and
turning them into new things! Feeling comfortable yet? I promise that we'll get
you there..

But now, let's do something a little uncomfortable. Try using that \
#{inverse 'reverse'}
method on a number: #{result '40.reverse'}
        EOF
        test { |res| res.is_a?(NoMethodError) }
      end

      challenge do
        help <<-EOF
#{title 'Stop, You\'re Barking Mad!'}

You can't reverse the number #{inverse '40'}. I guess you can hold your \
monitor up to the
mirror, but reversing a number just doesn't make sense! Ruby has tossed you
a useful error message.

The message is telling you that there is no method #{inverse 'reverse'} for \
number values in
Ruby!

But, hmm...maybe if you can turn it into a string. Try this: \
#{result '40.to_s.reverse'}.
        EOF
        test { |res| res == '04' }
      end

      challenge do
        help <<-EOF
#{title 'Boys are Different From Girls'}

...just like numbers are different from strings. While you can use methods on
any object in Ruby, some methods only work on certain types of values. A really
cool thing about Ruby is that you can always convert between different types
using Ruby's "to" methods.

  * #{bold 'to_s'} converts values to strings.
  * #{bold 'to_i'} converts values to integers (numbers.)
  * #{bold 'to_a'} converts values to arrays.

What in the world are arrays, you might ask?! They are simply lists. Let's make
an empty one, by typing in a pair of brackets: #{result '[]'}.
        EOF
        test { |res| res == [] }
      end

      challenge do
        help <<-EOF
#{title 'Standing in Line'}

Great, you built an empty array. Now let's see what else we can do with it.

First off, a good thing to know is that arrays store their information in a
#{bold 'sequence'}. Think of this like standing in line for popcorn. You are \
behind
someone and you wouldn't dream of pushing them aside, right? And that guy behind
you, you've got a close eye on him, too. First come, first serve.

Just like that line for popcorn, the order of an array's information will stay
consistent for you after you build it...well, at least until you modify it.

To try building an array with some stuff in it, here's a list of lottery numbers
for you: #{result '[12, 47, 35]'}. See those commas? They're important!
        EOF
        test { |res| res == [12, 47, 35] }
      end

      challenge do
        help <<-EOF
#{title 'One Raises Its Hand'}

Sweet, you've got a short list of lottery numbers. Now, what if we wanted to
know which one is the highest in the array?

Try this: #{result '[12, 47, 35].max'}.
        EOF
        test { |res| res == 47 }
      end

      challenge do
        help <<-EOF
#{title 'Tucking a List Away'}

Good, good. But it would be pretty annoying to have to retype that list every
time, right?

Let's fix that by using a Ruby #{bold 'variable'}, which helps us store \
important data.
Each variable has a unique name, so that it can be summoned up whenever we need
the info it contains.

Call your new variable #{inverse 'ticket'} and place your lottery numbers \
inside it, like so:
#{result 'ticket = [12, 47, 35]'}. That equal sign you see is what assigns \
your array to the
new variable.
        EOF
        test { |_, vars| vars[:ticket] == [12, 47, 35] }
      end

      challenge do
        help <<-EOF
#{title 'Now Type Ticket'}

Sweet, now check this out. Type: #{result 'ticket'}
        EOF
        test { |res| res == [12, 47, 35] }
        setup { |vars| vars[:ticket] = [12, 47, 35] }
      end

      challenge do
        help <<-EOF
#{title 'Saved, Tucked Away'}

Fantastic! You've hung on to your lotto numbers, tucking them away inside a
#{bold 'variable'} called #{inverse 'ticket'}.

Now let's put your lotto numbers in order...sound good? Ruby has a great method
for that. Use: #{result 'ticket.sort!'}

You might notice that the method has an exclamation point at its end. This just
signals that we intend for Ruby to directly modify the same array that we've
built, rather than make a brand new copy that is sorted. You'll notice that if
you try calling #{inverse 'ticket'} again, it will be sorted permanently!

When you want to move on, just type #{result 'next'}
        EOF
      end
    end

    level do
      poem = <<-EOF
My toast has flown from my hand
And my toast has gone to the moon.
But when I saw it on television,
Planting our flag on Halley's comet,
More still did I want to eat it.
      EOF
      challenge do
        help <<-EOF
#{title 'Level #3 is Upon Us'}

You built a list. Then you sorted the list. And as you've seen, the \
#{inverse 'ticket'}
variable is now changed.

Now, let's look at how your second level went down:

  * #{bold 'Errors'}. If you try to reverse a number or do anything fishy, \
Ruby will skip
    the prompt and tell you to straighten up.
  * #{bold 'Arrays'} are lists of stored information.
  * #{bold 'Variables'} are a place to save stuff you might need again, as \
well as give
    that stuff a name. You used the equals sign to do this, in a process called
    assignment.
    Like: #{inverse 'ticket = [14, 37, 18]'}.

In all, there are just five levels in this course. You are already two-fifths
of the way to the end! This is simple stuff, don't you think? More good stuff up
ahead.

Let's change directions for a moment. I've stuffed a bit of poetry for you in a
certain variable. Take a look, by typing #{result 'print poem'}
        EOF
        setup do |vars|
          vars[:poem] = poem.dup
        end
        test do |_, _, output|
          output == poem
        end
      end

      challenge do
        help <<-EOF
#{title 'Sadly, You Hate Toast Poetry'}

Look, it's okay. You don't have to like it. You may even want to hack it up.
Welp, be my guest.

Instead of toast, maybe go for a melon or something. Try this one:
#{result 'poem[\'toast\'] = \'honeydew\''}
        EOF
        setup do |vars|
          vars[:poem] = poem.dup
        end
        test do |_, vars|
          vars[:poem] == poem.sub('toast', 'honeydew')
        end
      end

      challenge do
        help <<-EOF
Now type #{result 'print poem'} once again to see the new poem.

See how you only changed the first toast? The joke's on you, bread hater.

When you want to move on, type #{result 'next'}
        EOF
        setup do |vars|
          vars[:poem] = poem.sub('toast', 'honeydew')
        end
      end

      challenge do
        help <<-EOF
#{title 'Ready, Aim'}

The square brackets you just used are very common in Ruby. Remember, you typed:
#{inverse 'poem[\'toast\'] = \'honeydew\''}. That box that holds the word \
toast uses a square
bracket on each side. See 'em?

The two brackets are like a crosshairs used to line up precisely on a target.
These brackets mean, "I am looking for ____ somewhere in here." Ready ... aim
... #{bold 'data'}. Here, you were looking specifically for toast in order to \
swap it out
with a fruit.

Let's see if your new experience can help you produce the answer to this
question: what happens when we reverse this whole poem? #{result 'poem.reverse'}
        EOF
        setup do |vars|
          vars[:poem] = poem.sub('toast', 'honeydew')
        end
        test do |result|
          result == poem.sub('toast', 'honeydew').reverse
        end
      end

      challenge do
        help <<-EOF
#{title 'Too Much Reversal'}

Okay, I suppose that was expected. The whole poem's been turned backwards,
letter by letter. But say I really just wanted to reverse the lines only. In
other words, move the last line up to first and the first line down to last.
Backwards, yes, but not that backwards.

Ruby has a way. Try this: #{result 'poem.lines.to_a.reverse'}
        EOF
        setup do |vars|
          vars[:poem] = poem.sub('toast', 'honeydew')
        end
        test do |result|
          result == poem.sub('toast', 'honeydew').lines.to_a.reverse
        end
      end

      challenge do
        help <<-EOF
#{title 'Ringlets of Chained Methods'}

So...what actually happened there? You typed \
#{inverse 'poem.lines.to_a.reverse'} and
produced some Ruby magic.

First, you turned the #{inverse 'poem'} into a list using \
#{inverse 'lines.to_a'}. The #{inverse 'lines'} component
decided the way the string should be split up, and then one of our "to" methods,
#{inverse 'to_a'}, converted those splits into an Array. (to_array.)

Different methods, such as #{inverse 'bytes'} and #{inverse 'chars'} can be \
used in place of #{inverse 'lines'}. By
using #{inverse 'lines'} here, Ruby split the poem up according to each new \
line.

After that, you #{inverse 'reverse'}'d your Array. You had each line prepared \
in advance. And
then you reversed them. That's it!

And now, let's tack one more method on the end there, if you don't mind. Try:
#{result 'print poem.lines.to_a.reverse.join'}.
        EOF
        setup do |vars|
          vars[:poem] = poem.sub('toast', 'honeydew')
        end
        test do |_, _, output|
          output == poem.sub('toast', 'honeydew').lines.to_a.reverse.join
        end
      end
    end

    level do
      challenge do
        help <<-EOF
#{title 'Brace Yourselves! Level #4 is Here Now'}

Good show, my friend! The join method took that list of reversed lines and put
them together into a single string. (Sure, you could have also just used to_s.)

Time for a quick review.

  * Exclamation Points. Methods may have exclamation points in their name, which
    just means to impact the current data, rather than making a copy. No big
    deal.
  * Square Brackets. With these, you can target and find things. You can even
    replace them if necessary.
  * Chaining methods lets you get a lot more done in a single command. Break up
    a poem, reverse it, reassemble it: poem.lines.to_a.reverse.join.

Guess what? Methods can also have question marks. Try: poem.include? "my hand"
to check it out.

At this point, you may want to tinker with the poem a bit more. A complete list
of all the String methods is here: http://ruby-doc.org/core/classes/String.html.
Go ahead and try a few (such as poem.downcase or poem.delete.)

And now on to something new. When you're ready to move on, type: books = {}
        EOF
        setup do |vars|
          vars[:poem] = <<-EOF
My honeydew has flown from my hand
And my toast has gone to the moon.
But when I saw it on television,
Planting our flag on Halley's comet,
More still did I want to eat it.
          EOF
        end
        test do |_, vars|
          vars[:books] == {}
        end
      end

      challenge do
        help <<-EOF
A Wee Blank Book

You've made an empty hash, also known as: a dictionary. Hashes store related
information by giving reusable labels to pieces of our data.

We're going to stuff some miniature book reviews in this hash. Here's our rating
system:

  * :splendid → a masterpiece.
  * :quite_good → enjoyed, sure, yes.
  * :mediocre → equal parts great and terrible.
  * :quite_not_good → notably bad.
  * :abysmal → steaming wreck.

To rate a book, put the title in square brackets and put the rating after the
equals.

For example: books["Gravity's Rainbow"] = :splendid
        EOF
        setup do |vars|
          vars[:books] = {}
        end
        test do |_, vars|
          vars[:books] == { 'Gravity\'s Rainbow' => :splendid }
        end
      end

      challenge do
        help <<-EOF
More Bite-Size Reviews

Keep going! Fill it up with some useful reviews. And if you want to see the
whole list, just type: books

Again, the available ratings are: :splendid, :quite_good, :mediocre,
:quite_not_good, and :abysmal.

Notice that these ratings are not strings. When you place a colon in front of
a simple word, you get a Ruby symbol. Symbols are much cheaper than strings (in
  terms of computer memory.) If you need to use a word over and over in your
program itself, use a symbol. Rather than having thousands of copies of that
word in memory, the computer will store a symbol only once, and refer to it over
and over.

Once you've got three or four books in there, type: books.length. You should see
the right amount.
        EOF
        setup do |vars|
          vars[:books] = { 'Gravity\'s Rainbow' => :splendid }
        end
        test do |result, vars|
          vars[:books].length > 2 && result == vars[:books].length
        end
      end

      challenge do
        help <<-EOF
Wait, Did I Like Gravity's Rainbow?

See, the length method works on strings, list and hashes. One great thing about
Ruby is that method names are often reused, which means a lot less stuff for you
to remember.

If you'd like to look up one of your old reviews, just put the title of the book
in the square box again. Leave off the equal sign this time, though, since
you're not assigning any information. You're just researching!

Do it like this: books["Gravity's Rainbow"]
        EOF
        test do |result, vars|
          result == vars[:books]["Gravity's Rainbow"]
        end
      end

      challenge do
        help <<-EOF
Hashes as Pairs

Keep in mind that hashes won't keep things in order. That's not their job. It'll
just pair up two things: a key and a value. In your reviews, the key is the
book's title and the value is the rating, in this case a symbol.

If you want to see a nice list of the book titles you've reviewed: books.keys

When you want to move on, type next
        EOF
      end

      challenge do
        help <<-EOF
Are You Harsh?

So are you giving out harsh, unfair reviews? Let's keep score with this hash:
ratings = Hash.new(0)
        EOF
        test do |_, vars|
          vars[:ratings] == Hash.new(0)
        end
      end

      challenge do
        help <<-EOF
Are You Harsh?

That command was another way to build an empty hash. The zero you passed in will
set all of your initial rating counts to zero.

Okay, now let's count up your reviews. Stay with me on this one.

Type: books.values.each { |rate| ratings[rate] += 1 }

(That | in the code is called the pipe character. It's probably located right
above the Enter key on your keyboard.)

This code will turn all your unique values in books...into keys within the new
ratings hash. Crazy, right? Then, as it looks at each rating you originally gave
in books, it will increase the count value for that rating in ratings

After you've build your new hash of count values, type ratings again to see the
full tally. This new hash will show you a rating followed by the number of times
you've given that rating.

When you want to move on, type next
        EOF
        setup do |vars|
          vars[:ratings] = Hash.new(0)
          vars[:books] = {
            'Gravity\'s Rainbow' => :splendid
          } unless vars[:books].is_a?(Hash) && vars[:books].length > 0
        end
      end

      challenge do
        help <<-EOF
A Tally

One of the amazing new things we've just used is called a block. Basically,
a block is a chunk of Ruby code surrounded by curly braces. We'll take a closer
look at them later.

But for now, let's try another block:

5.times { print "Odelay!" }

When you want to move on, type next. You want the badge, don't you?
        EOF
      end
    end

    level do
      comics = <<-EOF
Achewood: http://achewood.com/
Dinosaur Comics: http://qwantz.com/
Perry Bible Fellowship: http://cheston.com/pbf/archive.html
Get Your War On: http://mnftiu.cc/
      EOF
      new_comics = comics + 'Cat and Girl: http://catandgirl.com/'

      challenge do
        help <<-EOF
Now Arriving at Level #5

Blocks are always attached to methods. You saw this with the times method, which
took the block and ran its code over and over. (In this case: five times.)

This last lesson was a bit longer. You've probably used up three minutes
learning about:

  * Hashes. The little 'dictionary' with the curly braces: {}.
  * Symbols. Tiny, efficiently reusable code words with a colon: :splendid.
  * Blocks. Chunks of code which can be tacked on to many of Ruby's methods.
    Here's the code you used to build a scorecard:
    books.values.each { |rate| ratings[rate] += 1 }.

On to the next thing, okay? On your computer, you probably have a lot of
different files. Some files have pictures in them, some have programs in them.
And files are often organized into folders, also called: directories.

I've prepared a few directories for you. Take a look, using the following
command: Dir.entries "/"
        EOF
        test do |result|
          result == Dir.entries('/')
        end
      end

      challenge do
        help <<-EOF
The Private Collection of Dr. Dir

You've just listed out everything in the top directory, which is called the
root. It's indicated by the single slash in your string parameter. It contains
some programs, as well as other tutorials and such.

So, what exactly is that Dir.entries method? Well, it's just a method, like the
others you've seen. Dir has a collection of methods for checking out file
directories, and entries is being called on the Dir variable. The entries method
just lists everything in the directory you've indicated!

One other little thing we haven't really talked about quite yet: method
arguments. A few are highlighted below.

  * Dir.entries "/" -- Anything listed after a method is considered an
    'attachment'.
  * print poem -- See, print is just an ordinary method, while the poem is what
    got attached for printing.
  * print "pre", "event", "ual", "ism" -- This bit has several arguments! Ruby
    makes us use commas to distinguish between them.

Next up, we'll list just the text files in our directory using a bracket
notation. Remember how it searches?

Try: Dir["*.txt"]
        EOF
        setup do
          File.write('comics.txt', comics)
        end
        test do |result|
          result == Dir['*.txt']
        end
      end

      challenge do
        help <<-EOF
Come, Read Comics With Me

The Dir[] syntax is kind of like entries, but instead searches for files with
wildcard characters.

Here, we see those square brackets again! Notice how they still mean, "I am
looking for _____?"

Dir["*.txt"] says to Ruby: "I am looking for any files which end with .txt."
The asterisk indicates the "any file" part. Ruby then hands us every file that
matches our request.

Alright, let's crack open this comics file, then! We'll use a new method to do
it.

Here's the way: print File.read("comics.txt")
        EOF
        test do |_, _, output|
          output == File.read('comics.txt')
        end
      end

      challenge do
        help <<-EOF
Mi Comicas, Tu Comicas

Alright, then! Now we can start to use files to store things. This is great
because normally when we exit Ruby, all our variables will be gone. Ruby, by
itself, forgets these things. But if we save things in files, we can read those
files in future Ruby escapades.

Hey, and guess what? The Home directory is yours now! I gave it to you! Am I
generous or what?!

First thing we'll do is make a copy of the comics file and put in new folder
called 'Home'.

To do that, you'll want to use a copying method called cp on a variable called
FileUtils.

Use FileUtils.cp('comics.txt', 'Home/comics.txt')
        EOF
        setup do
          Dir.mkdir('Home') unless Dir.exist?('Home')
        end
        test do
          File.exist?('Home/comics.txt') && \
            File.read('Home/comics.txt') == comics
        end
      end

      challenge do
        help <<-EOF
Okay, you've got a copy, and it's located in the right directory. Check it out!

Use Dir["Home/*.txt"]

Type next to move to the next lesson when you're finished.
        EOF
        setup do
          File.write('Home/comics.txt', comics)
        end
      end

      challenge do
        help <<-EOF
Your Own Turf

To add your own comic to the list, let's open the file in append mode,
which we indicate with the "a" parameter. This will allow us to put new stuff
at the end of the file.

Start by entering this code: File.open("Home/comics.txt", "a") do |f|

And Now For the Startling Conclusion

So your prompt has changed, see that? Your prompt is a double dot now.

In this tutorial, this prompt means that Ruby is expecting you to type a little
bit more. As you write further lines of Ruby code, the double-dots will continue
until the tutorial sees you are completely finished.

Alright, so here's more code. You've already typed the first line, so just enter
the second line.

File.open("Home/comics.txt", "a") do |f|
  f << "Cat and Girl: http://catandgirl.com/"
end

Ruby Sits Still

The last line will add the Cat and Girl comic to the list, but Ruby's going to
wait until you're totally finished to take action.

This means we'll also need to wrap up the code block you've started. Turns out,
you actually opened a new block when you typed that do keyword.

So far the blocks we've seen have used curly braces, but this time we'll be
using do and end instead. A lot of Rubyists will use a do...end setup when the
block goes on for many lines.

Let's get that block finished now, with your very own end.
        EOF
        test do
          File.exist?('Home/comics.txt') && \
            File.read('Home/comics.txt') == new_comics
        end
      end

      challenge do
        help <<-EOF
Ruby Sits Still

Sweet! You've added that brand new comic to the end of the file. You can see for
yourself, using the read method you saw earlier:
print File.read("Home/comics.txt").

When you want to move on to the next lesson, type next.
        EOF
        setup do
          File.write('Home/comics.txt', new_comics)
        end
      end

      challenge do
        help <<-EOF
The Clock Nailed To the File

I wonder, what time was it when you changed your file? We can check that out.

Type: File.mtime("Home/comics.txt").
        EOF
        test do |result|
          result == File.mtime('Home/comics.txt')
        end
      end

      challenge do
        help <<-EOF
Just the Hour Hand

Excellent, there's the exact time, precisely when you added to the file.
The mtime method gives you a nice Ruby Time object.

If you want to check just what hour it was, hit the up arrow key to put your
previous entry in the console. Then modify the line to say:
File.mtime("Home/comics.txt").hour.
        EOF
        test do |result|
          result == File.mtime('Home/comics.txt').hour
        end
      end

    end
  end
end
