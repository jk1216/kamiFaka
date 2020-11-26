FROM baiyuetribe/kamifaka:v1.3
LABEL 维护者="佰阅 2894049053@qq.com"

# 备选数据库Sqlite \Mysql \ PostgreSQL
ENV DB_TYPE='PostgreSQL'

WORKDIR /usr/src/app

RUN echo "<!DOCTYPE html><html lang='zh-cn'><head><meta charset='utf-8'><meta http-equiv='X-UA-Compatible' content='IE=edge'><meta name='viewport' content='width=device-width,initial-scale=1'><link rel='icon' href='images/favicon.ico'><link href='https://cdn.jsdelivr.net/gh/Baiyuetribe/kamifaka@v1.3/dist/static/css/vendor.0784d59c.css' rel='stylesheet'><link href='https://cdn.jsdelivr.net/gh/Baiyuetribe/kamifaka@v1.3/dist/static/css/styles.da19693f.css' rel='stylesheet'></head><body><noscript><strong>We're sorry but kamifaka doesn't work properly without JavaScript enabled. Please enable it to            continue.</strong></noscript><div id='app'></div><script src='https://cdn.jsdelivr.net/gh/Baiyuetribe/kamifaka@v1.3/dist/static/js/vendor.aa000dcd.js'></script><script src='https://cdn.jsdelivr.net/gh/Baiyuetribe/kamifaka@v1.3/dist/static/js/styles.61405570.js'></script><script src='https://cdn.jsdelivr.net/gh/Baiyuetribe/kamifaka@v1.3/dist/static/js/app.383e05ff.js'></script></body></html>" > /usr/src/app/dist/index.html

RUN sed -i 's|postgresql+psycopg2://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_DATABASE}|$DATABASE_URL|g' docker-entrypoint.sh && \
    sed -i 's|8000|$PORT|g' docker-entrypoint.sh && \
    chmod +x docker-entrypoint.sh

EXPOSE $PORT

ENTRYPOINT [ "/usr/src/app/docker-entrypoint.sh" ]
