# Welcome to GitClic App<img src="https://res.cloudinary.com/da7i5um2q/image/upload/v1707118423/gitclic_icon_rx79qn.png" width="50">
GitClic is a Flutter mobile application developed with the primary objective of displaying the commit history using the GitHub REST API.

# Features
- Search for commits from a repository. 
- See weekly commits.
- Check your repositories.
- Display faster your lastest commits.
- See commit detail with: author and commiter data, message, stats and comments.
- Auth services which includes: Sign up, sign in, and recover account with token. Supabase as BaaS https://supabase.com/ was implemented.

<img src="https://res.cloudinary.com/da7i5um2q/image/upload/v1707118881/Screenshot_1707102455_pms1zy.png" width="200"><img src="https://res.cloudinary.com/da7i5um2q/image/upload/v1707118903/Screenshot_1707102466_zyrp1c.png" width="200"><img src="https://res.cloudinary.com/da7i5um2q/image/upload/v1707118897/Screenshot_1707102487_knzq0p.png" width="200"><img src="https://res.cloudinary.com/da7i5um2q/image/upload/v1707118916/Screenshot_1707102494_gmziru.png" width="200"><img src="https://res.cloudinary.com/da7i5um2q/image/upload/v1707119154/Screenshot_1707102414_o50gme.png" width="200">


# Install tutorial
GitClic is easy to install and available for Android and iOS devices, please follow carefully the next instructions for both devices:

## Please user with test credentials or sign up with your own real data
### email test: kevinlopezs15@gmail.com
### password test: 123456

## Android devices installation:
### Step 1:
-Please follow the next  video instruction, remember copy and paste the download link https://i.diawi.com/D9mTyt into your head of browser search in your phone:

https://github.com/kevinlopezs/gitclic/assets/97491003/895fa79c-897a-4607-a403-e32daa197dd7

## iOS devices installation:
### Step 1 :
- Please follow the next  video instruction, remember copy and paste the download link https://i.diawi.com/HaoaAF into your head of browser search in your phone:

  https://github.com/kevinlopezs/gitclic/assets/97491003/f499d387-79ea-4698-a751-17288248fcbf

# Figma design
To create this beatiful app was necessary planning and design with Figma. In this [link](https://www.figma.com/file/tGgKDyBPkEL8QKCZgIGShl/Gitclic-App?type=design&node-id=0-1&mode=design) you can find GitClic figma design. 

# Public postman workspace
To test and consuming GitHub API REST services, was necessary to create environments to orders endpoints. Check the [link](https://www.postman.com/cloudy-eclipse-659431/workspace/github-api/collection/31463540-f6044c92-3f68-45fe-9f62-264a216bcaf5?action=share&creator=31463540&active-environment=31463540-8fa79181-5540-4acd-bf72-73ef9ddff633) to access. 

# App Testing
E2E testing has been conducted using the Android Emulator with a virtual device emulating a Samsung S23. This comprehensive testing approach allows us to evaluate the application's performance and behavior under different scenarios. And Manual testing was performed on a physical iOS device, specifically an iPhone 13, using Xcode. The application's behavior and user interface were thoroughly examined to ensure a seamless experience for iOS users. 

### Android Emulator - Samsung S23 - See test  https://youtu.be/f-JxC-hh0bU 
### iOS Device - iPhone 13 - See test  https://youtu.be/GH5WbKKIfvw

# Configuration of the .env File
It is mandatory to configure the .env file with the necessary environment variables and save it in the project's root. You can download the example file with credentials from this [link](https://res.cloudinary.com/da7i5um2q/raw/upload/v1707095060/yc984i1domzmjyhvjpxj.env) . Remember to create a new empty file( with notepad in windows or texteditor in macOS)for the downloaded file.env before saving it in the root path of GitClic, where files like analysis_options, .metadata, .flutter-plugins, etc., are located.

# Maintenance and updates
Consider future enhancements by transitioning from manual token usage to more secure authentication methods. Two viable options are:

### Direct GitHub API Authentication:
•	Authenticate users directly through GitHub API credentials.

•	Enable users to view their commit and repository information seamlessly.

•	See [Authorizing OAuth apps - GitHub Docs](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authorizing-oauth-apps)
### Supabase GitHub Authentication:
•	Leverage Supabase's GitHub authentication capabilities.

•	Streamline the user authentication process and provide a unified experience

•	See [Login with GitHub | Supabase Docs](https://supabase.com/docs/guides/auth/social-login/auth-github)
### Token Expiry Handling:
To enhance user security and experience, a mechanism has been implemented to check token expiration during app usage. If the token expires, the user receives a notification and is automatically logged out. Currently, manual logout is also available through the HomePage menu.

# GitClic App Documentation
In this part you can download full document with project description, structure, configuration, environment variables, data models, controllers, interactions, UI views, external services API REST, testing and future updates. 

### [See document](https://drive.google.com/file/d/1t5WRVFtYl1qk7A5JeooIGJLXal70i7y7/view?usp=sharing)  
