# Flower selling app using firebase backend.

[![Instagram Badge](https://img.shields.io/badge/-Instagram-e84393?style=for-the-badge&labelColor=e84393&logo=instagram&logoColor=white)](https://instagram.com/watery_desert)
[![Twitter Badge](https://img.shields.io/badge/-Twitter-1ca0f1?style=for-the-badge&logo=twitter&logoColor=white&link=https://twitter.com/watery_desert)](https://twitter.com/watery_desert)

#### If you like this open-source project please consider supporting me 💛

<a href="https://www.buymeacoffee.com/watery_desert"><img src="https://raw.githubusercontent.com/watery-desert/assets/main/watery_desert/bmc-button.png" height="56"></a>

<div>


### ⚠️ Add firebase and enable email authentication and firstore database or it won't work
## Don't know how to do?
 - Craete a firebase project no need to enable `Google Analytics`.
 - Open the project then add a new iOS app. 
 - Download the `GoogleService-info.plist` and put it inside `ios/Runner/`
 - Go to `Authentication` from left panel then `Sign-in method` and Enable `Email/Password`
 - Select `Firestore Database` then `create database` this will take few clicks then you done.
- Go to the rules delete the time validation line and `true` after if. Be aware this will make the database public and you don't wanna do in production. 
```
allow read, write: if // add here 'true;'
      request.time < timestamp.date(2022, 1, 2); // delete this line
```
### Screenshots

<table>
   <tr>
      <td align="center">
         <img src="https://raw.githubusercontent.com/watery-desert/assets/main/flower_selling_app/screenshots/onboarding.png" width="200"/>
      </td>
      <td align="center">
         <img src="https://raw.githubusercontent.com/watery-desert/assets/main/flower_selling_app/screenshots/login.png" width="200"/>
      </td>
      <td align="center">
         <img align="right" src="https://raw.githubusercontent.com/watery-desert/assets/main/flower_selling_app/screenshots/home.png" width="200"/>
      </td>
   </tr>
   <tr>
      <td align="center">
         <img align="left" src="https://raw.githubusercontent.com/watery-desert/assets/main/flower_selling_app/screenshots/flower_detail.png" width="200"/>
      </td>
      <td align="center">
         <img align="left" src="https://raw.githubusercontent.com/watery-desert/assets/main/flower_selling_app/screenshots/cart.png" width="200"/>
      </td>
      <td align="center">
         <img align="left" src="https://raw.githubusercontent.com/watery-desert/assets/main/flower_selling_app/screenshots/profile.png" width="200"/>
      </td>      
   </tr>
</table>






### Screen recordings

<table>
   <tr>
      <td align="center">
         <img src="https://raw.githubusercontent.com/watery-desert/assets/main/flower_selling_app/screen_recordings/authentication_home.gif" width="200"/>
      </td>
      <td align="center">
         <img src="https://raw.githubusercontent.com/watery-desert/assets/main/flower_selling_app/screen_recordings/onboarding.gif" width="200"/>
      </td>
      <td align="center">
         <img align="right" src="https://raw.githubusercontent.com/watery-desert/assets/main/flower_selling_app/screen_recordings/add_to_cart.gif" width="200"/>
      </td>
   </tr>
   <tr>
      <td align="center">
         <img align="left" src="https://raw.githubusercontent.com/watery-desert/assets/main/flower_selling_app/screen_recordings/cart.gif" width="200"/>
      </td>
      <td align="center">
         <img align="left" src="https://raw.githubusercontent.com/watery-desert/assets/main/flower_selling_app/screen_recordings/dark_mode.gif" width="200"/>
      </td>
      <td align="center">
         <img align="left" src="https://raw.githubusercontent.com/watery-desert/assets/main/flower_selling_app/screen_recordings/signout.gif" width="200"/>
      </td>      
   </tr>
</table>







