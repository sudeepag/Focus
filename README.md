![banner3](https://cloud.githubusercontent.com/assets/11940172/15417985/69d538d6-1e10-11e6-9bea-a1cedcc718ab.png)

Focus is a masking view that allows you to focus on or highlight UI elements. It is easy to use and highly customizable - you can call it with a single function call and choose between circular fades and rectangular blurs. Focus is great for tutorials or walkthrough where attention needs to be directed to a certain area of the screen (or even for creating quick screenshots for the App Store). 

![language](https://img.shields.io/badge/Language-%20Swift%20-orange.svg)
[![CI Status](http://img.shields.io/travis/Sudeep Agarwal/Focus.svg?style=flat)](https://travis-ci.org/Sudeep Agarwal/Focus)
[![Version](https://img.shields.io/cocoapods/v/Focus.svg?style=flat)](http://cocoapods.org/pods/Focus)
[![License](https://img.shields.io/cocoapods/l/Focus.svg?style=flat)](http://cocoapods.org/pods/Focus)
[![Platform](https://img.shields.io/cocoapods/p/Focus.svg?style=flat)](http://cocoapods.org/pods/Focus)

## Installation

Focus is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```swift
pod "Focus"
```

And then run:

`$ pod install`

#### Manual Installation
To manually install Focus, simply add `FocusView.swift` to your project.

## Usage

First, import Focus into your project.

```swift
import Focus
```

Creating a FocusView is the same as creating a UIView:

```swift
let fv = FocusView(frame: self.view.bounds)
```

Don't forget to add the subview!

```swift
self.view.addSubview(fv)
```

### Styles

Focus has two styles - `.Fade` and `.Blur`.

#### Blur

`.Blur` is a blurred mask with blur style of your choice (`.ExtraLight`, `.Light` and `.Dark`).

<img src="https://cloud.githubusercontent.com/assets/11940172/15418328/3c27e6a6-1e13-11e6-8480-1ab4e91b4dc1.PNG" alt="blur" width="187.5" height="333.5"> 
 
To set the blur style, use
```swift
fv.blurStyle = .Dark // default blur style is .Dark
```

#### Fade

`.Fade` is a translucent mask with an opacity and color of your choice.

<img src="https://cloud.githubusercontent.com/assets/11940172/15418327/3c26995e-1e13-11e6-9373-dfa70e180623.PNG" alt="fade" width="187.5" height="333.5"> 
 
To set the opacity, use
```swift
fv.opacity = 0.7 // default opacity is 0.5
```
To set the color, use
 
```swift
fv.color = UIColor.blackColor() // default color is UIColor.blackColor()
```

### Styles

Focus has two types - `.Circle` and `.Square`.

`.Circle` is a round mask around the input view. `.Square` is a rectangular mask that fits the frame of the input view.

### Focus

Focusing on the view is simple.
```swift
fv.focusOnView(theView, // the view you want to focus on 
              focusType: .Square, // the type of the focus
              focusStyle: .Fade, // the style of the focus
              padding = 10.0) // the padding around the view if you need any 
```

To remove the focus, 
```swift
fv.removeFocus()
```

## License

Copyright (c) 2016 Sudeep Agarwal

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
