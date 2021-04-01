# Haka Website ![](https://haka-website.web.app/assets/haka-32x32.png) <sup><sub>[DEMO](https://haka-website.web.app)</sub></sup>

###### Click on the link beside the title above to view the website.

&nbsp;&nbsp;&nbsp;&nbsp;An animated portfolio website developed to my parents company using `Imba` and `Firebase`. It includes a header, an about section, a services section, a portfolio section - made with `Masonry` library - and a footer/contact section. Also, it's responsive and has an administrador page where you can change the portfolio categories and the job images from each category.

### How to run

&nbsp;&nbsp;&nbsp;&nbsp;First, copy the code below into your terminal.
```
git clone https://github.com/LucasSFranco/haka-website
cd haka-website
npm install
```
&nbsp;&nbsp;&nbsp;&nbsp;Then, you must create your own project in [Firebase](https://firebase.google.com/), copy your Firebase project configuration and place it inside `/haka-website/src/firebase.imba`. In addition, create an account in the auth section of your Firebase project to gain access to the administrator page, available at `/admin` route.

&nbsp;&nbsp;&nbsp;&nbsp;Finally, just type the code below into the terminal and enjoy.
```
npm run start
```
