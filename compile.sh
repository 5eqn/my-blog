flutter build web
docker build -t my-blog .
docker tag my-blog win:5000/my-blog
docker push win:5000/my-blog
