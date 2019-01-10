# Demo iOS App Using Unplash API

This is a demo app using [Unplash](https://unsplash.com) API.

This is a simple app that only fetch the images from the API and display the list and the details
using collectionView


## Architecture Used
MVC + Coordinator Pattern

### How To Install

1. Cocoapods needs to be install first on your machine

2. Clone the project

3. run in the terminal
	
	``` 
	pod install 
	``` 

4. go inside the directory and 
	``` 
	open freeHero.xcworkspace 
	```

5. open the 
	``` 
	PrivateConstants.swift 
	```

6. replace the empty string with your access token from unplash 

``` 
let UnplashAccessToken: String = "<access token>" 

```


