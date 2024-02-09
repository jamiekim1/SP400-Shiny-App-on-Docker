FROM rocker/shiny:latest

RUN apt-get update && apt-get install -y \
    git \
    libxml2-dev \
    libssl-dev \
    libcurl4-openssl-dev \

# Clone
RUN git clone https://github.com/jamiekim1/SP400-Shiny-App-on-Docker.git /srv/shiny-server/sp400app

RUN Rscript /srv/shiny-server/sp400app/requirements.R

EXPOSE 3838

CMD ["R", "-e", "shiny::runApp('/srv/shiny-server/sp400app/', host = '0.0.0.0', port = 3838)"]