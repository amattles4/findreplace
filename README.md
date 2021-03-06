##Synopsis

This simple Ruby script will take any files you place in the “input” file, extracts any emails it finds, places them in a new CSV file, and removes the original files. It’s a bit clumsy as it is, and there are some fancy terminal outputs for experience, so feel free to remove and submit a pull request.

Enjoy!

##Code Explanation

|-Dir
|--input	<- Here’s where you put your files
|--readme.md	<- This is, um, the file you’re reading.
|--replace.rb	<- Your ruby script.
|--output.csv 	<— And the new file where all your search terms are collected.

To run the Ruby file in Terminal (on Mac):
~You: ruby replace.rb

##Reg Ex and Searching

You don’t have to search for emails, you can search for any Regular Expression. Find new ones on regexr.com or another Reg Ex generator.

##Motivation

If you’ve ever wanted to extract emails from a large number of files of various types, you can probably appreciate the simplicity of this one.

##Contributors

Joe Hanko — github.com/joehanko
Aaron Attles

##License

MIT License

Copyright (c) 2017 Joe

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.