# finchemsha

installation:

clone the repo and save it anywhere in your desktop!

locate appname/database folder and upload the .sql database to your local server
navigate to appname/frontend and locate quasar.config.js.
this is the file where you set up your database url to the api!

next! head to appname/php-laravel-api , and head over tio the .env file ! you can edit these files to fit the details of the database you just uploaded

incase you wish to move to production! just compile the frontend folder and upload the php-laravel-api to an online hosting.
to compile apps refer to jhttps://quasar.dev for more platforms! you can compile to desktop,ios&android,SPA&PWA for this situation ! you can just open your cmd and navigate to your appname/frontend folder and type this command 
$quasar build  and it will compile it into a single page application for you
