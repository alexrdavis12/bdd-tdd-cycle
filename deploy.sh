#!bin/bash
git add *
git commit --all " "
git push
git push heroku master
heroku open