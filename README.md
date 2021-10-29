<!-- PROJECT LOGO -->
<br />

![GitHub repo size](https://img.shields.io/github/repo-size/dylandasilva1999/rapture-ios-app?color=%23DE0E30)
![GitHub watchers](https://img.shields.io/github/watchers/dylandasilva1999/rapture-ios-app?color=%23DE0E30)
![GitHub language count](https://img.shields.io/github/languages/count/dylandasilva1999/rapture-ios-app?color=%23DE0E30)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/dylandasilva1999/rapture-ios-app?color=%23DE0E30)
[![LinkedIn][linkedin-shield]][linkedin-url]
[![Instagram][instagram-shield]][instagram-url]
[![Behance][behance-shield]][behance-url]

<h6 align="center">Dylan da Silva iOS 304</h6>
<p align="center">
</br>
   
  <a href="https://github.com/dylandasilva1999/rapture-ios-app">
    <img src="Images/Final App Icon.png" alt="Logo" width="140" height="140">
  </a>
  
  <h3 align="center">Rapture</h3>

  <p align="center">
    Social Media iOS Application<br>
      <a href="https://github.com/dylandasilva1999/rapture-ios-app"><strong>Explore the docs »</strong></a>
   <br />
   <br />
   <a href="">View Demo</a>
    ·
    <a href="https://github.com/dylandasilva1999/rapture-ios-app/issues">Report Bug</a>
    ·
    <a href="https://github.com/dylandasilva1999/rapture-ios-app/issues">Request Feature</a>
  </p>

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
* * [Project Description](#project-description)
  * [Built with](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Features and Functionality](#features-and-functionality)
   * [Features](#features)
   * [Functionality](#functionality)
* [Concept Process](#concept-process)
   * [Ideation](#ideation)
   * [Wireframes](#wireframes)
   * [User-flow](#user-flow)
* [Development Process](#development-process)
   * [Implementation Process](#implementation-process)
        * [Highlights](#highlights)
        * [Challenges](#challenges)
   * [Reviews and Testing](#feedback-from-reviews)
        * [Feedback from Reviews](#feedback-from-reviews)
   * [Future Implementation](#future-implementation)
* [Final Outcome](#final-outcome)
    * [Mockups](#mockups)
    * [Video Demonstration](#video-demonstration)
    * [Promotional Video](#promotional-video)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)

<!--PROJECT DESCRIPTION-->
## About the Project

![image1][image1]

### Project Description

According to an article by Matt Schmidt in 2021 on Forbes, the video gaming industry is a “$180 billion category that grew more than 20% in 2020”. It is evident how many people play videos games and spend time communicating to other individuals. As per Schmidt (2021) Twitch “has 15 million daily users, and Discord sees over 140 million monthly users” with the only/closest to a social media platform for gamers being Reddit.

Further in an article on Medium by ScaleTech in 2021, title “Is Online Gaming The New Social Media in 2021?” showcases the importance of social media for gamers. As stated by ScaleTech (2021) social interaction “among members of a multiplayer community shares similarities to social media group interaction” and towards “becoming a social network is a natural evolution that brings the best of both worlds”.

Rapture is a social media mobile application for gamers.

### Built With

* [Swift](https://swift.org/)
* [SwiftUI](https://developer.apple.com/xcode/swiftui/#:~:text=SwiftUI%20helps%20you%20build%20great,set%20of%20tools%20and%20APIs.)
* [Firebase](https://firebase.google.com/?gclid=Cj0KCQjwse-DBhC7ARIsAI8YcWItyGR2ha-LRzTOOglVa0RTNXSePdd7fMLvbCnR6ERBs4oI4ken-SYaAmsqEALw_wcB&gclsrc=aw.ds)
* [GitHub](https://github.com/)

<img src="https://images.ctfassets.net/yr4qj72ki4ky/legacyBlogPost670Thumbnail/93e6c8af94bd3aef65a7efdaaeb522f3/img.png" width="5%" height="5%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://www.swiftbysundell.com/images/discover/swiftui/icon.png" width="5%" height="5%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://upload.wikimedia.org/wikipedia/commons/4/46/Touchicon-180.png" width="5%" height="5%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://upload.wikimedia.org/wikipedia/commons/9/91/Octicons-mark-github.svg" width="5%" height="5%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<!-- GETTING STARTED -->
## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Requires iOS 14 and Xcode 12

### Installation

1. In Xcode go to
  ```sh
  File -> Swift Packages -> Add Package Dependency
  ```
2. and paste in the repo's url:
`https://github.com/dylandasilva1999/rapture-ios-app`

Open in Xcode 12 or later.

3. Install Cocoapods
```sh
cd your/directory
pod install
```

<!-- FEATURES AND FUNCTIONALITY-->
## Features and Functionality

### Features

#### Secure Firebase Authentication.
![image2][image2]
Secure log in and register and forget password.

#### Social Feed.
![image3][image3]
Social feed to view all the posts made (ordered by latest).

#### Like & Comment.
![image4][image4]
User can like and comment on a post.

#### Make A Post.
Make a post with a caption and image.

#### Follow & Unfollow.
![image5][image5]
Follow or unfollow other users.

#### Edit Profile Details.
![image6][image6]
Edit your profile information.

#### View Other Profiles.
![image7][image7]
Search and view other users profiles and posts.

#### Full Onboarding.
![image8][image8]
Onboarding when app is launched for first time.

### Functionality

* `Firestore Database` for storing users, timeline, posts, following, followers, comments and all posts.
* `Firebase Storage` for storing user profile images and posts.
* `Firebase Authentication` for secure email & password log in (with forget password).
* `iOS Widget` the open the Rapture application.
* `Cocoapods` for dependency management.
* `ScrollView`, `HStack, VStack`, `ZStack` were used for creating layouts.
* `SDWebImageSwiftUI` framework for loading images for profile and posts.
* `@EnviromentObjects`, `@State`, `@StateObject`, `@ObservedObject` for linking functions and files.

<!-- CONCEPT PROCESS -->
## Concept Process

The `Conceptual Process` is the set of actions, activities and research that was done when starting this project.

### Ideation

![image9][image9]
![image10][image10]

### Wireframes

![image11][image11]
![image12][image12]

<!-- DEVELOPMENT PROCESS -->
## Development Process

The `Development Process` is the technical implementations and functionality done in the backend of the application.

### Implementation Process
<!-- stipulate all of the functionality you included in the project -->

#### Design Architecture

`MVC` design architecture used for structuring the project.

#### Highlights
<!-- stipulated the highlight you experienced with the project -->
* One major highlight was getting the `Firebase database and storage` working 😅.
* Adding the ability to `forget and reset` your password.
* The `UI/UX design` following the gaming neon theme 🤩.
* `Custom Validation` throughout Rapture.
* Another highlight is adding the extra functionality of `commenting` on a post 👏.
* The extra functionality of `following and unfollowing` a user.

#### Challenges
<!-- stipulated the challenges you faced with the project and why you think you faced it or how you think you'll solve it (if not solved) -->
* Small bug where when the user has signed in and opens the application again, it displayes the sign in for split second first.
* Minor bug where the onboarding page count is updated but does not move to the sign in screen.
* `Uploading of images` and `updating profile` information.

### Reviews & Testing

The `Reviews & Testing` was done through a video demonstration, and a google form with questions related to the application.

#### Feedback from Reviews

`Peer Reviews` were conducted by my fellow students and lecturer. The following feedback I found useful:

* "Very cool and badass, I like the dark theme and its very suitable to gamers".
* "The theme is cohesive and fits well in the scope of the project".
* "Feeds are accessible and well thought out and well designed. The layout makes sense in the theme of the app".
* "The ability to switch between grid and single view is a nice feature for the feed. Everything else looks nice and seems to work as it should".

### Future Implementation
<!-- stipulate functionality and improvements that can be implemented in the future. -->

* Add the ability to use the `camera` 📷 for post and profile images.
* Navigate to a user profile via the social feed by clicking on the profile image.
* `Upload of more than one image` for a post, and `video` uploads.
* `Gaming News` section within the application.

<!-- MOCKUPS -->
## Final Outcome

### Mockups

![image13][image13]

<!-- VIDEO DEMONSTRATION -->
### Video Demonstration

To see a run through of the application, click below:

[View Demonstration](https://www.youtube.com/watch?v=3usy-zSvFDY)

<!-- PROMO VIDEO -->
### Promotional Video

To see the promotiomal video, click below:

[View Promo Video](https://youtu.be/M8j41fDmdXQ)

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/dylandasilva1999/rapture-ios-app/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->
## Contributing

Contributions are what makes the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- AUTHORS -->
## Authors

* **Dylan da Silva** - [DylandaSilva](https://github.com/dylandasilva1999)

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.\

<!-- LICENSE -->
## Contact

* **Dylan da Silva** - [@dylandasilva.designs](https://www.instagram.com/dylandasilva.designs/) - dylandasilva.b@gmail.com
* **Project Link** - https://github.com/dylandasilva1999/rapture-ios-app

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* [My lecturer Armand Pretorius](https://github.com/ArmandPretorius)
* [Forbes Article](https://www.forbes.com/sites/forbesbusinesscouncil/2021/03/16/why-the-gaming-industry-could-be-the-new-social-media/?sh=1715e64d8f3a)
* [ScaleTech Article](https://scaletech.medium.com/is-online-gaming-the-new-social-media-in-2021-95890ff90bf8)
* [Youtube Tutorial](https://www.youtube.com/watch?v=fgDZIEwqJXw&list=PLdBY1aYxSpPVI3wTlK1cKHNOoq4JA3X5-)
* [Custom Fonts](https://www.simpleswiftguide.com/how-to-use-custom-fonts-in-swift-ios-app-using-swiftui/)
* [Sign In & Sign Up](https://www.youtube.com/watch?v=GiCTgsH0dtk&t=715s)
* [Neon Effect](https://www.hackingwithswift.com/plus/swiftui-special-effects/shadows-and-glows)

<!-- MARKDOWN LINKS & IMAGES -->
<!--[image1]: Images/Image1.png-->

[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/dylan-da-silva-72b56a20a/
[instagram-shield]: https://img.shields.io/badge/-Instagram-black.svg?style=flat-square&logo=instagram&colorB=555
[instagram-url]: https://www.instagram.com/dylandasilva.designs/
[behance-shield]: https://img.shields.io/badge/-Behance-black.svg?style=flat-square&logo=behance&colorB=555
[behance-url]: https://www.behance.net/dylandasilva_

<!-- MARKDOWN LINKS & IMAGES -->
[image1]: Images/Image1.png
[image2]: Images/Image2.png
[image3]: Images/Image3.png
[image4]: Images/Image4.png
[image5]: Images/Image5.png
[image6]: Images/Image6.png
[image7]: Images/Image7.png
[image8]: Images/Image8.png
[image9]: Images/Image9.png
[image10]: Images/Image10.png
[image11]: Images/Image11.png
[image12]: Images/Image12.png
[image13]: Images/Image13.jpg
