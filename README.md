<p align="center">
   <img src="https://raw.githubusercontent.com/watery-desert/assets/main/flower_selling_app/project_cover.png" alt="Loading Animation Widget" />
</p>
<div align="center">
   <a href="https://www.instagram.com/watery_desert/">
   <img src="https://raw.githubusercontent.com/watery-desert/assets/main/social_logo/instagram.png" height="24" alt="instagram: watery_desert"></a>
   <a href="https://twitter.com/watery_desert">
   <img src="https://raw.githubusercontent.com/watery-desert/assets/main/social_logo/twitter.png" height="24" alt="twitter: watery_desert"></a>
   <a href="https://dribbble.com/watery_desert">
   <img src="https://raw.githubusercontent.com/watery-desert/assets/main/social_logo/dribbble.png" height="24" alt="dribbble: watery_desert"></a>
   <a href="https://www.youtube.com/channel/UCMr8V70B4402CNOJEYQ30Qg">
   <img src="https://raw.githubusercontent.com/watery-desert/assets/main/social_logo/youtube.png" height="24" alt="youtube: watery_desert"></a>
</div>
<br>

# Flower selling app using firebase backend.
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


<br>
<details>
   <summary>flutter packages developed by watery desert</summary>
   <br>

  ● [Sliding Clipped Nav Bar](https://github.com/watery-desert/sliding_clipped_nav_bar)\
  ● [Water Drop Nav Bar](https://github.com/watery-desert/water_drop_nav_bar)\
  ● [Swipeable Tile](https://github.com/watery-desert/swipeable_tile)\
  ● [Loading Animation Widget](https://github.com/watery-desert/loading_animation_widget)

   </summary> 
</details>
<br>






