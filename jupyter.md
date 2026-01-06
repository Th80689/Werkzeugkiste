# Docker image
Jupyter ist nicht mehr im Docker-Hub - nur noch auf quay.io:   
```docker pull quay.io/jupyter/minimal-notebook```



docker run -it --rm -p 10000:8888 -v "${PWD/jupyter}":/home/jovyan/work quay.io/jupyter/minimal-notebook

docker run --name jupyter -it --rm -p 10000:8888 -v "/Users/Thomas/jupyter":/home/jovyan/work quay.io/jupyter/minimal-notebook


PW: jupyter@M1